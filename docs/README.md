# Diagrams

This folder contains draw.io diagrams for the MEGP4 3D Printer Digital Twin project.

## Files

### architecture_diagram.drawio
**System Architecture Overview**

Shows the three main components and their interactions:
- **Printer**: Sensor array, position tracking, state management, communication queues
- **ComputerPi**: Monitoring thread, error table, analysis logic, command sender, 6-step recovery protocol
- **GUI**: Layer view (2D animation), 3D model views, controls, log panel, callbacks

Includes data flow annotations showing the complete error detection and recovery cycle.

### workflow_fsm.drawio
**Error Recovery Finite State Machine**

State diagram showing:
- States: IDLE, PRINTING, ERROR_DETECTED, PAUSED, ANALYZING, UPDATING, RESUMING
- Transitions with conditions (sensor trigger, PAUSE/RESUME commands, solution found)
- Step annotations (Steps 1-6) overlaid on the relevant states/transitions
- Error paths (no solution → IDLE)

### communication_sequence.drawio
**Communication Sequence Diagram**

Detailed message flow between components:
- Actors: Sensor, Printer, ComputerPi, GUI, GcodeReader
- Messages: SENSOR_ALERT, PAUSE, UPDATE_GCODE, RESUME, callbacks
- Activation boxes showing processing time
- Numbered sequence (1-7) with annotations for each step

## How to Use

1. Open any `.drawio` file in:
   - **draw.io Desktop**: Download from https://www.drawio.com/
   - **draw.io Web**: Go to https://app.diagrams.net/
   - **VS Code Extension**: Install "Draw.io Integration" by Henning Dieterichs

2. To export as PNG/SVG/PDF:
   - File → Export as → [format]
   - Recommended: Export at 200% scale for high-quality images

3. To embed in documentation:
   - Export as PNG or SVG
   - Place in `docs/images/` folder
   - Reference in markdown: `![Architecture](docs/images/architecture.png)`

## Editing Tips

- **Colors**: Components use consistent colors matching their role (blue=Printer, red=ComputerPi, green=GUI)
- **Alignment**: Use "Arrange → Align" to keep elements lined up
- **Layers**: Each diagram uses a single page, but you can add pages for variations
- **Styles**: Consistent rounded rectangles for components, ellipses for states, arrows for flow

## Diagram Versions

Current version: 1.0 (November 10, 2025)
- Initial release with three core diagrams
- Based on single-sensor simplified demo configuration
- Reflects LBbaseline/LBdefected G-code naming
