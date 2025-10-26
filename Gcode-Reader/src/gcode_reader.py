#!/usr/bin/env python3
# -*- coding: utf-8 -*-
##################################
# University of Wisconsin-Madison
# Author: Yaqi Zhang
##################################
"""
Gcode reader for both FDM (regular and Stratasys) and LPBF.
It supports the following functionalities
1. plot a layer in 2D, plot layers in 3D
2. list important information of path
3. animate the printing of a layer in 2D, animate the printing of layers in 3D
4. mesh the path, plot mesh, list important informations about the mesh

## below two features are under construction
5. compute closest left element and right element
6. shrink and convert FDM process plan to PBF S-Code
"""

# standard library
import argparse
import collections
from enum import Enum
import math
import os.path
import pprint
import statistics
import sys


# third party library
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as manimation
from mpl_toolkits.mplot3d import Axes3D
import pandas as pd
import seaborn as sns

# If there's a bundled ffmpeg under tools/ffmpeg, prefer that so users don't need it on PATH
try:
    _root = os.path.abspath(os.path.dirname(__file__) + os.path.sep + '..')
except Exception:
    _root = os.path.abspath('.')
_bundled_ffmpeg = os.path.join(_root, 'tools', 'ffmpeg')
if os.path.isdir(_bundled_ffmpeg):
    # search for ffmpeg.exe under the bundled folder
    for dirpath, dirnames, filenames in os.walk(_bundled_ffmpeg):
        if 'ffmpeg.exe' in filenames:
            _ff_path = os.path.join(dirpath, 'ffmpeg.exe')
            try:
                # set environment variable Matplotlib recognizes and also update PATH for subprocesses
                os.environ['FFMPEG_BINARY'] = _ff_path
                os.environ['PATH'] = dirpath + os.pathsep + os.environ.get('PATH', '')
                # try to set writer executable if available
                try:
                    manimation.writers.list()['ffmpeg']
                except Exception:
                    pass
                break
            except Exception:
                break

# sns.set()  # use seaborn style

# maximum element length in meshing
MAX_ELEMENT_LENGTH = 1 # FDM regular
# MAX_ELEMENT_LENGTH = 5 # FDM Stratasys
# MAX_ELEMENT_LENGTH = 10 # four-spirals scode
# MAX_ELEMENT_LENGTH = 50e-6 # LPBF
# MAX_ELEMENT_LENGTH = 100e-6 # LPBF (for plot mesh example)

# set true to keep support path
PLOT_SUPPORT = True

# set true to use one color for plot
# set false to use random color for plot
SINGLE_COLOR = False

# set true to plot scans with positive power in different color
# this is for powder bed fusion
PLOT_POWER = True
POWER_ZERO = 1
IGNORE_ZERO_POWER = True

# Element namedtuple
Element = collections.namedtuple('Element', ['x0', 'y0', 'x1', 'y1', 'z'])

# set true to add axis-label and title
FIG_INFO = False

# MARGIN RATIO
MARGIN_RATIO = 0.2

# zero tolerance for is_left check
ZERO_TOLERANCE = 1e-12

# global variables
pp = pprint.PrettyPrinter(indent=4)

### under construction
# plot polygon
HALF_WIDTH = 0.6 # FDM regular
# HALF_WIDTH = 1.5 # FDM stratasys
# HALF_WIDTH = 50e-6

## This is for research...
# FDM regular: current 0.5 mm = 500 mu, target 50 mu
# FDM stratasys: current 1.4 mm = 1400 mu, target 50 mu
# HORIZONTAL_SHRINK_RATIO = 0.0001 # tweety and octo
# HORIZONTAL_SHRINK_RATIO = (1 / 1000) * (1 / (1400 / 50)) # mobius arm
# HORIZONTAL_SHRINK_RATIO = (1 / 1000) * (1 / (1500 / 50)) # bunny
# HORIZONTAL_SHRINK_RATIO = (1 / 1000) * (1 / (600 / 25)) # bunny
HORIZONTAL_SHRINK_RATIO = (1 / 1000) * (1 / (600 / 25)) # wrench
DELTA_Z = 2e-5

LASER_POWER = 195
LASER_SPEED = 0.8
TRAVEL_SPEED = 0.8


def axisEqual3D(ax):
    """set 3d axis equal."""
    extents = np.array([getattr(ax, 'get_{}lim'.format(dim))() for dim in 'xyz'])
    sz = extents[:,1] - extents[:,0]
    centers = np.mean(extents, axis=1)
    maxsize = max(abs(sz))
    r = maxsize/4
    for ctr, dim in zip(centers, 'xyz'):
        getattr(ax, 'set_{}lim'.format(dim))(ctr - r, ctr + r)


def save_figure(fig, filename, dpi):
    """
    save figure to a file

    Args:
        fig: figure object
        filename: outfilename
        dpi: dpi of the figure
    """
    _, ext = filename.rsplit('.', 1)
    fig.savefig(filename, format=ext, dpi=dpi, bbox_inches='tight')
    print('saving to {:s} with {:d} DPI'.format(filename, dpi))


def create_axis(figsize=(8, 8), projection='2d'):
    """
    create axis based on figure size and projection
    returns fig, ax

    Args:
        figsize: size of the figure
        projection: dimension of figure

    Returns:
        fig, ax
    """
    projection = projection.lower()
    if projection not in ['2d', '3d']:
        raise ValueError
    if projection == '2d':
        fig, ax = plt.subplots(figsize=figsize)
    else:  # '3d'
        fig = plt.figure(figsize=figsize)
        ax = fig.add_subplot(111, projection='3d')
    return fig, ax


def create_movie_writer(title='Movie Writer', fps=15):
    """
    create ffmpeg writer

    Args:
        title: title of the movie writer
        fps: frames per second

    Returns:
        movie writer
    """
    FFMpegWriter = manimation.writers['ffmpeg']
    metadata = dict(title=title, artist='Matplotlib',
                    comment='Movie Support')
    writer = FFMpegWriter(fps=15, metadata=metadata)
    return writer


def add_margin_to_axis_limits(min_v, max_v, margin_ratio=MARGIN_RATIO):
    """
    compute new min_v and max_v based on margin

    Args:
        min_v: minimum value
        max_v: maximum value
        margin_ratio:

    Returns:
        new_min_v, new_max_v
    """
    dv = (max_v - min_v) * margin_ratio
    return (min_v - dv, max_v + dv)


class LayerError(Exception):
    """ layer number error """
    pass


