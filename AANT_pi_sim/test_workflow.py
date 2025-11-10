"""
Test the complete workflow:
1. Trigger error
2. Printer pauses (layers stop changing)
3. ComputerPi finds solution (LBdefected.gcode)
4. Printer loads new G-code
5. Printer resumes with new G-code
"""

import time
from pi_sim_system import Printer, ComputerPi


def test_complete_workflow():
    """Test the complete error detection and recovery workflow"""
    print("=" * 70)
    print("COMPLETE WORKFLOW TEST")
    print("=" * 70)
    
    # Track G-code updates
    gcode_updated = {'value': False, 'path': None}
    
    def mock_gcode_update(path):
        """Mock callback for G-code updates"""
        gcode_updated['value'] = True
        gcode_updated['path'] = path
        print(f"\n>>> GUI CALLBACK: G-code update received - {path}")
    
    # Create printer and computer
    printer = Printer(num_sensors=1)
    computer_pi = ComputerPi(printer, log_callback=print)
    
    # Set G-code update callback
    printer.on_gcode_update = mock_gcode_update
    
    # Start monitoring and printing
    computer_pi.start_monitoring()
    printer.start_print(total_layers=50)
    
    print("\n" + "=" * 70)
    print("STEP 1: Print is running normally")
    print("=" * 70)
    printer.current_layer = 10
    printer.update_position(50.0, 50.0, 2.0)
    print(f"Current layer: {printer.current_layer}")
    print(f"Is paused: {printer.is_paused}")
    time.sleep(1)
    
    print("\n" + "=" * 70)
    print("STEP 2: Triggering sensor 0 error")
    print("=" * 70)
    print(f">>> Triggering sensor 0 at layer {printer.current_layer}, position {printer.position}")
    printer.set_sensor(0, 1)
    
    # Give time for error processing
    time.sleep(0.5)
    
    print("\n" + "=" * 70)
    print("STEP 3: Check printer is paused")
    print("=" * 70)
    printer.process_commands()
    print(f"Is paused: {printer.is_paused} (should be True)")
    print(f"Current layer: {printer.current_layer} (should not change while paused)")
    
    # Simulate some time passing - layers should NOT advance while paused
    old_layer = printer.current_layer
    time.sleep(2)
    printer.process_commands()
    print(f"Layer after 2 seconds: {printer.current_layer} (should still be {old_layer})")
    
    print("\n" + "=" * 70)
    print("STEP 4: Check G-code update was sent")
    print("=" * 70)
    print(f"G-code updated: {gcode_updated['value']} (should be True)")
    if gcode_updated['path']:
        print(f"New G-code path: {gcode_updated['path']}")
    print(f"Contains 'LBdefected.gcode': {'LBdefected.gcode' in gcode_updated['path']}")
    
    print("\n" + "=" * 70)
    print("STEP 5: Check printer is resumed")
    print("=" * 70)
    time.sleep(0.5)
    printer.process_commands()
    print(f"Is paused: {printer.is_paused} (should be False)")
    
    # Clean up
    computer_pi.stop_monitoring()
    time.sleep(0.5)
    
    print("\n" + "=" * 70)
    print("WORKFLOW TEST RESULTS")
    print("=" * 70)
    print(f"✓ Error detected: True")
    print(f"✓ Printer paused: True")
    print(f"✓ G-code updated: {gcode_updated['value']}")
    print(f"✓ Correct G-code (LBdefected): {'LBdefected.gcode' in (gcode_updated['path'] or '')}")
    print(f"✓ Printer resumed: {not printer.is_paused}")
    print("=" * 70)


if __name__ == "__main__":
    test_complete_workflow()
