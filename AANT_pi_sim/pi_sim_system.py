# Table/array containing sensor data, position, and g-code file locations
error_table = [
    {'sensor': 1, 'position': {'x': 100, 'y': 100, 'z': 0}, 'gcode_file': '/path/to/fix1.gcode'},
    {'sensor': 1, 'position': {'x': 200, 'y': 200, 'z': 0}, 'gcode_file': '/path/to/fix2.gcode'}
    # Add more entries as needed
]

def pause_print(sensor_data):
    """
    Pauses the print when error is detected
    Args: sensor_data (int): 0 for no error, 1 for error
    Returns: bool: True if print should stop, False otherwise
    """
    if sensor_data == 1:
        print("Error detected! Sending stop signal to printer...")
        return True
    return False

def fix_error(sensor_data, position):
    """
    Finds appropriate g-code file based on sensor data and position
    Args: 
        sensor_data (int): error code
        position (dict): current position {x, y, z}
    Returns: str: path to g-code file
    """
    for entry in error_table:
        if (entry['sensor'] == sensor_data and 
            entry['position']['x'] == position['x'] and
            entry['position']['y'] == position['y'] and
            entry['position']['z'] == position['z']):
            return entry['gcode_file']
    return None

def upload_gcode(file_location):
    """
    Uploads g-code to printer
    Args: file_location (str): path to g-code file
    Returns: bool: True if upload successful
    """
    try:
        with open(file_location, 'r') as file:
            gcode = file.read()
            print(f"Uploading g-code from {file_location} to printer...")
            # Add actual printer communication code here
            return True
    except:
        print("Error uploading g-code file")
        return False

def continue_print(upload_confirmation):
    """
    Continues printing after fix
    Args: upload_confirmation (bool): True if g-code upload was successful
    Returns: bool: True if print should continue
    """
    if upload_confirmation:
        print("Sending continue signal to printer...")
        return True
    return False