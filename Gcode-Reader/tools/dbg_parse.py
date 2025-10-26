import math
fp = r'c:\Users\aleca\MEGP4\Gcode-Reader\gcode\fdm_regular\LBdef.gcode'
lines = []
with open(fp, 'r') as infile:
    for line in infile:
        if line.strip():
            s = line
            idx = s.find(';')
            if idx != -1:
                s = s[:idx]
            s = s.strip()
            if s and (s.startswith('G') or s.startswith('M')):
                lines.append(s)

# parser state
temp = -float('inf')
gxyzef = [temp] * 6
d = dict(zip(['G','X','Y','Z','E','F'], range(6)))
seg_count = 0
mx_z = -math.inf
absolute_extrusion = True
cum_e = 0.0

for li, line in enumerate(lines[:200]):
    old = gxyzef[:]
    tokens = line.split()
    if tokens and tokens[0].startswith('M'):
        code = tokens[0][1:]
        if code == '82':
            absolute_extrusion = True
        elif code == '83':
            absolute_extrusion = False
        continue
    for token in tokens:
        key = token[0]
        if key in d:
            try:
                val = float(token[1:])
            except Exception:
                continue
            gxyzef[d[key]] = val
    old_cum = cum_e
    if gxyzef[d['E']] != temp:
        if absolute_extrusion:
            cum_e = gxyzef[d['E']]
        else:
            cum_e = cum_e + gxyzef[d['E']]
    gcode_val = gxyzef[d['G']]
    try:
        gcode_int = int(gcode_val) if gcode_val != temp else None
    except Exception:
        gcode_int = None
    valid_old_xy = old[1] != temp and old[2] != temp
    valid_new_xy = gxyzef[1] != temp and gxyzef[2] != temp
    valid_old_z = old[3] != temp
    valid_new_z = gxyzef[3] != temp
    if (gcode_int in (1,2,3) and valid_old_xy and valid_new_xy and valid_old_z and valid_new_z and (gxyzef[1:3] != old[1:3]) and gxyzef[3] == old[3] and cum_e > old_cum):
        print('SEG ADD', seg_count, 'line_idx', li, 'line:', line)
        print(' old_gxyzef=', old)
        print(' new_gxyzef=', gxyzef)
        seg_count += 1
