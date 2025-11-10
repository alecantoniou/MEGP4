# MEGP4: 3D Printing Digital Twin and G-code Visualization

This repository contains two coordinated components:

- Gcode-Reader: Parse and visualize G-code in 2D/3D, including per-layer animations
- AANT_pi_sim + GUI: A simulated 3D printer and Raspberry Pi controller demonstrating pause → correct → resume workflow with live visualization

## Quickstart

Prerequisites:

- Python 3.9+ on Windows
- pip for installing Python packages
- Optional: FFmpeg on PATH for saving animations (visualization runs without it)

Install Python dependencies:

```powershell
pip install -r requirements.txt
```

Run the printer simulation GUI:

```powershell
python .\print_simulation\printer_simulator.py
```

What you’ll see:

- Left: Controls to Start/Pause/Resume/Stop and a button to trigger a simulated sensor error
- Middle: Current layer 2D view
- Right: 3D views of the original and updated models
- Bottom: A log of the ComputerPi ↔ Printer protocol as the system pauses, swaps G-code, and resumes

## Project Structure

- AANT_pi_sim/ – Core simulation of a Printer and a ComputerPi controller
- print_simulation/ – Tkinter/Matplotlib GUI that visualizes the print and orchestrates the workflow
- Gcode-Reader/ – Standalone parser/visualizer for G-code (used by the GUI - adopted from https://github.com/zhangyaqi1989/Gcode-Reader)

Key files:

- AANT_pi_sim/pi_sim_system.py – Printer and ComputerPi classes with a queue-based “serial” protocol
- print_simulation/printer_simulator.py – GUI application showing layer view and 3D models; trigger sensor to test recovery
- Gcode-Reader/src/gcode_reader.py – G-code parser and plotting utilities
- Gcode-Reader/gcode/fdm_regular/LBbaseline.gcode – Starting (defective) model
- Gcode-Reader/gcode/fdm_regular/LBdefected.gcode – Alternate (corrective) model sent after a sensor alert

## How the Simulation Works

1. Start Print begins a layer-by-layer simulation of the baseline model.
2. Trigger Error (sensor 0) sends a SENSOR_ALERT to ComputerPi containing the current position and layer.
3. ComputerPi pauses the print, looks up a corrective G-code, and issues an UPDATE_GCODE command.
4. The GUI loads the new G-code and updates the views.
5. ComputerPi resumes the print.

## Using Gcode-Reader Directly

Gcode-Reader supports multiple formats (FDM regular/Stratasys, LPBF) and can plot/animate:

```powershell
# View a specific layer
python .\Gcode-Reader\src\gcode_reader.py -t 1 .\Gcode-Reader\gcode\fdm_regular\LBbaseline.gcode -l 1

# View 3D model
python .\Gcode-Reader\src\gcode_reader.py -t 1 .\Gcode-Reader\gcode\fdm_regular\LBbaseline.gcode -p

# Animate printing of a layer (requires FFmpeg to save mp4)
python .\Gcode-Reader\src\gcode_reader.py -t 1 .\Gcode-Reader\gcode\fdm_regular\LBbaseline.gcode -a 1
```

### FFmpeg (optional)

If you want to save animations to mp4, download an FFmpeg build for Windows and ensure `ffmpeg.exe` is on PATH, or place the binaries under `Gcode-Reader/tools/ffmpeg/ffmpeg-8.0-essentials_build/bin`.

## Troubleshooting

- If plots don’t render, ensure you installed requirements and are using a Python with Tkinter support.
- If animations fail to save, verify FFmpeg is on PATH.
- The GUI adds local paths to `sys.path` to import Gcode-Reader; no extra setup is needed.

## License

This repository includes third-party code (Gcode-Reader) under its own LICENSE. See `Gcode-Reader/` for details.
