"""
Simple test for single sensor system
Tests sensor 0 detection and LBdef.gcode lookup
"""

import time
from pi_sim_system import Printer, ComputerPi


def test_single_sensor_workflow():
    """Test complete workflow with single sensor"""
    print("=" * 70)
    print("SINGLE SENSOR TEST - Error Detection & G-code Lookup")
    print("=" * 70)
    
    # Create printer and computer with 1 sensor
    printer = Printer(num_sensors=1)
    computer_pi = ComputerPi(printer, log_callback=print)
    
    # Start monitoring
    computer_pi.start_monitoring()
    printer.start_print(total_layers=20)
    
    print("\n" + "=" * 70)
    print("SCENARIO 1: Error at early layer (Z = 0.6mm)")
    print("=" * 70)
    time.sleep(0.5)
    
    # Trigger sensor 0 at early layer
    printer.current_layer = 3
    printer.update_position(50.0, 50.0, 0.6)
    print(f"\n>>> Printer position: {printer.position}")
    print(f">>> Triggering sensor 0...")
    printer.set_sensor(0, 1)
    
    # Wait for processing
    time.sleep(2.5)
    
    # Reset sensor
    printer.sensors[0] = 0
    
    print("\n" + "=" * 70)
    print("SCENARIO 2: Error at mid layer (Z = 5.0mm)")
    print("=" * 70)
    time.sleep(0.5)
    
    # Trigger sensor 0 at mid layer
    printer.current_layer = 25
    printer.update_position(75.0, 75.0, 5.0)
    print(f"\n>>> Printer position: {printer.position}")
    print(f">>> Triggering sensor 0...")
    printer.set_sensor(0, 1)
    
    # Wait for processing
    time.sleep(2.5)
    
    # Reset sensor
    printer.sensors[0] = 0
    
    print("\n" + "=" * 70)
    print("SCENARIO 3: Error at high layer (Z = 20.0mm)")
    print("=" * 70)
    time.sleep(0.5)
    
    # Trigger sensor 0 at high layer
    printer.current_layer = 100
    printer.update_position(100.0, 100.0, 20.0)
    print(f"\n>>> Printer position: {printer.position}")
    print(f">>> Triggering sensor 0...")
    printer.set_sensor(0, 1)
    
    # Wait for processing
    time.sleep(2.5)
    
    # Clean up
    computer_pi.stop_monitoring()
    time.sleep(0.5)
    
    print("\n" + "=" * 70)
    print("✓ ALL SCENARIOS COMPLETED")
    print("✓ LBdef.gcode should be suggested for all positions")
    print("=" * 70)


if __name__ == "__main__":
    test_single_sensor_workflow()
