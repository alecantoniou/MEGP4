"""
Pi Sim System - Simulates a microcomputer (Raspberry Pi) connected to a 3D printer
Monitors sensor data and communicates with the printer to handle errors
"""

import time
import os
from typing import Dict, List, Optional, Callable
from queue import Queue
import threading


class Printer:
    """
    Simulates a 3D printer with sensors and basic communication interface
    """
    def __init__(self, num_sensors=1):
        """
        Initialize printer with sensor array
        Args:
            num_sensors (int): Number of sensors on the printer (default: 1)
        """
        # Sensor array - binary state (0 = no error, 1 = error detected)
        self.sensors = [0] * num_sensors
        
        # Printer state
        self.position = {'x': 0.0, 'y': 0.0, 'z': 0.0}
        self.is_printing = False
        self.is_paused = False
        self.current_layer = 0
        self.total_layers = 0
        
        # Communication queues (simulated serial)
        self.incoming_commands = Queue()  # Commands from ComputerPi
        self.outgoing_data = Queue()      # Data sent to ComputerPi
        
        # Callbacks
        self.on_state_change = None  # Callback for state changes
        self.on_gcode_update = None  # Callback for G-code updates
        
    def set_sensor(self, sensor_id: int, value: int):
        """Set a sensor value (0 or 1)"""
        if 0 <= sensor_id < len(self.sensors):
            old_value = self.sensors[sensor_id]
            self.sensors[sensor_id] = value
            if old_value != value and value == 1:
                self._send_sensor_alert(sensor_id)
                
    def get_sensors(self) -> List[int]:
        """Get current sensor array state"""
        return self.sensors.copy()
    
    def _send_sensor_alert(self, sensor_id: int):
        """Send sensor alert to ComputerPi"""
        alert = {
            'type': 'SENSOR_ALERT',
            'sensor_id': sensor_id,
            'position': self.position.copy(),
            'layer': self.current_layer,
            'timestamp': time.time()
        }
        self.outgoing_data.put(alert)
        
    def send_status_update(self):
        """Send status update to ComputerPi"""
        status = {
            'type': 'STATUS',
            'position': self.position.copy(),
            'layer': self.current_layer,
            'total_layers': self.total_layers,
            'is_printing': self.is_printing,
            'is_paused': self.is_paused,
            'sensors': self.get_sensors(),
            'timestamp': time.time()
        }
        self.outgoing_data.put(status)
        
    def process_commands(self):
        """Process incoming commands from ComputerPi"""
        while not self.incoming_commands.empty():
            command = self.incoming_commands.get()
            self._execute_command(command)
            
    def _execute_command(self, command: Dict):
        """Execute a command received from ComputerPi"""
        cmd_type = command.get('type')
        
        if cmd_type == 'PAUSE':
            self.is_paused = True
            self._notify_state_change('Printer paused by ComputerPi')
            
        elif cmd_type == 'RESUME':
            self.is_paused = False
            self._notify_state_change('Printer resumed by ComputerPi')
            
        elif cmd_type == 'STOP':
            self.is_printing = False
            self.is_paused = False
            self._notify_state_change('Printer stopped by ComputerPi')
            
        elif cmd_type == 'UPDATE_GCODE':
            gcode_path = command.get('gcode_path')
            self._notify_state_change(f'Received new G-code: {gcode_path}')
            # Notify GUI to load new G-code
            if self.on_gcode_update:
                self.on_gcode_update(gcode_path)
            
        elif cmd_type == 'MOVE':
            # Simulated movement command
            self.position = command.get('position', self.position)
            
    def _notify_state_change(self, message: str):
        """Notify observers of state changes"""
        if self.on_state_change:
            self.on_state_change(message)
            
    def start_print(self, total_layers: int):
        """Start a print job"""
        self.is_printing = True
        self.is_paused = False
        self.current_layer = 0
        self.total_layers = total_layers
        self._notify_state_change(f'Print started - {total_layers} layers')
        
    def update_position(self, x: float, y: float, z: float):
        """Update printer position"""
        self.position = {'x': x, 'y': y, 'z': z}