class GcodeType(Enum):
    """ enum of GcodeType """

    FDM_REGULAR = 1
    FDM_STRATASYS = 2
    LPBF_REGULAR = 3
    LPBF_SCODE = 4

    @classmethod
    def has_value(cls, value):
        return any(value == item.value for item in cls)


class GcodeReader:
    """ Gcode reader class """

    def __init__(self, filename, filetype=GcodeType.FDM_REGULAR):
        if not os.path.exists(filename):
            print("{} does not exist!".format(filename))
            sys.exit(1)
        self.filename = filename
        self.filetype = filetype
        # print(self.filetype)
        self.n_segs = 0  # number of line segments
        self.segs = None  # list of line segments [(x0, y0, x1, y1, z)]
        self.n_layers = 0  # number of layers
        # seg_index_bars and subpath_index_bars have the same format
        # e.g. ith layer has segment indexes [seg_index_bars[i-1],
        # seg_index_bars[i])
        self.seg_index_bars = []
        self.subpath_index_bars = []
        self.summary = None
        self.lengths = None
        self.subpaths = None
        self.xyzlimits = None
        self.elements = None
        self.elements_index_bars = []
        # read file to populate variables
        self._read()

    def mesh(self, max_length):
        """ mesh segments according to max_length """
        self.elements = []
        self.elements_index_bars = []
        bar = 0
        n_eles = 0
        if not hasattr(self, 'powers'):
            self.powers = [POWER_ZERO + 10] * len(self.segs)
        for i, (x0, y0, x1, y1, z) in enumerate(self.segs):
            if i == self.seg_index_bars[bar]:
                bar += 1
                self.elements_index_bars.append(n_eles)
            power = self.powers[i]
            if power < POWER_ZERO:
                continue
            length = np.hypot(x0 - x1, y0 - y1)
            n_slices = int(np.ceil(length / max_length))
            n_eles += n_slices
            dx = (x1 - x0) / n_slices
            dy = (y1 - y0) / n_slices
            for _ in range(n_slices - 1):
                # self.elements.append((x0, y0, x0 + dx, y0 + dy, z))
                self.elements.append(Element(x0, y0, x0 + dx, y0 + dy, z))
                x0, y0 = x0 + dx, y0 + dy
            # self.elements.append((x0, y0, x1, y1, z))
            self.elements.append(Element(x0, y0, x1, y1, z))
        self.elements_index_bars.append(n_eles)
        # print(self.elements_index_bars)
        print("Meshing finished, {:d} elements generated".
              format(len(self.elements)))

    def plot_mesh_layer(self, layernum, ax=None):
        """ plot mesh in one layer """
        if not self.elements:
            self.mesh(max_length=MAX_ELEMENT_LENGTH)
        fig, ax = self.plot_layer(layer=layernum)
        # if not ax:
        #    fig, ax = create_axis(projection='2d')
        left, right = self.elements_index_bars[layernum - 1:layernum + 1]
        print(left, right)
        for x0, y0, x1, y1, _ in self.elements[left:right]:
            # ax.plot([x0, x1], [y0, y1], 'b-')
            # ax.scatter(0.5 * (x0 + x1), 0.5 * (y0 + y1), s=4, color='r')
            ax.plot([0.5 * (x0 + x1)], [0.5 * (y0 + y1)], 'ro', markersize=4)
        return fig, ax

    def convert_to_scode(self):
        """ convert path to scode file. """
        name, _ = self.filename.rsplit('.', 1)
        outpath = "{}.scode".format(name)
        old_z = -np.inf
        z = -DELTA_Z
        old_x0 = old_y0 = old_x1 = old_y1 = -np.inf
        with open(outpath, 'w') as out_f:
            out_f.write('# x1 y1 x2 y2 z power speed \n')
            for x0, y0, x1, y1, cur_z in self.segs:
                x0 *= HORIZONTAL_SHRINK_RATIO
                y0 *= HORIZONTAL_SHRINK_RATIO
                x1 *= HORIZONTAL_SHRINK_RATIO
                y1 *= HORIZONTAL_SHRINK_RATIO
                if old_x0 != -np.inf and (old_x1 != x0 or old_y1 != y0 or cur_z != old_z):
                    out_f.write("{:.8f} {:.8f} {:.8f} {:.8f} {:.8f} {:d} {:.4f}\n".format(old_x1, old_y1, x0, y0, z, 0, TRAVEL_SPEED))
                if cur_z > old_z:
                    z += DELTA_Z
                    old_z = cur_z
                old_x0 = x0
                old_y0 = y0
                old_x1 = x1
                old_y1 = y1
                # check if two segs are connected
                out_f.write("{:.8f} {:.8f} {:.8f} {:.8f} {:.8f} {:d} {:.4f}\n".format(x0, y0, x1, y1, z, LASER_POWER, LASER_SPEED))
        print('Save path to s-code file {}'.format(outpath))

    def plot_mesh(self, ax=None):
        """ plot mesh """
        if not self.elements:
            self.mesh()
        if not ax:
            fig, ax = create_axis(projection='3d')
        for x0, y0, x1, y1, z in self.elements:
            ax.plot([x0, x1], [y0, y1], [z, z], 'b-')
            ax.scatter(0.5 * (x0 + x1), 0.5 * (y0 + y1), z, 'r', s=4,
                       color='r')
        return fig, ax

    def _read(self):
        """
        read the file and populate self.segs, self.n_segs and
        self.seg_index_bars
        """
        if self.filetype == GcodeType.FDM_REGULAR:
            self._read_fdm_regular()
        elif self.filetype == GcodeType.FDM_STRATASYS:
            self._read_fdm_stratasys()
        elif self.filetype == GcodeType.LPBF_REGULAR:
            self._read_lpbf_regular()
        elif self.filetype == GcodeType.LPBF_SCODE:
            self._read_lpbf_scode()
        else:
            print("file type is not supported")
            sys.exit(1)
        self.xyzlimits = self._compute_xyzlimits(self.segs)

    def _compute_xyzlimits(self, seg_list):
        """ compute axis limits of a segments list """
        xmin, xmax = float('inf'), -float('inf')
        ymin, ymax = float('inf'), -float('inf')
        zmin, zmax = float('inf'), -float('inf')
        for x0, y0, x1, y1, z in seg_list:
            xmin = min(x0, x1) if min(x0, x1) < xmin else xmin
            ymin = min(y0, y1) if min(y0, y1) < ymin else ymin
            zmin = z if z < zmin else zmin
            xmax = max(x0, x1) if max(x0, x1) > xmax else xmax
            ymax = max(y0, y1) if max(y0, y1) > ymax else ymax
            zmax = z if z > zmax else zmax
        return (xmin, xmax, ymin, ymax, zmin, zmax)

    def _read_lpbf_regular(self):
        """ read regular LPBF gcode """
        with open(self.filename, 'r') as infile:
            # read nonempty lines
            lines = (line.strip() for line in infile.readlines()
                     if line.strip())
            # only keep line that starts with 'N'
            lines = (line for line in lines if line.startswith('N'))
        # pp.pprint(lines) # for debug
        self.segs = []
        self.powers = []
        temp = -float('inf')
        ngxyzfl = [temp, temp, temp, temp, temp, temp, temp]
        d = dict(zip(['N', 'G', 'X', 'Y', 'Z', 'F', 'L'], range(7)))
        seg_count = 0
        for line in lines:
            old_ngxyzfl = ngxyzfl[:]
            tokens = line.split()
            for token in tokens:
                ngxyzfl[d[token[0]]] = float(token[1:])
            if ngxyzfl[d['Z']] > old_ngxyzfl[d['Z']]:
                self.n_layers += 1
                self.seg_index_bars.append(seg_count)
            if (ngxyzfl[1] == 1 and ngxyzfl[2:4] != old_ngxyzfl[2:4]
                    and ngxyzfl[4] == old_ngxyzfl[4]
                    and ngxyzfl[5] > 0):
                x0, y0, z = old_ngxyzfl[2:5]
                x1, y1 = ngxyzfl[2:4]
                self.segs.append((x0, y0, x1, y1, z))
                self.powers.append(ngxyzfl[-1])
                seg_count += 1
        self.n_segs = len(self.segs)
        self.segs = np.array(self.segs)
        self.seg_index_bars.append(self.n_segs)
        # print(self.n_layers)
        # print(self.powers)
        assert(len(self.seg_index_bars) - self.n_layers == 1)

    def _read_lpbf_scode(self):
        """ read LPBF scode """
        with open(self.filename, 'r') as infile:
            # read nonempty lines
            lines = (line.strip() for line in infile.readlines()
                    if line.strip())
            # only keep line that not starts with '#'
            lines = (line for line in lines if not line.startswith('#'))
        # pp.pprint(lines) # for debug
        self.segs = []
        self.powers = []
        seg_count = 0
        old_z = -np.inf
        for line in lines:
            x0, y0, x1, y1, z, power, speed = map(float, line.split())
            if z > old_z:
                self.n_layers += 1
                self.seg_index_bars.append(seg_count)
                old_z = z
            self.segs.append((x0, y0, x1, y1, z))
            self.powers.append(power)
            seg_count += 1
        self.n_segs = len(self.segs)
        self.segs = np.array(self.segs)
        # print(self.segs)
        self.seg_index_bars.append(self.n_segs)
        assert(len(self.seg_index_bars) - self.n_layers == 1)

    def _read_fdm_regular(self):
        """ read fDM regular gcode type """
        # Read file and perform targeted skipping of setup/wipe blocks
        START_KEYWORDS = [
            'flush_start', 'flush', 'wipe', 'wipe nozzle', 'nozzle load',
            'extrude cali', 'extrude cali test', 'mech mode', 'remove waste',
            'wipe and shake', 'brush material wipe nozzle', 'nozzle load line'
        ]
        END_KEYWORDS = ['end', 'end ', 'end of', 'flush_end', 'wipe end']
        MAX_SKIP_LINES = 500
        with open(self.filename, 'r') as infile:
            raw_all = [line.rstrip('\n') for line in infile.readlines() if line.strip()]
        new_lines = []
        skip = False
        skipped_count = 0
        for line_orig in raw_all:
            low = line_orig.lower()
            # detect comment-started blocks to skip
            if low.strip().startswith(';'):
                if not skip and any(kw in low for kw in START_KEYWORDS):
                    skip = True
                    skipped_count = 0
                    continue
                if skip and any(kw in low for kw in END_KEYWORDS):
                    skip = False
                    skipped_count = 0
                    continue
            if skip:
                skipped_count += 1
                if skipped_count > MAX_SKIP_LINES:
                    # safety: stop skipping after a long block
                    skip = False
                    skipped_count = 0
                continue
            # strip inline comments starting with ';'
            idx = line_orig.find(';')
            if idx != -1:
                line = line_orig[:idx]
            else:
                line = line_orig
            line = line.strip()
            if not line:
                continue
            # keep G-commands (G1/G2/G3...) and M-commands (so we can detect M82/M83)
            if line.startswith('G') or line.startswith('M'):
                new_lines.append(line)
        lines = new_lines
        # pp.pprint(lines) # for debug
        self.segs = []
        # sentinel for unset values
        temp = -float('inf')
        # keep last seen values for G, X, Y, Z, E, F
        gxyzef = [temp, temp, temp, temp, temp, temp]
        d = dict(zip(['G', 'X', 'Y', 'Z', 'E', 'F'], range(6)))
        seg_count = 0
        mx_z = -math.inf
        # track whether extrusion distances are absolute (M82) or relative (M83)
        absolute_extrusion = True
        # cumulative E used for detection when in relative mode
        cum_e = 0.0
        for line in lines:
            old_gxyzef = gxyzef[:]
            tokens = line.split()
            # handle M-codes that affect extrusion mode
            if tokens and tokens[0].startswith('M'):
                # check for M82 (absolute E) and M83 (relative E)
                code = tokens[0][1:]
                if code == '82':
                    absolute_extrusion = True
                elif code == '83':
                    absolute_extrusion = False
                # still continue to next line because M-codes don't produce segments
                # (but we kept them so we can detect extrusion mode)
                # however, other M-codes may carry parameters we don't need here
                # so skip further parsing of this line
                continue
            # parse tokens and update last seen values
            for token in tokens:
                if not token:
                    continue
                key = token[0]
                if key in d:
                    try:
                        val = float(token[1:])
                    except Exception:
                        # skip tokens we can't parse
                        continue
                    gxyzef[d[key]] = val
            # compute current cumulative E depending on extrusion mode
            old_cum_e = cum_e
            if gxyzef[d['E']] != temp:
                if absolute_extrusion:
                    cum_e = gxyzef[d['E']]
                else:
                    # relative: add the listed E increment/decrement
                    cum_e = cum_e + gxyzef[d['E']]
            # treat G1, G2, G3 as motion moves that may extrude
            gcode_val = gxyzef[d['G']]
            try:
                gcode_int = int(gcode_val) if gcode_val != temp else None
            except Exception:
                gcode_int = None
            # Only create segments when we have valid previous and current
            # X/Y/Z coordinates (not sentinel values). This avoids creating
            # spurious long lines when the parser hasn't encountered a
            # real position yet. Also ensure the move actually extrudes
            # (cum_e increased).
            valid_old_xy = old_gxyzef[1] != temp and old_gxyzef[2] != temp
            valid_new_xy = gxyzef[1] != temp and gxyzef[2] != temp
            valid_old_z = old_gxyzef[3] != temp
            valid_new_z = gxyzef[3] != temp

            if (gcode_int in (1, 2, 3)
                    and valid_old_xy and valid_new_xy and valid_old_z and valid_new_z
                    and (gxyzef[1:3] != old_gxyzef[1:3])
                    and gxyzef[3] == old_gxyzef[3]
                    and cum_e > old_cum_e):
                # update layer here (only when Z is a real value)
                if gxyzef[3] != temp and gxyzef[3] > mx_z:
                    mx_z = gxyzef[3]
                    self.n_layers += 1
                    self.seg_index_bars.append(seg_count)
                x0, y0, z = old_gxyzef[1:4]
                x1, y1 = gxyzef[1:3]
                self.segs.append((x0, y0, x1, y1, z))
                seg_count += 1
        self.n_segs = len(self.segs)
        self.n_segs = len(self.segs)
        # post-process: trim early calibration/flush moves that occur at
        # very large Z (pre-print sequences). Heuristic: find the first
        # segment with Z <= Z_TRIM_THRESHOLD and if there are a
        # significant number of segments after it, drop earlier segments.
        self.segs = np.array(self.segs)
        try:
            zvals = self.segs[:, 4]
            Z_TRIM_THRESHOLD = 5.0  # mm; segments above this are likely pre-print
            MIN_KEEP_AFTER_TRIM = 50
            idxs = np.where(zvals <= Z_TRIM_THRESHOLD)[0]
            if len(idxs) > 0 and (len(zvals) - idxs[0]) >= MIN_KEEP_AFTER_TRIM:
                trim_idx = idxs[0]
                # keep only segments from trim_idx onwards
                self.segs = self.segs[trim_idx:]
                print(f"Trimmed {trim_idx} initial high-Z segments (Z > {Z_TRIM_THRESHOLD} mm)")
            # Also trim any leading segments that are outside the central build
            # area (e.g., nozzle wipes, flush moves). Compute a central box
            # using 5th..95th percentiles of segment midpoints and drop any
            # leading segments that fall outside until we reach the first
            # segment inside the central box.
            if len(self.segs) > MIN_KEEP_AFTER_TRIM:
                mids = 0.5 * (self.segs[:, :2] + self.segs[:, 2:4])
                xs = mids[:, 0]
                ys = mids[:, 1]
                xlo5, xhi95 = np.percentile(xs, 5), np.percentile(xs, 95)
                ylo5, yhi95 = np.percentile(ys, 5), np.percentile(ys, 95)
                inside = (xs >= xlo5) & (xs <= xhi95) & (ys >= ylo5) & (ys <= yhi95)
                # find first index inside central box
                ins_idxs = np.where(inside)[0]
                if len(ins_idxs) > 0:
                    first_inside = int(ins_idxs[0])
                    if first_inside > 0 and (len(self.segs) - first_inside) >= MIN_KEEP_AFTER_TRIM:
                        self.segs = self.segs[first_inside:]
                        print(f"Trimmed {first_inside} leading out-of-area segments (central box 5-95%%)")
            # midpoint-based outlier filtering: compute midpoint percentiles
            # and drop segments whose midpoints lie well outside the 1..99%% range.
            if len(self.segs) > 10:
                mids = 0.5 * (self.segs[:, :2] + self.segs[:, 2:4])
                xs = mids[:, 0]
                ys = mids[:, 1]
                xlo, xhi = np.percentile(xs, 0.5), np.percentile(xs, 99.5)
                ylo, yhi = np.percentile(ys, 0.5), np.percentile(ys, 99.5)
                x_margin = max((xhi - xlo) * 0.05, 1e-6)
                y_margin = max((yhi - ylo) * 0.05, 1e-6)
                keep = (xs >= xlo - x_margin) & (xs <= xhi + x_margin) & (
                    ys >= ylo - y_margin) & (ys <= yhi + y_margin)
                n_drop = int((~keep).sum())
                # only apply filtering when a non-trivial number of segments
                # would be removed (avoid aggressive trimming of valid parts)
                if n_drop > max(10, int(0.005 * len(self.segs))):
                    print(f"Filtered out {n_drop} outlier segments by midpoint percentile bounds")
                    self.segs = self.segs[keep]
        except Exception:
            # if anything goes wrong, fall back to untrimmed data
            pass
        self.n_segs = len(self.segs)
        # recompute seg_index_bars and n_layers conservatively from segments
        self.seg_index_bars = [0]
        self.n_layers = 0
        mx_z = -math.inf
        z_values = set()  # Keep track of unique Z values
        
        # First pass - collect unique Z values
        for _, _, _, _, z in self.segs:
            z_values.add(z)
        z_values = sorted(list(z_values))  # Sort Z values
        print(f"Found {len(z_values)} unique Z heights: {z_values}")
        
        # Second pass - build layer indices based on sorted Z values
        current_z_idx = 0
        self.n_layers = len(z_values)
        
        for i, (_, _, _, _, z) in enumerate(self.segs):
            if current_z_idx < len(z_values) - 1 and z >= z_values[current_z_idx + 1]:
                current_z_idx += 1
                self.seg_index_bars.append(i)
                
        # Add final index
        self.seg_index_bars.append(self.n_segs)
        
        print(f"Number of layers detected: {self.n_layers}")
        print(f"Layer boundaries (seg_index_bars): {self.seg_index_bars}")
        
        # Validate layer structure
        if len(self.seg_index_bars) - self.n_layers != 1:
            print("Warning: Layer structure validation failed")
            print(f"seg_index_bars length: {len(self.seg_index_bars)}")
            print(f"n_layers: {self.n_layers}")
            # Don't fallback to single layer - we want to keep the actual layer structure
            # Just ensure the layers are properly bounded
            if len(self.seg_index_bars) < 2:
                self.seg_index_bars = [0, self.n_segs]
                self.n_layers = 1

    def _read_fdm_stratasys(self):
        """ read stratasys fdm G-code file """
        self.areas = []
        self.is_supports = []
        self.styles = []
        self.deltTs = []
        self.segs = []
        temp = -float('inf')
        # x, y, z, area, deltaT, is_support, style
        xyzATPS = [temp, temp, temp, temp, temp, False, '']
        seg_count = 0
        with open(self.filename, 'r') as in_file:
            lines = in_file.readlines()
            # means position denoted by the line is the start of subpath
            is_start = True
            for line in lines:
                # filter out supports path
                if not PLOT_SUPPORT and 'True' in line:
                    continue
                if line.startswith('#'):
                    continue
                if not line.strip():  # skip empty line
                    start = True
                    continue
                old_xyzATPS = xyzATPS[:]
                tokens = line.split()
                # print(tokens)
                xyzATPS[:5] = [float(token) for token in tokens[:5]]
                xyzATPS[5] = bool(tokens[5])
                xyzATPS[6] = tokens[6]
                if xyzATPS[2] != old_xyzATPS[2]:  # z value
                    self.seg_index_bars.append(seg_count)
                    self.n_layers += 1
                elif not start:
                    # make sure is_support and style do not change
                    assert(xyzATPS[5:] == old_xyzATPS[5:])
                    x0, y0 = old_xyzATPS[:2]
                    x1, y1, z = xyzATPS[:3]
                    self.segs.append((x0, y0, x1, y1, z))
                    seg_count += 1
                    self.areas.append(xyzATPS[3])
                    self.deltTs.append(xyzATPS[4])
                    self.is_supports.append(xyzATPS[5])
                    self.styles.append(xyzATPS[6])
                start = False
            self.n_segs = len(self.segs)
            self.segs = np.array(self.segs)
            self.seg_index_bars.append(self.n_segs)
            # print(self.seg_index_bars)

    def _compute_subpaths(self):
        """ compute subpaths
            a subpath is represented by (xs, ys, zs)
            subpath makes it easier to plot
        """
        if not self.subpaths:
            self.subpaths = []
            self.subpath_index_bars = [0]
            x0, y0, x1, y1, z = self.segs[0, :]
            xs, ys, zs = [x0, x1], [y0, y1], [z, z]
            mx_z = zs[-1]
            for x0, y0, x1, y1, z in self.segs[1:, :]:
                if x0 != xs[-1] or y0 != ys[-1] or z != zs[-1]:
                    self.subpaths.append((xs, ys, zs))
                    # if z != zs[-1]:
                    if z > mx_z:
                        mx_z = z
                        self.subpath_index_bars.append(len(self.subpaths))
                    xs, ys, zs = [x0, x1], [y0, y1], [z, z]
                else:
                    xs.append(x1)
                    ys.append(y1)
                    zs.append(z)
            if len(xs) != 0:
                self.subpaths.append((xs, ys, zs))
            self.subpath_index_bars.append(len(self.subpaths))
            # print(self.subpath_index_bars)
            # print(self.segs)


    def _compute_center_distance(self, i, j):
        """compute center distance between element i and j."""
        n = len(self.elements)
        assert(i < n and j < n)
        elements = self.elements
        ax = 0.5 * (elements[i].x0 + elements[i].x1)
        ay = 0.5 * (elements[i].y0 + elements[i].y1)
        bx = 0.5 * (elements[j].x0 + elements[j].x1)
        by = 0.5 * (elements[j].y0 + elements[j].y1)
        return math.sqrt((ax - bx) ** 2 + (ay - by) ** 2)


    def _compute_parallel_distance(self, i, j):
        """compute the parallel distance between element i and j."""
        n = len(self.elements)
        assert(i < n and j < n)
        elements = self.elements
        x = 0.5 * (elements[i].x0 + elements[i].x1)
        y = 0.5 * (elements[i].y0 + elements[i].y1)
        ax, ay, bx, by, _ = elements[j]
        dx = ax - bx
        dy = ay - by
        deno = math.sqrt(dx * dx + dy * dy)
        nume = abs((by - ay) * x - (bx - ax) * y + bx * ay - by * ax)
        return nume / deno


    def _is_element_nearly_parallel(self, i, j, threshold):
        """check if element i and element j are nearly parallel."""
        n = len(self.elements)
        assert(i < n and j < n)
        elements = self.elements
        ax, ay, bx, by, _ = elements[i]
        cx, cy, dx, dy, _ = elements[j]
        dx1 = bx - ax
        dy1 = by - ay
        dx2 = dx - cx
        dy2 = dy - cy
        cos_theta = abs((dx1 * dx2 + dy1 * dy2) / (math.sqrt((dx1 * dx1 + dy1 * dy1) * (dx2 * dx2 + dy2 * dy2))))
        return True if 1 - cos_theta < threshold else False

    def _is_element_left(self, i, j):
        """check if element j is on the left of element i."""
        n = len(self.elements)
        assert(i < n and j < n)
        assert(self.elements[i].z == self.elements[j].z)
        elements = self.elements
        ax, ay, bx, by, _ = elements[i]
        cx = 0.5 * (elements[j].x0 + elements[j].x1)
        cy = 0.5 * (elements[j].y0 + elements[j].y1)
        cross_product = (bx - ax) * (cy - ay) - (cx - ax) * (by - ay)
        if abs(cross_product) < ZERO_TOLERANCE:
            return 0
        else:
            return 1 if cross_product > 0 else -1


    def compute_nearest_neighbors(self, layer=0):
        """compute nearest neighbors for each element."""
        if not self.elements:
            self.mesh(max_length=MAX_ELEMENT_LENGTH)
        start_idx, end_idx = self.elements_index_bars[layer - 1:layer + 1]
        INF = math.inf
        left_neis = []
        right_neis = []
        print(start_idx, end_idx)
        for i in range(start_idx, end_idx):
            left_mn = INF
            right_mn = INF
            # left_is_left = 0
            # right_is_left = 0
            left_idx = -1
            right_idx = -1
            for j in range(start_idx, end_idx):
                if j == i:
                    continue
                if (self._is_element_nearly_parallel(i, j, 0.0001) and
                self._compute_center_distance(i, j) < 2.0 * HALF_WIDTH * 2):
                    is_left = self._is_element_left(i, j)
                    distance = self._compute_parallel_distance(i, j)
                    if distance < 0.4 * HALF_WIDTH * 2:
                        continue
                    # print(distance, is_left)
                    if is_left == 1:
                        if distance < left_mn:
                            left_idx = j
                            left_mn = distance
                    elif is_left == -1:
                        if distance < right_mn:
                            right_idx = j
                            right_mn = distance
            # print("{:d} {:f} {:f}".format(i, left_mn, right_mn))
            # if left_mn > 5:
            left_neis.append((left_idx, left_mn))
            right_neis.append((right_idx, right_mn))
        print("Finished computing left and right neighbors.")
        return left_neis, right_neis


    def plot_neighbors_layer(self, layer=0):
        """plot neighbors in a layer."""
        left_neis, right_neis = self.compute_nearest_neighbors(layer)
        #"""
        fig, ax = self.plot_mesh_layer(layer)
        left, right = self.elements_index_bars[layer - 1:layer + 1]
        print(left, right)
        es = self.elements
        for idx, (x0, y0, x1, y1, _) in enumerate(self.elements[left:right]):
            xc = 0.5 * (x0 + x1)
            yc = 0.5 * (y0 + y1)
            # ax.plot([0.5 * (x0 + x1)], [0.5 * (y0 + y1)], 'ro', markersize=1.5)
            left_idx, left_mn = left_neis[idx]
            if left_idx != -1:
                lx = 0.5 * (es[left_idx].x0 + es[left_idx].x1)
                ly = 0.5 * (es[left_idx].y0 + es[left_idx].y1)
                # print(left_mn, math.sqrt((lx - xc) ** 2 + (ly - yc) ** 2),self._compute_parallel_distance(idx, left_idx))
                ax.plot([xc, lx], [yc, ly], 'r-')
            right_idx, right_mn = right_neis[idx]
            if right_idx != -1:
                rx = 0.5 * (es[right_idx].x0 + es[right_idx].x1)
                ry = 0.5 * (es[right_idx].y0 + es[right_idx].y1)
                # print(left_mn, math.sqrt((lx - xc) ** 2 + (ly - yc) ** 2),self._compute_parallel_distance(idx, left_idx))
                ax.plot([xc, rx], [yc, ry], 'r-')
        #"""
        # plot histogram
        left_mns = [mn for idx, mn in left_neis if idx != -1]
        print("left median = {}".format(statistics.median(left_mns)))
        print("left mean = {}".format(statistics.mean(left_mns)))
        print("left min = {}".format(min(left_mns)))
        print("left max = {}".format(max(left_mns)))
        right_mns = [mn for idx, mn in right_neis if idx != -1]
        print("right median = {}".format(statistics.median(right_mns)))
        print("right mean = {}".format(statistics.mean(right_mns)))
        print("right min = {}".format(min(right_mns)))
        print("right max = {}".format(max(right_mns)))
        fig2, ax2 = plt.subplots(figsize=(8, 8))
        ax2.boxplot(left_mns)
        # return fig, ax
        return fig2, ax2

    def plot_polygon_layer(self, layer):
        """plot element polygons in one layer. """
        left_neis, right_neis = self.compute_nearest_neighbors(layer)
        fig, ax = self.plot_mesh_layer(layer)
        left, right = self.elements_index_bars[layer - 1:layer + 1]
        # print(left, right)
        es = self.elements
        for idx, (sx, sy, ex, ey, _) in enumerate(self.elements[left:right]):
            reverse = False
            if sx > ex or ey < sy:
                sx, sy, ex, ey = ex, ey, sx, sy
                reverse = True
            dx = ex - sx
            dy = ey - sy
            theta = np.arctan2(dy, dx)
            beta = theta + np.pi / 2.0
            lw = HALF_WIDTH
            left_idx, left_mn = left_neis[idx]
            if left_mn / 2 < lw:
                lw = left_mn / 2
            rw = HALF_WIDTH
            right_idx, right_mn = right_neis[idx]
            if right_mn / 2 < rw:
                rw = right_mn / 2
            if reverse:
                lw, rw = rw, lw
            x1 = sx - rw * np.cos(beta)
            y1 = sy - rw * np.sin(beta)
            x2 = ex - rw * np.cos(beta)
            y2 = ey - rw * np.sin(beta)
            x3 = ex + lw * np.cos(beta)
            y3 = ey + lw * np.sin(beta)
            x4 = sx + lw * np.cos(beta)
            y4 = sy + lw * np.sin(beta)
            ax.plot([x1, x2, x3, x4, x1], [y1, y2, y3, y4, y1], 'r-')
        return fig, ax


    def plot(self, color='blue', ax=None):
        """ plot the whole part in 3D """
        if not ax:
            fig, ax = create_axis(projection='3d')
        assert(self.n_segs > 0)
        self._compute_subpaths()
        for xs, ys, zs in self.subpaths:
            if SINGLE_COLOR:
                ax.plot(xs, ys, zs, color=color)
            else:
                ax.plot(xs, ys, zs)
        xmin, xmax, ymin, ymax, _, _ = self.xyzlimits
        # ax.set_xlim([xmin, xmax])
        # ax.set_ylim([ymin, ymax])
        ax.set_xlim(add_margin_to_axis_limits(xmin, xmax))
        ax.set_ylim(add_margin_to_axis_limits(ymin, ymax))
        return fig, ax

    def plot_layers(self, min_layer, max_layer, ax=None):
        """ plot the layers in [min_layer, max_layer) in 3D """
        if (min_layer >= max_layer or min_layer < 1 or max_layer >
                self.n_layers + 1):
            raise LayerError("Layer number is invalid!")
        self._compute_subpaths()
        if not ax:
            fig, ax = create_axis(projection='3d')
        left, right = (self.subpath_index_bars[min_layer - 1],
                       self.subpath_index_bars[max_layer - 1])
        for xs, ys, zs in self.subpaths[left: right]:
            ax.plot(xs, ys, zs)
        return fig, ax

    def plot_layer(self, layer=1, ax=None):
        """ plot a specific layer in 2D """
        if not isinstance(layer, int):
            raise LayerError("Layer number must be an integer")
        
        if layer < 1 or layer > self.n_layers:
            raise LayerError(f"Layer number must be between 1 and {self.n_layers}")
        
        if ax is None:
            plt.close('all')  # Clean up any existing figures
            fig = plt.figure(figsize=(10, 10))
            ax = fig.add_subplot(111)
        else:
            fig = ax.figure
        
        # Get segments for this layer only using seg_index_bars
        left = self.seg_index_bars[layer - 1]  # Start index for this layer
        right = self.seg_index_bars[layer]     # Start index for next layer
        
        if left >= right:
            print(f"Warning: Layer {layer} appears to be empty")
            return fig, ax
            
        # Plot only the segments for this layer
        layer_segs = self.segs[left:right]
        print(f"Plotting layer {layer} with {len(layer_segs)} segments")
        print(f"Layer Z height: {layer_segs[0][4]:.2f}mm")
        
        # Plot segments with small alpha for better visualization of overlaps
        for x0, y0, x1, y1, z in layer_segs:
            ax.plot([x0, x1], [y0, y1], 'b-', alpha=0.6, linewidth=1)
            
        # Set proper axis limits based on this layer's segments
        if len(layer_segs) > 0:
            x_coords = layer_segs[:, [0, 2]].flatten()  # All x coordinates
            y_coords = layer_segs[:, [1, 3]].flatten()  # All y coordinates
            xmin, xmax = np.min(x_coords), np.max(x_coords)
            ymin, ymax = np.min(y_coords), np.max(y_coords)
            # Add margins for better visualization
            margin = max(xmax - xmin, ymax - ymin) * 0.1
            ax.set_xlim([xmin - margin, xmax + margin])
            ax.set_ylim([ymin - margin, ymax + margin])
        
        # Add title with layer info
        ax.set_title(f'Layer {layer} (Z = {layer_segs[0][4]:.2f}mm)')
        ax.set_xlabel('X (mm)')
        ax.set_ylabel('Y (mm)')
        ax.set_aspect('equal')  # Maintain equal aspect ratio
        ax.grid(True)          # Add grid for better visualization
        
        return fig, ax

    def describe_mesh(self, max_length):
        """print basic information of meshing"""
        if not self.elements:
            self.mesh(max_length)
        self.mesh_lengths = [np.hypot(x1 - x0, y1 - y0) for x0, y0, x1, y1, _
                             in self.elements]
        series = pd.Series(self.mesh_lengths)
        print('1. Element length information:')
        print(series.describe())
        print('2. Number of layers: {:d}'.format(self.n_layers))
        data = {'# elements': np.array(self.elements_index_bars[1:]) -
                np.array(self.elements_index_bars[:-1]),
                'layer': np.arange(1, self.n_layers + 1),
                }
        df = pd.DataFrame(data)
        df = df.set_index('layer')
        print(df)

    def describe(self):
        """print basic information of process plan"""
        if not self.summary:
            self.lengths = [np.hypot(x1 - x0, y1 - y0) for x0, y0, x1, y1, _
                            in self.segs]
            series = pd.Series(self.lengths)
            self.summary = series.describe()
        print('1. Line segments information: ')
        print(self.summary)
        print('2. Number of layers: {:d}'.format(self.n_layers))
        self._compute_subpaths()
        if len(self.seg_index_bars) != len(self.subpath_index_bars):
            print("Warning: seg_index_bars/subpath_index_bars mismatch; fixing to single-layer grouping")
            # fallback: make the whole file a single layer to avoid crashes
            self.seg_index_bars = [0, self.n_segs]
            self.subpath_index_bars = [0, len(self.subpaths)]
            self.n_layers = 1
        """
        try:
            assert(len(self.seg_index_bars) == len(self.subpath_index_bars))
        except:
            print(len(self.seg_index_bars))
            print(len(self.subpath_index_bars))
            print(self.n_layers)
        """
        data = {'# segments': np.array(self.seg_index_bars[1:]) -
                np.array(self.seg_index_bars[:-1]),
                'layer': np.arange(1, self.n_layers + 1),
                '# subpaths': np.array(self.subpath_index_bars[1:]) -
                np.array(self.subpath_index_bars[:-1]),
                }
        df = pd.DataFrame(data)
        df = df.set_index('layer')
        print(df)
        print('3. Other information: ')
        print('Total path length equals {:0.4f}.'.format(sum(self.lengths)))
        # compute total travel lengths
        travels = []
        for i in range(len(self.subpaths) - 1):
            xsi, ysi, zsi = self.subpaths[i]
            xsj, ysj, zsj = self.subpaths[i + 1]
            travels.append(abs(xsj[0] - xsi[-1]) + abs(ysj[0] - ysi[-1])
                           + abs(zsj[0] - zsi[-1]))
        print("Total travel length equals {:0.4f}.".format(sum(travels)))
        if self.filetype == GcodeType.LPBF_REGULAR or self.filetype == GcodeType.LPBF_SCODE:
            print("Laser power range [{}, {}]".format(
                min(self.powers), max(self.powers)))
        print("Number of nozzle travels equals {:d}.".format(
            len(self.subpaths)))
        print("Number of subpaths equals {:d}.".format(len(self.subpaths)))
        print("X, Y and Z limits: [{:0.2f}, {:0.2f}] X [{:0.2f}, {:0.2f}] X [{:0.2f}, {:0.2f}]".format(
            *self.xyzlimits))

    def animate_layer(self, layer=1, animation_time=5, outfile=None):
        """
        animate the printing of a specific layer in 2D
        """
        if layer < 1 or layer > self.n_layers:
            raise LayerError("Layer number is invalid!")
        fig, ax = create_axis(projection='2d')
        if outfile:
            writer = create_movie_writer()
            writer.setup(fig, outfile=outfile, dpi=100)
        xmin, xmax, ymin, ymax, _, _ = self.xyzlimits
        # ax.set_xlim([xmin, xmax])
        # ax.set_ylim([ymin, ymax])
        ax.set_xlim(add_margin_to_axis_limits(xmin, xmax))
        ax.set_ylim(add_margin_to_axis_limits(ymin, ymax))
        ax.set_xlabel('x')
        ax.set_ylabel('y')
        ax.set_title("{:s}(layer = {:d})".format(self.filename, layer))
        if not FIG_INFO:
            ax.set_xticks([])
            ax.set_yticks([])
            ax.axis('off')
            ax.set_title("")
        # ax.set_title(self.fila)
        left, right = (self.seg_index_bars[layer - 1],
                       self.seg_index_bars[layer])
        seg_lst = self.segs[left: right]
        lens = np.array([abs(x0 - x1) + abs(y0 - y1) for x0, y0, x1, y1, z in
                         seg_lst])
        times = lens / lens.sum() * animation_time
        # print(times.sum())
        fig_num = fig.number
        try:
            for time, (x0, y0, x1, y1, _) in zip(times, seg_lst):
                # if the user closed the figure, stop the animation loop
                if not plt.fignum_exists(fig_num):
                    if outfile:
                        try:
                            writer.finish()
                        except Exception:
                            pass
                    print('Animation aborted (figure closed).')
                    return
                ax.plot([x0, x1], [y0, y1], 'b-')
                plt.pause(time)
                if outfile:
                    writer.grab_frame()
                plt.draw()
        finally:
            if outfile:
                try:
                    writer.finish()
                    print('Creating movie {:s}'.format(outfile))
                except Exception:
                    pass
            # show remains a no-op if the figure was closed
            try:
                plt.show()
            except Exception:
                pass

    def animate_layers(self, min_layer, max_layer=None, outfile=None):
        """
        animation of the print process of multiple layers [min_layer,
        max_layer)
        implement with plt.pause() and plt.draw()
        """
        if max_layer is None:
            max_layer = self.n_layers + 1
        if (min_layer >= max_layer or min_layer < 1 or max_layer >
                self.n_layers + 1):
            raise LayerError("Layer number is invalid!")
        left, right = (self.subpath_index_bars[min_layer - 1],
                       self.subpath_index_bars[max_layer - 1])
        fig, ax = create_axis(projection='3d')
        if outfile:
            writer = create_movie_writer()
            writer.setup(fig, outfile=outfile, dpi=100)
        xmin, xmax, ymin, ymax, zmin, zmax = self.xyzlimits
        ax.set_xlim([xmin, xmax])
        ax.set_ylim([ymin, ymax])
        if zmax > zmin:
            ax.set_zlim([zmin, zmax])
        fig_num = fig.number
        try:
            for sub_path in self.subpaths[left:right]:
                # stop if figure closed
                if not plt.fignum_exists(fig_num):
                    if outfile:
                        try:
                            writer.finish()
                        except Exception:
                            pass
                    print('Animation aborted (figure closed).')
                    return
                xs, ys, zs = sub_path
                ax.plot(xs, ys, zs)
                if outfile:
                    writer.grab_frame()
                plt.pause(0.1)
                plt.draw()
        finally:
            if outfile:
                try:
                    writer.finish()
                    print('Creating movie {:s}'.format(outfile))
                except Exception:
                    pass
        if outfile:
            writer.finish()
            print('Creating movie {:s}'.format(outfile))
        plt.show()


