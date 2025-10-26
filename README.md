# MEGP4 Project

This repository contains multiple projects:

## Setup Instructions

### FFmpeg Setup
The G-code reader requires FFmpeg for animation features. To set it up:

1. Download FFmpeg Essentials build from: https://www.gyan.dev/ffmpeg/builds/
2. Extract the downloaded zip file
3. Place the extracted files in `Gcode-Reader/tools/ffmpeg/ffmpeg-8.0-essentials_build/`
   - Specifically, `ffmpeg.exe`, `ffplay.exe`, and `ffprobe.exe` should be in the `bin` subdirectory
4. The program will automatically detect and use these FFmpeg binaries

## AANT_pi_sim
A simulation system for pi calculations.

## Gcode-Reader
A Python-based G-code reader and visualizer that supports:
- FDM (regular and Stratasys) and LPBF G-code formats
- 2D layer visualization
- 3D visualization
- Animation of printing process
- Path analysis and statistics

### Features
- Plot individual layers in 2D
- Plot complete models in 3D
- Animate printing process
- Support for multiple G-code formats
- Path analysis and measurements
- Layer-by-layer inspection

### Usage
Basic usage examples:
```bash
# View a specific layer
python Gcode-Reader/src/gcode_reader.py -t 1 path/to/file.gcode -l <layer_number>

# View 3D model
python Gcode-Reader/src/gcode_reader.py -t 1 path/to/file.gcode -p

# Animate printing process
python Gcode-Reader/src/gcode_reader.py -t 1 path/to/file.gcode -a <layer_number>
```