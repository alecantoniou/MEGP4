# 3D Printer Simulation System

A comprehensive simulation system that models the interaction between a 3D printer with sensors and a microcomputer (Raspberry Pi) running error detection and recovery software.

## Architecture

### Components

1. **Printer Class** (`pi_sim_system.py`)
   - Simulates a physical 3D printer with sensor array
   - Binary sensor array (0 = no error, 1 = error detected)
   - Maintains printer state (position, layer, printing status)
   - Simulated serial communication via queues
   - Sends sensor alerts and status updates to ComputerPi
   - Receives and executes commands from ComputerPi

2. **ComputerPi Class** (`pi_sim_system.py`)
   - Simulates a Raspberry Pi running the pi_sim error detection system
   - Monitors printer sensor array in real-time
   - Analyzes errors using error lookup table
   - Sends corrective commands to printer
   - Manages error recovery workflow

3. **PrinterSimulator GUI** (`printer_simulator.py`)
   - Interactive visualization interface
   - Displays current layer, 3D models, and system logs
   - Provides manual sensor trigger controls for testing
   - Shows real-time interaction between Printer and ComputerPi
   - Current demo uses a single sensor (ID 0) for generic error triggering

## Simulated Communication Protocol

The Printer and ComputerPi communicate through simulated serial connections using Python queues:

### Printer → ComputerPi (outgoing_data queue)

**Sensor Alert:**
```python
{
    'type': 'SENSOR_ALERT',
    'sensor_id': int,
    'position': {'x': float, 'y': float, 'z': float},
    'layer': int,
    'timestamp': float
}
```

**Status Update:**
```python
{
    'type': 'STATUS',
    'position': {'x': float, 'y': float, 'z': float},
    'layer': int,
    'total_layers': int,
    'is_printing': bool,
    'is_paused': bool,
    'sensors': [int, ...],  # Binary array
    'timestamp': float
}
```

### ComputerPi → Printer (incoming_commands queue)

**Pause Command:**
```python
{'type': 'PAUSE', 'timestamp': float}
```

**Resume Command:**
```python
{'type': 'RESUME', 'timestamp': float}
```

**Stop Command:**
```python
{'type': 'STOP', 'timestamp': float}
```

**Update G-code Command:**
```python
{
    'type': 'UPDATE_GCODE',
    'gcode_path': str,
    'timestamp': float
}
```

## Sensor

This demo configuration simplifies to a single binary sensor (ID 0). When triggered it represents a generic print error and initiates the pause → corrective G-code swap → resume workflow.

## Error Detection & Recovery Workflow

1. **Error Detection:**
   - Sensor triggers (value changes from 0 to 1)
   - Printer sends SENSOR_ALERT to ComputerPi
   - Alert includes sensor ID, position, and layer info

2. **Analysis (ComputerPi):**
   - ComputerPi receives sensor alert
   - Looks up error in error_table based on sensor ID and position
   - Determines appropriate corrective action

3. **Pause & Fix:**
   - ComputerPi sends PAUSE command to printer
   - Analyzes error and updates print parameters
   - Generates/retrieves corrective G-code

4. **Recovery:**
   - ComputerPi sends UPDATE_GCODE command with fix
   - Sends RESUME command to continue printing
   - Monitors sensors for successful recovery

## Usage

### Running the Simulation

```powershell
python .\print_simulation\printer_simulator.py
```

### Testing Error Detection

1. Click "Start Print" to begin simulation
2. Use sensor trigger buttons to simulate errors:
   - Click "Trigger Error" next to any sensor (S0-S7)
   - Watch the log panel for ComputerPi response
   - Observe automatic pause, fix, and resume cycle

### Manual Controls

- **Start Print:** Begin printing simulation
- **Pause Print:** Manually pause the print
- **Resume Print:** Resume after manual pause
- **Stop Print:** Stop and reset simulation
- **Layer Control:** Jump to specific layer for visualization
- **Sensor Controls:** Manually trigger sensor errors for testing

## Log Messages

The system provides detailed logging of all interactions:

```
HH:MM:SS - Print started
HH:MM:SS - ComputerPi: Monitoring started
HH:MM:SS - Processing layer 5...
HH:MM:SS - Manually triggering sensor 1
HH:MM:SS - ComputerPi: ALERT - Sensor 1 triggered at position {'x': 50.0, 'y': 50.0, 'z': 1.0}, layer 5
HH:MM:SS - ComputerPi: Sending PAUSE command to printer
HH:MM:SS - Printer paused by ComputerPi
HH:MM:SS - ComputerPi: Solution found - Bed adhesion error
HH:MM:SS - ComputerPi: Analyzing error and updating print parameters...
HH:MM:SS - ComputerPi: Parameters updated successfully
HH:MM:SS - ComputerPi: Uploading corrective G-code: fix_adhesion.gcode
HH:MM:SS - Received new G-code: fix_adhesion.gcode
HH:MM:SS - ComputerPi: Sending RESUME command to printer
HH:MM:SS - Printer resumed by ComputerPi
```

## File Structure

```
MEGP4/
├── AANT_pi_sim/
│   └── pi_sim_system.py           # Printer & ComputerPi classes
├── print_simulation/
│   ├── printer_simulator.py       # GUI application
│   └── README.md                  # This file
└── Gcode-Reader/
   ├── src/
   │   └── gcode_reader.py        # G-code parsing & visualization
   └── gcode/
      └── fdm_regular/
         ├── LBbaseline.gcode   # Baseline (defective) model
         └── LBdefected.gcode   # Corrective model swapped in after error
```

## Key Features

✅ **Real Sensor Simulation** - Binary sensor array with manual trigger controls  
✅ **Simulated Serial Communication** - Queue-based message passing between components  
✅ **Autonomous Error Recovery** - ComputerPi automatically handles sensor alerts  
✅ **Position-Aware Fixes** - Error solutions consider printer position and layer  
✅ **Real-time Monitoring** - Continuous sensor monitoring in background thread  
✅ **Comprehensive Logging** - All interactions logged for debugging and analysis  
✅ **Interactive Testing** - Manual sensor triggers for testing error scenarios  

## Future Enhancements

- [ ] Arc interpolation for G2/G3 commands
- [ ] Advanced outlier filtering for visualization
- [ ] Multiple simultaneous sensor errors
- [ ] Machine learning-based error prediction
- [ ] Historical sensor data visualization
- [ ] Custom error table configuration UI