def get_parser():
    """set up parser and return it"""
    parser = argparse.ArgumentParser(description='Gcode Reader')
    parser.add_argument(dest='gcode_file', action='store',
            help='specify path of the input gcode file')
    parser.add_argument('-t', '--type', dest='filetype', help="""File Type
            1: Regular FDM; 2: Stratasys FDM; 3: Regular LPBF; 4: Scode LPBF""",
                        required=True, type=int, action='store')
    parser.add_argument('-l', '--layer', dest='plot_layer_idx', action='store',
                        type=int, help='plot a layer in 2D')
    parser.add_argument('-a', '--animation', dest='ani_layer_idx',
                        action='store', type=int, help='animate printing of a layer in 2D')
    parser.add_argument('-m', '--mesh', dest='mesh_layer_idx', action='store',
                        type=int, help='plot the mesh of a layer in 2D')
    parser.add_argument('-p', '--plot', dest='plot3d', action='store_true',
                        help='plot the whole part')
    parser.add_argument('-s', '--save', dest='outfile', action='store',
                        help='specify the path of output file')
    ### below part is in construction
    #"""
    parser.add_argument('-conv', '--convert', dest='convert', action='store_true', 
            help='convert FDM path to LPBF scode')
    parser.add_argument('-nei', '--neighbor', dest='neighbor_layer_idx',
            action='store', default=-1, type=int, help='plot nearest neighbor of each element in one layer')
    parser.add_argument('-poly', '--polygon', dest='polygon_layer_idx',
            action='store', default=-1, type=int, help='plot element polygon in one layer')
    #"""
    return parser


