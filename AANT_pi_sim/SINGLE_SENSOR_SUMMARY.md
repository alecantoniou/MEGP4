# Single Sensor System - Implementation Summary

## System Overview

The simulation has been simplified to focus on a single sensor error detection system where ComputerPi reads sensor data, detects errors, looks up the position, and determines the appropriate G-code solution.

## Key Components

### 1. Printer Class
- **Sensor Array**: Single sensor (sensor 0)
- **State Tracking**: Position (x, y, z), layer, printing status
- **Communication**: Sends sensor alerts with position data to ComputerPi

### 2. ComputerPi Class
- **Error Detection**: Monitors sensor 0 for errors (0 → 1 transition)
- **Position Reading**: Reads current position from Printer when error detected
- **Lookup Table**: Uses sensor reference + position to find G-code solution
- **Solution**: Returns LBdef.gcode for all positions (simplified)

## Error Workflow

When sensor 0 detects an error (value changes to 1):

```
Step 1: Pause printer
  ↓
Step 2: Read position from printer
  ↓
Step 3: Lookup solution (sensor 0 + position → LBdef.gcode)
  ↓
Step 4: Update print parameters
  ↓
Step 5: Send corrective G-code (LBdef.gcode) to printer
  ↓
Step 6: Resume printing
```

## Lookup Table Configuration

Currently configured as:
```python
{
    'sensor': 0,
    'description': 'Print error detected',
    'position_range': None,  # Valid for ALL positions
    'gcode_file': 'C:\\Users\\aleca\\MEGP4\\Gcode-Reader\\gcode\\fdm_regular\\LBdef.gcode'
}
```

This means:
- ✅ Sensor 0 at ANY position → LBdef.gcode
- ✅ No position constraints applied
- ✅ Simplified for testing and development

## Testing

Run the single sensor test:
```bash
cd c:\Users\aleca\MEGP4\AANT_pi_sim
python test_single_sensor.py
```

This tests sensor 0 at three different positions:
- Low Z (0.6mm) - layer 3
- Mid Z (5.0mm) - layer 25
- High Z (20.0mm) - layer 100

All positions correctly return LBdef.gcode as the solution.

## GUI Usage

1. Start the simulation:
   ```bash
   cd c:\Users\aleca\MEGP4\print_simulation
   python printer_simulator.py
   ```

2. Click "Start Print"

3. Click "Trigger Error" button to simulate sensor 0 error

4. Watch the log panel for the 6-step workflow

## Next Steps

The lookup table can be expanded to include:
- Position-based constraints (e.g., different solutions for different Z heights)
- Multiple sensors with different solutions
- More sophisticated error analysis logic
- Position range matching (x/y/z min/max constraints)
