# Testing the Complete Simulation Workflow

## How to Test the Error Detection and G-code Update System

### 1. Start the Simulation
```powershell
cd c:\Users\aleca\MEGP4\print_simulation
python printer_simulator.py
```

### 2. Start a Print Job
- Click the "Start Print" button in the GUI
- You'll see layers advancing in the log panel
- The current layer view will update every second

### 3. Trigger an Error
- Click the "Trigger Error" button (under Sensor Controls)
- This simulates sensor 0 detecting an error

### 4. Observe the Workflow

**What should happen:**

1. **Error Detection** (immediate)
   - Log shows: "Manually triggering sensor 0"
   - Log shows: "ComputerPi: ALERT - Sensor 0 triggered..."

2. **Printer Pauses** (Step 1)
   - Log shows: "ComputerPi: Step 1 - Pausing printer..."
   - Log shows: "Print paused by ComputerPi"
   - **Layer counter STOPS advancing** (GUI freezes layer updates)

3. **Position Reading** (Step 2)
   - Log shows: "ComputerPi: Step 2 - Reading position from printer: {x, y, z}"

4. **Lookup Solution** (Step 3)
   - Log shows: "ComputerPi: Step 3 - Looking up solution..."
   - Log shows: "ComputerPi: Found matching entry for sensor 0"
   - Log shows: "ComputerPi: Suggested G-code: ...LBdefected.gcode"

5. **Update Parameters** (Step 4)
   - Log shows: "ComputerPi: Step 4 - Updating print parameters..."
   - Log shows: "ComputerPi: Parameters updated successfully"

6. **Send G-code** (Step 5)
   - Log shows: "ComputerPi: Step 5 - Sending corrective G-code..."
   - Log shows: "ComputerPi: G-code upload confirmed by printer"
   - Log shows: "=== G-CODE UPDATE RECEIVED ==="
   - Log shows: "GUI: Loading new G-code from ...LBdefected.gcode"
   - Log shows: "GUI: Old model: X layers"
   - Log shows: "GUI: New model: Y layers"
   - **3D model views update to show LBdefected.gcode**
   - **"Updated Model" panel shows the new geometry**

7. **Resume Printing** (Step 6)
   - Log shows: "ComputerPi: Step 6 - Resuming print..."
   - Log shows: "Print resumed by ComputerPi"
   - **Layer counter RESUMES advancing**
   - Now printing with the NEW G-code (LBdefected.gcode)

8. **Sensor Reset**
   - Log shows: "Sensor 0 reset to normal state"

## Visual Indicators

### Layer View (Left Panel)
- Shows current layer of the active G-code
- Freezes when paused, resumes when print continues

### Original Model (Top Right)
- Shows the initial baseline model (LBcorrected.gcode or LBbaseline.gcode depending on configuration)

### Updated Model (Bottom Right)
- Initially shows "Updated Model (Not Yet Modified)"
- After error handling, updates to show LBdefected.gcode
- You should see different geometry vs the baseline model

### Log Panel (Bottom)
- Shows all communication between Printer and ComputerPi
- Shows all 6 steps of error handling
- Shows G-code loading confirmation

## Expected Differences Between Models

**LBbaseline.gcode / LBcorrected.gcode** (initial):
- Baseline geometry used to start the print
- Layer count and shape differ from the corrective file

**LBdefected.gcode** (updated):
- Corrective geometry used after the error is detected
- Different number of layers and path geometry

## Troubleshooting

If the workflow doesn't work:

1. **Check logs** - All steps should appear in the log panel
2. **Check pause** - Layers should stop advancing during error handling
3. **Check resume** - Layers should resume after "Step 6"
4. **Check models** - Updated Model panel should show different geometry after update

## Command Line Test

You can also test without the GUI:
```powershell
cd c:\Users\aleca\MEGP4\AANT_pi_sim
python test_workflow.py
```

This will print the complete workflow with all checkpoints.