def command_line_runner():
    """ command line runner """
    # 1. parse arguments
    parser = get_parser()
    args = parser.parse_args()
    # pp.pprint(args)

    # 2. handle Gcode file type
    if not GcodeType.has_value(args.filetype):
        print('Invalid G-code file type: {:d}'.format(args.filetype))
        print('Valid types are listed below')
        for gcode_type in GcodeType:
            print('{:s} : {:d}'.format(gcode_type.name, gcode_type.value))
        sys.exit(1)
    else:
        filetype = GcodeType(args.filetype)
    # construct Gcode Reader object
    gcode_reader = GcodeReader(filename=args.gcode_file, filetype=filetype)

    # 3. print out some statistic information to standard output
    gcode_reader.describe()

    ## describe meshing results
    # gcode_reader.describe_mesh(max_length=MAX_ELEMENT_LENGTH)

    # 4. plot the part in 3D, plot a layer in 2D, animate the printing process
    # of single layer in 2D, mesh and plot a layer in 2D
    if args.plot3d:
        fig, ax = gcode_reader.plot()
    else:
        if args.plot_layer_idx:
            fig, ax = gcode_reader.plot_layer(layer=args.plot_layer_idx)
        elif args.ani_layer_idx:
            # create default movie outfile next to the input gcode file (under cwd)
            base_name = os.path.basename(args.gcode_file)
            name, _ = base_name.rsplit('.', 1)
            gcode_dir = os.path.dirname(args.gcode_file)
            if gcode_dir:
                out_dir = os.path.join(os.path.abspath('.'), gcode_dir)
            else:
                out_dir = os.path.abspath('.')
            movie_out = os.path.join(out_dir, f"{name}_layer{args.ani_layer_idx}.mp4")
            print(f"Saving animation to: {movie_out}")
            gcode_reader.animate_layer(layer=args.ani_layer_idx, outfile=movie_out)
        elif args.mesh_layer_idx:
            fig, ax = gcode_reader.plot_mesh_layer(layernum=args.mesh_layer_idx)

    ## Below part is under construction
    # 5. convert FDM G-Code to PBF S-Code
    if args.convert:
        gcode_reader.convert_to_scode()

    # 6. plot contact graph in 2D
    if args.neighbor_layer_idx != -1:
        # gcode_reader.compute_nearest_neighbors()
        fig, ax = gcode_reader.plot_neighbors_layer(layer=args.neighbor_layer_idx)

    # 7. plot mesh (representing elements using polygons)
    if args.polygon_layer_idx != -1:
        fig, ax = gcode_reader.plot_polygon_layer(layer=args.polygon_layer_idx)

    # specify title and x, y label, set axis
    if args.plot3d or args.plot_layer_idx or args.mesh_layer_idx:
        if args.plot3d:
            axisEqual3D(ax)
        if FIG_INFO:
            _, filename = args.gcode_file.rsplit(os.path.sep, 1)
            ax.set_title(filename)
            ax.set_xlabel('x')
            ax.set_ylabel('y')
            if ax.name == '3d':
                ax.set_zlabel('z')
        else:
            ax.set_xticks([])
            ax.set_yticks([])
            ax.axis('off')

    # save figure to file
    if args.outfile:
        save_figure(fig, args.outfile, dpi=100)
    plt.show()


if __name__ == "__main__":
    print("Gcode Reader")
    command_line_runner()