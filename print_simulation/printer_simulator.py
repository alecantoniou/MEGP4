import tkinter as tk
from tkinter import ttk
import sys
import os
import time
import threading
from queue import Queue
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import numpy as np

# Add necessary paths
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
gcode_reader_path = os.path.join(base_dir, 'Gcode-Reader', 'src')
aant_path = os.path.join(base_dir, 'AANT_pi_sim')
sys.path.extend([gcode_reader_path, aant_path])

from gcode_reader import GcodeReader, GcodeType
from pi_sim_system import update_print_parameters
# Import moved above

class PrinterSimulator:
    def __init__(self, root):
        self.root = root
        self.root.title("3D Printer Simulation System")
        
        # Initialize variables
        self.current_layer = 1
        self.is_printing = False
        self.error_detected = False
        self.print_paused = False
        self.message_queue = Queue()
        
        # Initialize gcode readers first
        base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        self.octo_path = os.path.join(base_path, "Gcode-Reader", "gcode", "fdm_regular", "octo.gcode")
        self.lb_path = os.path.join(base_path, "Gcode-Reader", "gcode", "fdm_regular", "LBdef.gcode")
        
        # Check if required files exist
        if not os.path.exists(self.octo_path):
            print(f"Error: Could not find octo.gcode at {self.octo_path}")  # Use print since logging not set up yet
            return
            
        if not os.path.exists(self.lb_path):
            print(f"Warning: Could not find LBdef.gcode at {self.lb_path}")
            print("Error recovery will continue with original G-code")
            
        # Initialize GCode reader objects
        try:
            self.original_gcode = GcodeReader(self.octo_path, GcodeType.FDM_REGULAR)
            self.current_gcode = self.original_gcode
        except Exception as e:
            print(f"Error initializing G-code reader: {str(e)}")
            return
            
        # Set up the main layout
        self.setup_gui()
        
        # Start message processing
        self.process_messages()

    def setup_gui(self):
        # Create main frames
        self.control_frame = ttk.Frame(self.root)
        self.control_frame.grid(row=0, column=0, padx=5, pady=5, sticky="nsew")
        
        # Create a frame for the layer view
        self.layer_frame = ttk.LabelFrame(self.root, text="Current Layer View")
        self.layer_frame.grid(row=0, column=1, padx=5, pady=5, sticky="nsew")
        
        # Create a frame for complete model views
        self.models_frame = ttk.Frame(self.root)
        self.models_frame.grid(row=0, column=2, padx=5, pady=5, sticky="nsew")
        
        # Split models frame into original and updated views
        self.original_frame = ttk.LabelFrame(self.models_frame, text="Original Model")
        self.original_frame.pack(fill=tk.BOTH, expand=True, padx=2, pady=2)
        
        self.updated_frame = ttk.LabelFrame(self.models_frame, text="Updated Model")
        self.updated_frame.pack(fill=tk.BOTH, expand=True, padx=2, pady=2)
        
        self.log_frame = ttk.Frame(self.root)
        self.log_frame.grid(row=1, column=0, columnspan=3, padx=5, pady=5, sticky="nsew")
        
        # Set up control panel
        self.setup_control_panel()
        
        # Set up visualizations
        self.setup_visualization()
        
        # Set up log display
        self.setup_log_display()
        
        # Configure grid weights
        self.root.grid_columnconfigure(1, weight=2)  # Layer view gets more space
        self.root.grid_columnconfigure(2, weight=1)  # Models view
        self.root.grid_rowconfigure(0, weight=1)

    def setup_control_panel(self):
        # Control buttons
        ttk.Button(self.control_frame, text="Start Print", command=self.start_print).pack(pady=5)
        ttk.Button(self.control_frame, text="Pause Print", command=self.pause_print).pack(pady=5)
        ttk.Button(self.control_frame, text="Resume Print", command=self.resume_print).pack(pady=5)
        ttk.Button(self.control_frame, text="Stop Print", command=self.stop_print).pack(pady=5)
        
        # Layer control
        layer_frame = ttk.Frame(self.control_frame)
        layer_frame.pack(pady=10)
        ttk.Label(layer_frame, text="Layer:").pack(side=tk.LEFT)
        self.layer_var = tk.StringVar(value="1")
        ttk.Entry(layer_frame, textvariable=self.layer_var, width=5).pack(side=tk.LEFT, padx=5)
        ttk.Button(layer_frame, text="Go", command=self.update_layer_view).pack(side=tk.LEFT)

    def setup_visualization(self):
        # Create layer view figure
        self.layer_fig, self.layer_ax = plt.subplots(figsize=(8, 8))
        self.layer_canvas = FigureCanvasTkAgg(self.layer_fig, master=self.layer_frame)
        self.layer_canvas.draw()
        self.layer_canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)
        
        # Create original model view
        self.original_fig = plt.figure(figsize=(6, 6))
        self.original_ax = self.original_fig.add_subplot(111, projection='3d')
        self.original_canvas = FigureCanvasTkAgg(self.original_fig, master=self.original_frame)
        self.original_canvas.draw()
        self.original_canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)
        
        # Create updated model view
        self.updated_fig = plt.figure(figsize=(6, 6))
        self.updated_ax = self.updated_fig.add_subplot(111, projection='3d')
        self.updated_canvas = FigureCanvasTkAgg(self.updated_fig, master=self.updated_frame)
        self.updated_canvas.draw()
        self.updated_canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)
        
        # Initialize 3D views
        self.update_3d_views()

    def setup_log_display(self):
        # Create log text widget
        self.log_text = tk.Text(self.log_frame, height=10, width=50)
        self.log_text.pack(fill=tk.BOTH, expand=True)
        
        # Add scrollbar
        scrollbar = ttk.Scrollbar(self.log_frame, command=self.log_text.yview)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        self.log_text.configure(yscrollcommand=scrollbar.set)

    def log_message(self, message):
        """Add a message to the message queue"""
        self.message_queue.put(f"{time.strftime('%H:%M:%S')} - {message}")

    def process_messages(self):
        """Process messages from the queue and update the log"""
        try:
            while not self.message_queue.empty():
                message = self.message_queue.get_nowait()
                self.log_text.insert(tk.END, message + "\n")
                self.log_text.see(tk.END)
        finally:
            # Schedule next update
            self.root.after(100, self.process_messages)

    def update_3d_views(self):
        """Update both 3D model views"""
        try:
            if not hasattr(self, 'original_gcode') or not hasattr(self, 'current_gcode'):
                self.log_message("G-code data not yet initialized")
                return
                
            # Clear existing plots
            if hasattr(self, 'original_ax'):
                self.original_ax.clear()
            if hasattr(self, 'updated_ax'):
                self.updated_ax.clear()
            
            try:
                # Plot original model
                self.log_message("Updating original model 3D view...")
                _, self.original_ax = self.original_gcode.plot(ax=self.original_ax)
                self.original_ax.set_title("Original Model")
                
                # Plot current/updated model if different
                if self.current_gcode != self.original_gcode:
                    self.log_message("Updating modified model 3D view...")
                    _, self.updated_ax = self.current_gcode.plot(ax=self.updated_ax)
                    self.updated_ax.set_title("Updated Model")
                else:
                    if hasattr(self, 'updated_ax'):
                        self.updated_ax.set_title("Updated Model (Not Yet Modified)")
                
                # Set reasonable view limits
                if hasattr(self, 'original_ax'):
                    self.original_ax.set_box_aspect([1, 1, 1])
                if hasattr(self, 'updated_ax'):
                    self.updated_ax.set_box_aspect([1, 1, 1])
                
                # Update canvases
                if hasattr(self, 'original_canvas'):
                    self.original_canvas.draw()
                if hasattr(self, 'updated_canvas'):
                    self.updated_canvas.draw()
                    
            except Exception as plot_error:
                self.log_message(f"Error plotting 3D views: {str(plot_error)}")
                import traceback
                self.log_message(f"Plot error traceback: {traceback.format_exc()}")
            
        except Exception as e:
            self.log_message(f"Error in update_3d_views: {str(e)}")
            import traceback
            self.log_message(f"Traceback: {traceback.format_exc()}")

    def update_visualization(self):
        """Update the visualization with current layer"""
        try:
            # Clear layer view
            self.layer_ax.clear()
            
            # Get current layer number
            try:
                current_layer = int(self.layer_var.get())
                self.log_message(f"Updating visualization for layer {current_layer}...")
            except ValueError as ve:
                self.log_message(f"Invalid layer number: {self.layer_var.get()}")
                return
                
            # Plot current layer
            try:
                _, self.layer_ax = self.current_gcode.plot_layer(layer=current_layer, ax=self.layer_ax)
                self.layer_canvas.draw()
            except Exception as layer_error:
                self.log_message(f"Error plotting layer {current_layer}: {str(layer_error)}")
                return
                
            # Update 3D views
            self.update_3d_views()
            
        except Exception as e:
            self.log_message(f"Error in update_visualization: {str(e)}")
            import traceback
            self.log_message(f"Traceback: {traceback.format_exc()}")

    def simulate_error_detection(self):
        """Simulate error detection during printing"""
        if self.is_printing and not self.error_detected:
            # Simulate random error detection
            if np.random.random() < 0.1:  # 10% chance of error
                self.error_detected = True
                self.print_paused = True
                self.log_message("ERROR DETECTED - Print paused")
                self.handle_error()

    def handle_error(self):
        """Handle detected error by updating print parameters"""
        try:
            self.log_message("Analyzing error and updating parameters...")
            
            # Create and start error correction thread
            correction_thread = threading.Thread(target=self.process_error_correction)
            correction_thread.daemon = True  # Ensure thread doesn't block program exit
            correction_thread.start()
            
        except Exception as e:
            self.log_message(f"Error initiating error handling: {str(e)}")
            import traceback
            self.log_message(f"Traceback: {traceback.format_exc()}")
            self.error_detected = False
            self.print_paused = False

    def process_error_correction(self):
        """Simulate error correction process"""
        try:
            # Simulate processing time
            time.sleep(2)
            
            # Update parameters using pi_sim
            try:
                # Simulate parameter update
                update_print_parameters()
                self.log_message("Parameters updated successfully")
            except Exception as param_error:
                self.log_message(f"Error updating print parameters: {str(param_error)}")
                raise  # Re-raise to be caught by outer try block
            
            # Switch to alternative gcode (simulating received updated gcode)
            try:
                lb_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 
                                     "Gcode-Reader", "gcode", "fdm_regular", "LBdef.gcode")
                if os.path.exists(lb_path):
                    try:
                        self.current_gcode = GcodeReader(lb_path, GcodeType.FDM_REGULAR)
                        self.log_message("New G-code received and loaded")
                    except Exception as gcode_error:
                        self.log_message(f"Error loading new G-code: {str(gcode_error)}")
                        raise
                else:
                    self.log_message("Error: Could not find LBdef.gcode, continuing with current G-code")
            except Exception as file_error:
                self.log_message(f"Error handling G-code file: {str(file_error)}")
                raise
            
            # Update visualization safely on the main thread
            def safe_update():
                try:
                    self.update_visualization()
                    self.update_3d_views()
                except Exception as viz_error:
                    self.log_message(f"Error updating views after correction: {str(viz_error)}")
                finally:
                    # Always reset error flags and resume printing
                    self.error_detected = False
                    self.print_paused = False
                    self.log_message("Print resumed with updated parameters")
            
            self.root.after(0, safe_update)
            
        except Exception as e:
            self.log_message(f"Error during error correction process: {str(e)}")
            import traceback
            self.log_message(f"Traceback: {traceback.format_exc()}")
            # Reset on error
            self.root.after(0, lambda: self.handle_correction_failure())

    def start_print(self):
        """Start the printing process"""
        if not self.is_printing:
            self.is_printing = True
            self.log_message("Print started")
            self.simulate_print_process()

    def pause_print(self):
        """Pause the printing process"""
        if self.is_printing and not self.print_paused:
            self.print_paused = True
            self.log_message("Print paused")

    def resume_print(self):
        """Resume the printing process"""
        if self.is_printing and self.print_paused:
            self.print_paused = False
            self.log_message("Print resumed")

    def stop_print(self):
        """Stop the printing process"""
        if self.is_printing:
            self.is_printing = False
            self.print_paused = False
            self.error_detected = False
            self.log_message("Print stopped")
            
    def handle_correction_failure(self):
        """Handle failures in the error correction process"""
        self.log_message("Error correction failed - resetting to original state")
        self.error_detected = False
        self.print_paused = False
        self.current_gcode = self.original_gcode  # Reset to original gcode
        try:
            self.update_visualization()
        except Exception as viz_error:
            self.log_message(f"Error updating visualization after failure: {str(viz_error)}")

    def update_layer_view(self):
        """Update the layer being displayed"""
        try:
            layer = int(self.layer_var.get())
            if 1 <= layer <= self.current_gcode.n_layers:
                self.current_layer = layer
                self.update_visualization()
            else:
                self.log_message(f"Invalid layer number. Must be between 1 and {self.current_gcode.n_layers}")
        except ValueError:
            self.log_message("Invalid layer number")

    def simulate_print_process(self):
        """Simulate the printing process"""
        try:
            if self.is_printing and not self.print_paused:
                self.log_message(f"Processing layer {self.current_layer}...")
                
                # Simulate error detection
                self.simulate_error_detection()
                
                # Update current layer if no error
                if not self.error_detected and not self.print_paused:
                    if self.current_layer < self.current_gcode.n_layers:
                        self.current_layer += 1
                        self.layer_var.set(str(self.current_layer))
                        try:
                            self.update_visualization()
                        except Exception as viz_error:
                            self.log_message(f"Error updating visualization: {str(viz_error)}")
                    else:
                        self.log_message("Print completed")
                        self.is_printing = False
                        return
                    
            # Schedule next update if still printing
            if self.is_printing:
                self.root.after(1000, self.simulate_print_process)  # Update every second
                
        except Exception as e:
            self.log_message(f"Error in simulate_print_process: {str(e)}")
            import traceback
            self.log_message(f"Traceback: {traceback.format_exc()}")
            self.is_printing = False  # Stop printing on error

def main():
    root = tk.Tk()
    app = PrinterSimulator(root)
    root.mainloop()

if __name__ == "__main__":
    main()