class ComputerPi:
    """
    Simulates a Raspberry Pi running the pi_sim system
    Monitors printer sensors and sends corrective commands
    """
    def __init__(self, printer: Printer, log_callback: Optional[Callable] = None):
        """
        Initialize ComputerPi connected to a printer
        Args:
            printer: Printer object to monitor and control
            log_callback: Function to call for logging messages
        """
        self.printer = printer
        self.log = log_callback or print
        
        # Error detection and recovery
        self.error_table = self._initialize_error_table()
        self.monitoring = False
        self.monitor_thread = None
        
        # Communication
        self.last_status = None
        
    def _initialize_error_table(self) -> List[Dict]:
        """
        Initialize error lookup table
        For now, simplified to one sensor with LBdef.gcode as the solution for all positions
        """
        # Get the path to LBdef.gcode
        import os
        base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        lbdef_path = os.path.join(base_path, "Gcode-Reader", "gcode", "fdm_regular", "LBdef.gcode")
        
        return [
            {
                'sensor': 0,
                'description': 'Print error detected',
                'position_range': None,  # Any position
                'gcode_file': lbdef_path
            }
        ]
        
    def start_monitoring(self):
        """Start monitoring the printer"""
        if not self.monitoring:
            self.monitoring = True
            self.monitor_thread = threading.Thread(target=self._monitor_loop, daemon=True)
            self.monitor_thread.start()
            self.log("ComputerPi: Monitoring started")
            
    def stop_monitoring(self):
        """Stop monitoring the printer"""
        self.monitoring = False
        if self.monitor_thread:
            self.monitor_thread.join(timeout=2.0)
        self.log("ComputerPi: Monitoring stopped")
        
    def _monitor_loop(self):
        """Main monitoring loop"""
        while self.monitoring:
            # Process incoming data from printer
            while not self.printer.outgoing_data.empty():
                data = self.printer.outgoing_data.get()
                self._process_printer_data(data)
                
            # Request status update periodically
            time.sleep(0.1)
            
    def _process_printer_data(self, data: Dict):
        """Process data received from printer"""
        data_type = data.get('type')
        
        if data_type == 'SENSOR_ALERT':
            self._handle_sensor_alert(data)
            
        elif data_type == 'STATUS':
            self.last_status = data
            
    def _handle_sensor_alert(self, alert: Dict):
        """Handle sensor alert from printer"""
        sensor_id = alert.get('sensor_id')
        position = alert.get('position')
        layer = alert.get('layer')
        
        self.log(f"ComputerPi: ALERT - Sensor {sensor_id} triggered at position {position}, layer {layer}")
        
        # Step 1: Pause the printer immediately
        self.log("ComputerPi: Step 1 - Pausing printer...")
        self.pause_print()
        
        # Step 2: Read position from printer (already in alert)
        self.log(f"ComputerPi: Step 2 - Reading position from printer: {position}")
        
        # Step 3: Use sensor reference and position to lookup solution
        self.log(f"ComputerPi: Step 3 - Looking up solution for sensor {sensor_id} at position {position}")
        solution = self._analyze_error(sensor_id, position)
        
        if solution:
            self.log(f"ComputerPi: Solution found - {solution['description']}")
            self.log(f"ComputerPi: Suggested G-code: {solution['gcode_file']}")
            
            # Step 4: Update print parameters
            self.log("ComputerPi: Step 4 - Updating print parameters...")
            self._update_print_parameters(solution)
            
            # Step 5: Send corrective G-code to printer
            self.log("ComputerPi: Step 5 - Sending corrective G-code to printer...")
            self._send_corrective_gcode(solution['gcode_file'])
            
            # Step 6: Resume printing
            time.sleep(1)  # Simulate processing delay
            self.log("ComputerPi: Step 6 - Resuming print...")
            self.resume_print()
        else:
            self.log(f"ComputerPi: ERROR - No solution found for sensor {sensor_id}")
            self.stop_print()
            
    def _analyze_error(self, sensor_id: int, position: Dict) -> Optional[Dict]:
        """
        Analyze error and find appropriate solution from lookup table
        Uses sensor reference and position to determine the correct G-code solution
        """
        self.log(f"ComputerPi: Analyzing error - Sensor: {sensor_id}, Position: {position}")
        
        for entry in self.error_table:
            # Check if sensor ID matches
            if entry['sensor'] == sensor_id:
                self.log(f"ComputerPi: Found matching entry for sensor {sensor_id}")
                
                # Check position constraints if any
                pos_range = entry.get('position_range')
                
                if pos_range is None:
                    # No position constraint - valid for all positions
                    self.log(f"ComputerPi: No position constraints - solution valid for all positions")
                    return entry
                    
                # Check if position matches range constraints
                if 'z_max' in pos_range and position['z'] <= pos_range['z_max']:
                    self.log(f"ComputerPi: Position within z_max constraint ({pos_range['z_max']}mm)")
                    return entry
                elif 'z_min' in pos_range and position['z'] >= pos_range['z_min']:
                    self.log(f"ComputerPi: Position within z_min constraint ({pos_range['z_min']}mm)")
                    return entry
                    
        self.log(f"ComputerPi: No matching solution found in lookup table")
        return None
        
    def _update_print_parameters(self, solution: Dict):
        """Update print parameters based on error analysis"""
        self.log("ComputerPi: Analyzing error and updating print parameters...")
        time.sleep(1)  # Simulate analysis time
        self.log("ComputerPi: Parameters updated successfully")
        
    def _send_corrective_gcode(self, gcode_file: str):
        """Send corrective G-code to printer"""
        self.log(f"ComputerPi: Uploading corrective G-code: {gcode_file}")
        
        command = {
            'type': 'UPDATE_GCODE',
            'gcode_path': gcode_file,
            'timestamp': time.time()
        }
        self.printer.incoming_commands.put(command)
        
        # Wait for printer to acknowledge
        time.sleep(0.5)
        self.log("ComputerPi: G-code upload confirmed by printer")
        
    def pause_print(self):
        """Send pause command to printer"""
        self.log("ComputerPi: Sending PAUSE command to printer")
        command = {'type': 'PAUSE', 'timestamp': time.time()}
        self.printer.incoming_commands.put(command)
        
    def resume_print(self):
        """Send resume command to printer"""
        self.log("ComputerPi: Sending RESUME command to printer")
        command = {'type': 'RESUME', 'timestamp': time.time()}
        self.printer.incoming_commands.put(command)
        
    def stop_print(self):
        """Send stop command to printer"""
        self.log("ComputerPi: Sending STOP command to printer")
        command = {'type': 'STOP', 'timestamp': time.time()}
        self.printer.incoming_commands.put(command)
        
    def get_printer_status(self) -> Optional[Dict]:
        """Get last received printer status"""
        return self.last_status


# Legacy function wrappers for backward compatibility
def update_print_parameters():
    """Legacy function - Updates print parameters based on error analysis"""
    print("Analyzing error and updating print parameters...")
    time.sleep(1)
    print("Parameters updated successfully")
    return True