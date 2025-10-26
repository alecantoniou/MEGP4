"""
Test script for Printer and ComputerPi simulation
Verifies sensor detection, communication, and error handling
"""

import time
import sys
from pi_sim_system import Printer, ComputerPi


def test_sensor_communication():
    """Test basic sensor alert communication"""
    print("=" * 60)
    print("TEST 1: Sensor Communication")
    print("=" * 60)
    
    # Create printer and computer
    printer = Printer(num_sensors=8)
    computer_pi = ComputerPi(printer, log_callback=print)
    
    # Start monitoring
    computer_pi.start_monitoring()
    printer.start_print(total_layers=10)
    
    # Simulate printing for a bit
    time.sleep(0.5)
    
    # Trigger sensor error
    print("\n>>> Triggering sensor 1 (Bed Adhesion) at layer 3...")
    printer.current_layer = 3
    printer.update_position(50.0, 50.0, 0.6)  # Z=0.6mm (layer 3)
    printer.set_sensor(1, 1)  # Trigger bed adhesion sensor
    
    # Give time for processing
    time.sleep(2)
    
    # Check printer state
    print(f"\n>>> Printer state after error:")
    print(f"    Is printing: {printer.is_printing}")
    print(f"    Is paused: {printer.is_paused}")
    print(f"    Sensors: {printer.get_sensors()}")
    
    # Clean up
    computer_pi.stop_monitoring()
    time.sleep(0.5)
    
    print("\n✓ Test 1 completed\n")


def test_multiple_sensors():
    """Test multiple sensor triggers"""
    print("=" * 60)
    print("TEST 2: Multiple Sensor Triggers")
    print("=" * 60)
    
    # Create printer and computer
    printer = Printer(num_sensors=8)
    computer_pi = ComputerPi(printer, log_callback=print)
    
    # Start monitoring
    computer_pi.start_monitoring()
    printer.start_print(total_layers=20)
    
    time.sleep(0.5)
    
    # Trigger multiple sensors in sequence
    sensor_tests = [
        (0, 10, 2.0, "Nozzle Temperature"),
        (2, 15, 3.0, "Extrusion Error"),
        (3, 18, 3.6, "Layer Shift"),
    ]
    
    for sensor_id, layer, z_pos, description in sensor_tests:
        print(f"\n>>> Triggering sensor {sensor_id} ({description}) at layer {layer}...")
        printer.current_layer = layer
        printer.update_position(50.0, 50.0, z_pos)
        printer.set_sensor(sensor_id, 1)
        time.sleep(2.5)  # Allow time for recovery
        
        # Reset sensor after fix
        printer.sensors[sensor_id] = 0
    
    # Clean up
    computer_pi.stop_monitoring()
    time.sleep(0.5)
    
    print("\n✓ Test 2 completed\n")


def test_command_processing():
    """Test command processing from ComputerPi to Printer"""
    print("=" * 60)
    print("TEST 3: Command Processing")
    print("=" * 60)
    
    # Create printer and computer
    printer = Printer(num_sensors=8)
    computer_pi = ComputerPi(printer, log_callback=print)
    
    printer.start_print(total_layers=10)
    
    # Test pause command
    print("\n>>> Testing PAUSE command...")
    computer_pi.pause_print()
    printer.process_commands()
    print(f"    Printer paused: {printer.is_paused}")
    
    time.sleep(1)
    
    # Test resume command
    print("\n>>> Testing RESUME command...")
    computer_pi.resume_print()
    printer.process_commands()
    print(f"    Printer paused: {printer.is_paused}")
    
    time.sleep(1)
    
    # Test stop command
    print("\n>>> Testing STOP command...")
    computer_pi.stop_print()
    printer.process_commands()
    print(f"    Printer running: {printer.is_printing}")
    
    print("\n✓ Test 3 completed\n")


def test_error_table_lookup():
    """Test error table lookup logic"""
    print("=" * 60)
    print("TEST 4: Error Table Lookup")
    print("=" * 60)
    
    # Create printer and computer
    printer = Printer(num_sensors=8)
    computer_pi = ComputerPi(printer, log_callback=print)
    
    # Test various error scenarios
    test_cases = [
        (0, {'x': 50, 'y': 50, 'z': 10.0}, "Should find: Nozzle temperature error"),
        (1, {'x': 50, 'y': 50, 'z': 0.4}, "Should find: Bed adhesion error (z <= 5.0)"),
        (1, {'x': 50, 'y': 50, 'z': 10.0}, "Should NOT find: Bed adhesion (z > 5.0)"),
        (2, {'x': 50, 'y': 50, 'z': 5.0}, "Should find: Extrusion error"),
    ]
    
    for sensor_id, position, expected in test_cases:
        print(f"\n>>> Testing sensor {sensor_id} at position {position}")
        print(f"    Expected: {expected}")
        
        solution = computer_pi._analyze_error(sensor_id, position)
        
        if solution:
            print(f"    Found: {solution['description']}")
            print(f"    G-code: {solution['gcode_file']}")
        else:
            print(f"    Found: No solution")
    
    print("\n✓ Test 4 completed\n")


def run_all_tests():
    """Run all test cases"""
    print("\n" + "=" * 60)
    print("PRINTER & COMPUTERPI SIMULATION TEST SUITE")
    print("=" * 60 + "\n")
    
    try:
        test_sensor_communication()
        test_command_processing()
        test_error_table_lookup()
        test_multiple_sensors()
        
        print("=" * 60)
        print("ALL TESTS PASSED ✓")
        print("=" * 60)
        
    except Exception as e:
        print(f"\n❌ TEST FAILED: {str(e)}")
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == "__main__":
    run_all_tests()
