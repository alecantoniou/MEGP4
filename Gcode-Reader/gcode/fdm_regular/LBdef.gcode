; HEADER_BLOCK_START
; BambuStudio 02.03.00.70
; model printing time: 6m 10s; total estimated time: 12m 30s
; total layer number: 25
; total filament length [mm] : 462.12
; total filament volume [cm^3] : 1111.53
; total filament weight [g] : 1.39
; filament_density: 1.25
; filament_diameter: 1.75
; max_z_height: 5.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1 20250822 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if nozzle_temperature[previous_extruder] > 142 && next_extruder < 255}\nM104 S{nozzle_temperature[previous_extruder]}\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S{nozzle_temperature[next_extruder]}\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 3
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 0
; cool_plate_temp_initial_layer = 0
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = enable_support;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.075
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 1
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 70
; eng_plate_temp_initial_layer = 70
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 30
; fan_direction = undefine
; fan_max_speed = 40
; fan_min_speed = 5
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 300
; filament_change_length = 10
; filament_colour = #00AE42
; filament_colour_type = 1
; filament_cost = 34.99
; filament_density = 1.25
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.95
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFG50
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 9
; filament_minimal_purge_on_wipe_tower = 15
; filament_multi_colour = #00AE42
; filament_notes = 
; filament_pre_cooling_temperature = 0
; filament_prime_volume = 45
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_volumetric_speed = -1
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Bambu PETG-CF @BBL A1 0.4 nozzle"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PETG-CF
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 70
; hot_plate_temp_initial_layer = 70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10.7
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20231229 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20250822 ==================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM109 S{flush_temperatures[initial_no_support_extruder]} H300\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of "draw extrinsic para cali paint"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 255
; nozzle_temperature_initial_layer = 255
; nozzle_temperature_range_high = 270
; nozzle_temperature_range_low = 240
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 10%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 40
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 6
; slow_down_min_speed = 10
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70
; supertack_plate_temp_initial_layer = 70
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70
; template_custom_gcode = 
; textured_plate_temp = 70
; textured_plate_temp_initial_layer = 70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 160.972
; wipe_tower_y = 160.972
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R12
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20250822 ==================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PETG-CF
M104 S140
M140 S70

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S255

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S255
    M104 S250
    M400
    T0
M73 P1 R12
    G1 X-48.2 F3000
    M400

    M620.1 E F224.504 T270
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PETG-CF
M621 S0A

M109 S270 H300
G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S255
G92 E0
M73 P4 R11
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P6 R11
G1 X-48.2 F3000
M73 P8 R11
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PETG-CF

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S255
    G1 E10 F225
    M983 F3.75 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
M73 P9 R11
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P11 R11
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F3.75 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P12 R10
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F3.75 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P47 R6
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S205

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
M73 P48 R6
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
M73 P49 R6
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S70; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X108 Y108 I40 J40
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623

;===== home after wipe mouth end =======================

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S255 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S255

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S255
    G0 X128 E8  F540
    G0 X133 E.3742  F900
    G0 X138 E.3742  F3600
    G0 X143 E.3742  F900
    G0 X148 E.3742  F3600
    G0 X153 E.3742  F900
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F540
    G0 X133 E.3742  F900
    G0 X138 E.3742  F3600
    G0 X143 E.3742  F900
    G0 X148 E.3742  F3600
    G0 X153 E.3742  F900
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S180


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/25
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 75
G1 X109.887 Y133.923 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X109.892 Y133.914 E.00037
G3 X110.176 Y133.598 I.592 J.246 E.01565
G1 X111.134 Y133.119 E.03866
G3 X111.341 Y133.061 I.258 J.524 E.00782
G3 X112.016 Y133.57 I.033 J.658 E.0331
G3 X112.025 Y134.267 I-3.758 J.399 E.02521
G3 X111.693 Y134.804 I-.69 J-.055 E.02368
G1 X111.15 Y135.076 E.0219
M73 P50 R6
G3 X110.864 Y135.136 I-.283 J-.628 E.01066
G3 X110.259 Y134.933 I.353 J-2.054 E.02314
G3 X109.909 Y134.445 I.673 J-.851 E.02198
G3 X109.843 Y134.132 I.575 J-.284 E.01165
G1 X109.875 Y133.982 E.00554
; WIPE_START
G1 X109.892 Y133.914 E-.02653
G1 X110.01 Y133.725 E-.08486
G1 X110.176 Y133.598 E-.0795
G1 X111.134 Y133.119 E-.40686
G1 X111.341 Y133.061 E-.08185
G1 X111.552 Y133.081 E-.0804
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X109.134 Y140.285 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X109.12 Y140.297 E.00068
G3 X108.79 Y140.395 I-.378 J-.675 E.01252
G1 X108.709 Y140.251 E.00596
G1 X108.435 Y139.99 E.01366
G3 X108.35 Y139.785 I.205 J-.205 E.00824
G1 X108.35 Y135.718 E.14682
G3 X108.435 Y135.513 I.291 J0 E.00824
G1 X108.764 Y135.184 E.0168
G3 X108.859 Y135.106 I.278 J.243 E.00445
G1 X108.989 Y135.012 E.00581
G1 X109.171 Y135.068 E.00687
G3 X110.616 Y136.158 I-15.181 J21.623 E.06536
G1 X110.853 Y136.395 E.01211
G3 X111.025 Y136.81 I-.428 J.42 E.01661
G1 X111.025 Y137.403 E.02143
G1 X111.004 Y137.514 E.00408
G3 X109.454 Y140 I-150.24 J-91.958 E.10576
G1 X109.179 Y140.245 E.01332
; WIPE_START
G1 X109.12 Y140.297 E-.02992
G1 X109.033 Y140.34 E-.03689
G1 X108.79 Y140.395 E-.09446
G1 X108.709 Y140.251 E-.06273
G1 X108.435 Y139.99 E-.14381
G1 X108.372 Y139.896 E-.04307
G1 X108.35 Y139.785 E-.04306
G1 X108.35 Y138.979 E-.30606
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.218 Y135.016 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X112.218 Y136.179 E.04198
G2 X112.293 Y137.69 I12.425 J.143 E.05468
G1 X112.293 Y137.862 E.00621
G1 X111.839 Y138.276 E.0222
G2 X108.982 Y142.877 I112.671 J73.158 E.19554
G1 X108.781 Y142.82 E.00754
G2 X108.747 Y140.873 I-38.253 J-.304 E.07032
G1 X109.184 Y140.774 E.0162
G1 X109.376 Y140.682 E.00769
G1 X109.806 Y140.299 E.02078
G2 X111.367 Y137.809 I-155.882 J-99.521 E.1061
G2 X111.482 Y137.446 I-.576 J-.382 E.01395
G1 X111.482 Y136.787 E.02378
G2 X111.192 Y136.088 I-1.021 J.013 E.02801
G1 X110.707 Y135.602 E.02479
G2 X111.338 Y135.493 I.083 J-1.395 E.02335
G2 X112.168 Y135.049 I-2.131 J-4.986 E.03402
; WIPE_START
G1 X112.218 Y136.179 E-.42966
G1 X112.24 Y137.048 E-.33034
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.774 Y130.908 Z.6 F42000
G1 X132.611 Y109.464 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X132.609 Y109.502 E.00135
G2 X132.701 Y110.052 I1.111 J.096 E.02035
G1 X133.199 Y111.046 E.04016
G2 X134.314 Y111.604 I.962 J-.529 E.04786
G1 X134.685 Y111.513 E.0138
G1 X134.462 Y112.241 E.02747
G2 X133.502 Y112.218 I-.809 J14.039 E.03468
G1 X114.483 Y112.218 E.68671
G2 X112.218 Y114.483 I.037 J2.302 E.1279
G1 X112.218 Y132.92 E.6657
G1 X111.883 Y132.713 E.01422
G2 X110.948 Y132.701 I-.48 J1.006 E.03483
G1 X109.953 Y133.198 E.04017
G2 X109.396 Y134.313 I.53 J.962 E.04785
G1 X109.487 Y134.687 E.01388
G1 X108.767 Y134.466 E.02722
G2 X108.782 Y133.688 I-11.269 J-.61 E.02808
G1 X108.782 Y110.023 E.85447
G2 X110.076 Y108.782 I-1.511 J-2.871 E.06557
G1 X132.921 Y108.782 E.82483
G1 X132.713 Y109.117 E.01423
G2 X132.644 Y109.305 I1.006 J.48 E.00724
G1 X132.623 Y109.406 E.00371
M204 S6000
G1 X133.067 Y109.523 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X133.127 Y109.322 E.00754
G3 X133.67 Y108.975 I.561 J.279 E.02446
G1 X134.268 Y108.975 E.02156
G3 X134.752 Y109.222 I-.024 J.645 E.02026
G3 X135.076 Y109.85 I-3.236 J2.069 E.02554
G3 X135.137 Y110.136 I-.628 J.283 E.01066
G3 X134.934 Y110.741 I-2.056 J-.353 E.02314
G3 X134.445 Y111.091 I-.851 J-.673 E.02197
G3 X133.598 Y110.824 I-.284 J-.575 E.03541
G1 X133.12 Y109.866 E.03866
M73 P51 R6
G3 X133.062 Y109.582 I.569 J-.264 E.01055
; WIPE_START
G1 X133.127 Y109.322 E-.10185
G1 X133.263 Y109.137 E-.08734
G1 X133.355 Y109.068 E-.04392
G1 X133.459 Y109.016 E-.04398
G1 X133.67 Y108.975 E-.08186
G1 X134.268 Y108.975 E-.22693
G1 X134.478 Y109.016 E-.08165
G1 X134.582 Y109.067 E-.04383
G1 X134.676 Y109.153 E-.04865
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.057 Y111.86 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X135.066 Y111.829 E.00118
G3 X136.156 Y110.384 I21.638 J15.192 E.06536
G1 X136.394 Y110.147 E.01211
G3 X136.808 Y109.975 I.42 J.428 E.01661
G1 X137.387 Y109.975 E.02088
G3 X137.571 Y110.024 I.007 J.346 E.00697
G3 X140.001 Y111.554 I-46.089 J75.871 E.10372
G1 X140.306 Y111.89 E.01635
G1 X140.409 Y112.187 E.01135
G1 X140.26 Y112.28 E.00635
G1 X139.989 Y112.564 E.01417
G3 X139.783 Y112.65 I-.207 J-.207 E.00827
G1 X135.717 Y112.65 E.14683
G3 X135.535 Y112.586 I.015 J-.332 E.00704
G1 X135.135 Y112.186 E.02044
G1 X135.011 Y112.008 E.00783
G1 X135.039 Y111.917 E.00342
; WIPE_START
G1 X135.066 Y111.829 E-.03521
G1 X135.359 Y111.405 E-.19575
G1 X136.156 Y110.384 E-.49225
G1 X136.225 Y110.316 E-.03679
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X142.336 Y112.018 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X142.28 Y112.219 E.00755
G2 X140.913 Y112.246 I-.235 J23.205 E.04935
G1 X140.707 Y111.652 E.02271
G1 X140.3 Y111.203 E.02186
G2 X137.777 Y109.613 I-50.416 J77.208 E.10768
G2 X137.408 Y109.518 I-.351 J.597 E.01395
G2 X136.612 Y109.535 I-.311 J4.05 E.02877
G2 X136.086 Y109.808 I.265 J1.154 E.02162
G1 X135.603 Y110.291 E.0247
G2 X135.493 Y109.662 I-1.393 J-.082 E.02327
G2 X135.017 Y108.782 I-5.005 J2.141 E.03619
G2 X136.58 Y108.756 I.318 J-27.806 E.05646
G3 X137.342 Y108.707 I.623 J3.764 E.0276
G1 X137.792 Y109.2 E.02411
G2 X142.284 Y111.988 I66.732 J-102.503 E.19089
; WIPE_START
G1 X142.28 Y112.219 E-.08813
G1 X141.483 Y112.222 E-.30292
G1 X140.913 Y112.246 E-.21649
G1 X140.782 Y111.867 E-.15246
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X147.31 Y112.477 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X147.35 Y112.325 I-.306 J-.161 E.00569
G1 X147.35 Y108.25 E.14715
G1 X147.75 Y108.25 E.01444
G1 X147.739 Y112.737 E.16202
G1 X144.007 Y112.75 E.13472
G2 X140.982 Y112.7 I-1.919 J24.795 E.10931
G1 X140.488 Y112.75 E.01795
G1 X135.012 Y112.75 E.19768
G2 X133.501 Y112.675 I-1.367 J12.329 E.05468
G1 X114.493 Y112.675 E.6863
G2 X112.675 Y114.493 I.023 J1.841 E.10275
G1 X112.675 Y136.177 E.78294
G2 X112.75 Y137.667 I12.049 J.142 E.05389
G1 X112.75 Y138.143 E.01719
G2 X112.566 Y138.232 I.083 J.408 E.00747
G1 X112.19 Y138.575 E.01834
G2 X108.829 Y144.069 I81.069 J53.371 E.2326
G3 X108.368 Y144.922 I-4.485 J-1.868 E.03507
G1 X108.349 Y145.025 E.00376
G1 X108.343 Y147.014 E.07183
G2 X108.678 Y147.337 I.374 J-.052 E.0181
G1 X112.75 Y147.349 E.14701
G1 X112.75 Y147.75 E.01447
G1 X108.262 Y147.739 E.16203
G1 X108.25 Y144.553 E.11504
G2 X108.264 Y140.582 I-27.426 J-2.084 E.14347
G1 X108.25 Y140.099 E.01748
G1 X108.25 Y135.179 E.17761
G2 X108.325 Y133.687 I-12.016 J-1.35 E.05399
G1 X108.325 Y109.731 E.86493
G2 X109.806 Y108.325 I-1.125 J-2.668 E.07538
G1 X135.533 Y108.325 E.9289
G2 X137.041 Y108.25 I.144 J-12.334 E.05454
G1 X137.643 Y108.25 E.02175
G1 X137.657 Y108.321 E.00261
G2 X137.738 Y108.463 I.359 J-.11 E.00595
G1 X138.09 Y108.848 E.01884
G2 X143.558 Y112.185 I51.497 J-78.242 E.23132
G3 X144.402 Y112.642 I-1.998 J4.693 E.03473
G1 X144.505 Y112.661 E.00378
G1 X147.014 Y112.661 E.09058
G2 X147.278 Y112.527 I-.01 J-.346 E.01104
; WIPE_START
G1 X147.35 Y112.325 E-.08145
G1 X147.35 Y110.54 E-.67855
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X143.569 Y112.467 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.32621
G1 F3000
M204 S500
G1 X142.527 Y112.184 E.02417
M204 S6000
G1 X142.527 Y112.184 F42000
; LINE_WIDTH: 0.363884
G1 F3000
M204 S500
G1 X143.569 Y112.468 E.02739
; WIPE_START
G1 X142.527 Y112.184 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.828 Y111.407 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.138255
M73 P52 R6
G1 F3000
M204 S500
G1 X140.942 Y111.501 E.00111
G1 X141.431 Y111.996 E.00524
M204 S6000
G1 X141.77 Y111.966 F42000
; LINE_WIDTH: 0.252496
G1 F3000
M204 S500
G1 X140.987 Y111.761 E.01341
M204 S6000
G1 X140.725 Y112.401 F42000
; LINE_WIDTH: 0.135
G1 F3000
M204 S500
G1 X140.371 Y112.502 E.00268
; WIPE_START
G1 X140.725 Y112.401 E-.76
; WIPE_END
M73 P52 R5
G1 E-.04 F1800
M204 S6000
G1 X133.89 Y111.993 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.174692
G1 F3000
M204 S500
G1 X133.623 Y111.805 E.00339
; LINE_WIDTH: 0.154715
G1 X133.535 Y111.737 E.00099
; LINE_WIDTH: 0.120185
G1 X133.447 Y111.669 E.00068
M204 S6000
G1 X133.588 Y111.862 F42000
; LINE_WIDTH: 0.236766
G1 F3000
M204 S500
G1 X133.852 Y111.903 E.0041
; LINE_WIDTH: 0.204084
G2 X134.322 Y111.919 I.366 J-3.71 E.00599
M204 S6000
G1 X134.684 Y112.297 F42000
; LINE_WIDTH: 0.254742
G1 F3000
M204 S500
G1 X135.106 Y112.521 E.008
M204 S6000
G1 X134.934 Y111.565 F42000
; LINE_WIDTH: 0.121734
G1 F3000
M204 S500
G1 X134.991 Y111.451 E.0008
; LINE_WIDTH: 0.159377
G1 X135.047 Y111.336 E.00118
; LINE_WIDTH: 0.197021
G1 X135.104 Y111.221 E.00156
; LINE_WIDTH: 0.234047
G1 X135.113 Y111.176 E.00068
; LINE_WIDTH: 0.273805
G1 X135.12 Y111.137 E.00072
; LINE_WIDTH: 0.310981
G1 X135.127 Y111.098 E.00084
; LINE_WIDTH: 0.329581
G2 X135.26 Y110.924 I-4.925 J-3.907 E.00497
G1 X135.277 Y110.898 E.00071
M204 S6000
G1 X135.244 Y111.181 F42000
; LINE_WIDTH: 0.106173
G1 F3000
M204 S500
G2 X135.352 Y110.366 I-19.938 J-3.069 E.00411
M204 S6000
G1 X135.364 Y110.368 F42000
; LINE_WIDTH: 0.263679
G1 F3000
M204 S500
G3 X135.281 Y110.823 I-9.707 J-1.519 E.00806
; LINE_WIDTH: 0.312392
G1 X135.277 Y110.898 E.0016
G1 X135.317 Y110.886 E.00088
; LINE_WIDTH: 0.266026
G1 X135.357 Y110.875 E.00073
; LINE_WIDTH: 0.217004
G1 X135.397 Y110.863 E.00057
; LINE_WIDTH: 0.167982
G1 X135.436 Y110.852 E.00041
; LINE_WIDTH: 0.123252
G1 X135.672 Y110.585 E.00226
; WIPE_START
G1 X135.436 Y110.852 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.59 Y109.344 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.441509
G1 F3000
M204 S500
G3 X136.392 Y109.174 I2.125 J8.013 E.02582
; LINE_WIDTH: 0.389063
G1 X136.52 Y109.152 E.00355
; LINE_WIDTH: 0.382308
G3 X137.403 Y109.112 I.772 J7.363 E.02371
; WIPE_START
G1 X137.084 Y109.112 E-.27365
G1 X136.52 Y109.152 E-.48635
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.4 Y108.553 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.231012
G1 F3000
M204 S500
G1 X134.82 Y108.901 E.00809
M204 S6000
G1 X134.802 Y108.917 F42000
; LINE_WIDTH: 0.130219
G1 F3000
M204 S500
G2 X134.445 Y108.553 I-4.065 J3.641 E.00351
M204 S6000
G1 X134.693 Y108.693 F42000
; LINE_WIDTH: 0.246834
G1 F3000
M204 S500
G2 X133.397 Y108.672 I-.754 J6.494 E.0209
G1 X133.349 Y108.708 E.00097
; LINE_WIDTH: 0.231682
G1 X133.117 Y108.901 E.00451
M204 S6000
G1 X133.134 Y108.918 F42000
; LINE_WIDTH: 0.130342
G1 F3000
M204 S500
G3 X133.491 Y108.553 I4.066 J3.628 E.00352
; WIPE_START
G1 X133.134 Y108.918 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.66 Y108.965 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5013
G1 F5890.31
M204 S500
G1 X132.216 Y109.521 E.02847
G2 X132.435 Y110.388 I1.635 J.048 E.03283
G1 X131.217 Y109.17 E.06237
G1 X130.569 Y109.17 E.02347
G1 X133.004 Y111.605 E.1247
G1 X132.865 Y111.786 E.00826
G1 X132.921 Y111.83 E.00258
G1 X132.58 Y111.83 E.01234
G1 X129.921 Y109.17 E.13617
G1 X129.273 Y109.17 E.02347
G1 X131.932 Y111.83 E.13617
G1 X131.284 Y111.83 E.02347
G1 X128.624 Y109.17 E.13617
G1 X127.976 Y109.17 E.02347
G1 X130.635 Y111.83 E.13617
G1 X129.987 Y111.83 E.02347
G1 X127.328 Y109.17 E.13617
G1 X126.68 Y109.17 E.02347
G1 X129.339 Y111.83 E.13617
G1 X128.691 Y111.83 E.02347
G1 X126.031 Y109.17 E.13617
G1 X125.383 Y109.17 E.02347
G1 X128.042 Y111.83 E.13617
G1 X127.394 Y111.83 E.02347
G1 X124.735 Y109.17 E.13617
G1 X124.087 Y109.17 E.02347
G1 X126.746 Y111.83 E.13617
G1 X126.098 Y111.83 E.02347
G1 X123.439 Y109.17 E.13617
G1 X122.79 Y109.17 E.02347
G1 X125.449 Y111.83 E.13617
G1 X124.801 Y111.83 E.02347
G1 X122.142 Y109.17 E.13616
G1 X121.494 Y109.17 E.02347
G1 X124.153 Y111.83 E.13616
G1 X123.505 Y111.83 E.02347
G1 X120.846 Y109.17 E.13616
G1 X120.197 Y109.17 E.02347
G1 X122.856 Y111.83 E.13616
G1 X122.208 Y111.83 E.02347
G1 X119.549 Y109.17 E.13616
G1 X118.901 Y109.17 E.02347
G1 X121.56 Y111.83 E.13616
G1 X120.912 Y111.83 E.02347
G1 X118.253 Y109.17 E.13616
G1 X117.604 Y109.17 E.02347
G1 X120.263 Y111.829 E.13616
G1 X119.615 Y111.829 E.02347
G1 X116.956 Y109.17 E.13616
G1 X116.308 Y109.171 E.02347
G1 X118.967 Y111.829 E.13616
G1 X118.319 Y111.829 E.02347
G1 X115.66 Y109.171 E.13616
G1 X115.011 Y109.171 E.02347
G1 X117.67 Y111.829 E.13616
G1 X117.022 Y111.829 E.02347
G1 X114.363 Y109.171 E.13616
G1 X113.715 Y109.171 E.02347
G1 X116.374 Y111.829 E.13615
G1 X115.726 Y111.829 E.02347
G1 X113.067 Y109.171 E.13615
G1 X112.418 Y109.171 E.02347
G1 X115.077 Y111.829 E.13615
G1 X114.432 Y111.832 E.02336
M73 P53 R5
G1 X111.77 Y109.171 E.13631
G1 X111.122 Y109.171 E.02347
G1 X113.859 Y111.908 E.14018
G1 X113.378 Y112.075 E.01845
G1 X110.474 Y109.171 E.14872
G1 X110.278 Y109.171 E.0071
G1 X110.091 Y109.436 E.01175
G1 X112.966 Y112.311 E.14723
G1 X112.614 Y112.607 E.01666
G1 X109.782 Y109.775 E.14501
G3 X109.429 Y110.07 I-1.264 J-1.153 E.01671
G1 X112.317 Y112.959 E.14791
G1 X112.079 Y113.369 E.01717
G1 X109.171 Y110.46 E.14892
G1 X109.171 Y111.109 E.02347
G1 X111.91 Y113.849 E.1403
G2 X111.833 Y114.42 I2.189 J.586 E.02093
G1 X109.171 Y111.757 E.13636
G1 X109.171 Y112.405 E.02347
G1 X111.829 Y115.064 E.13615
G1 X111.829 Y115.712 E.02347
G1 X109.171 Y113.053 E.13615
G1 X109.171 Y113.702 E.02347
G1 X111.829 Y116.361 E.13615
G1 X111.829 Y117.009 E.02347
G1 X109.171 Y114.35 E.13615
G1 X109.171 Y114.998 E.02347
G1 X111.829 Y117.657 E.13616
G1 X111.829 Y118.305 E.02347
G1 X109.171 Y115.646 E.13616
G1 X109.171 Y116.295 E.02347
G1 X111.829 Y118.954 E.13616
G1 X111.829 Y119.602 E.02347
G1 X109.17 Y116.943 E.13616
G1 X109.17 Y117.591 E.02347
G1 X111.829 Y120.25 E.13616
G1 X111.829 Y120.898 E.02347
G1 X109.17 Y118.239 E.13616
G1 X109.17 Y118.888 E.02347
G1 X111.829 Y121.547 E.13616
G1 X111.83 Y122.195 E.02347
G1 X109.17 Y119.536 E.13616
G1 X109.17 Y120.184 E.02347
G1 X111.83 Y122.843 E.13616
G1 X111.83 Y123.491 E.02347
G1 X109.17 Y120.832 E.13616
G1 X109.17 Y121.481 E.02347
G1 X111.83 Y124.14 E.13616
G1 X111.83 Y124.788 E.02347
G1 X109.17 Y122.129 E.13616
G1 X109.17 Y122.777 E.02347
G1 X111.83 Y125.436 E.13616
G1 X111.83 Y126.084 E.02347
G1 X109.17 Y123.425 E.13617
G1 X109.17 Y124.073 E.02347
G1 X111.83 Y126.733 E.13617
G1 X111.83 Y127.381 E.02347
G1 X109.17 Y124.722 E.13617
G1 X109.17 Y125.37 E.02347
G1 X111.83 Y128.029 E.13617
G1 X111.83 Y128.677 E.02347
G1 X109.17 Y126.018 E.13617
G1 X109.17 Y126.666 E.02347
G1 X111.83 Y129.326 E.13617
G1 X111.83 Y129.974 E.02347
G1 X109.17 Y127.315 E.13617
G1 X109.17 Y127.963 E.02347
G1 X111.83 Y130.622 E.13617
G1 X111.83 Y131.27 E.02347
G1 X109.17 Y128.611 E.13617
G1 X109.17 Y129.259 E.02347
G1 X111.83 Y131.919 E.13617
G1 X111.83 Y132.276 E.01293
G2 X111.478 Y132.216 I-.523 J1.998 E.01293
G1 X109.17 Y129.908 E.11818
G1 X109.17 Y130.556 E.02347
G1 X110.912 Y132.298 E.08921
G2 X110.471 Y132.505 I.901 J2.492 E.01767
G1 X109.17 Y131.204 E.06662
G1 X109.17 Y131.852 E.02347
M73 P54 R5
G1 X110.039 Y132.721 E.04449
G2 X109.618 Y132.949 I1.053 J2.449 E.01734
G1 X108.965 Y132.295 E.03348
; WIPE_START
G1 X109.618 Y132.949 E-.35135
G1 X110.039 Y132.721 E-.18175
G1 X109.617 Y132.299 E-.2269
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.484 Y135.136 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.166508
G1 F3000
M204 S500
G1 X108.704 Y134.685 E.00489
M204 S6000
G1 X108.713 Y134.688 F42000
; LINE_WIDTH: 0.249373
G1 F3000
M204 S500
G1 X108.487 Y135.107 E.00776
; WIPE_START
G1 X108.713 Y134.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X109.009 Y133.887 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.169603
G1 F3000
M204 S500
G3 X109.263 Y133.534 I4.023 J2.631 E.00436
; LINE_WIDTH: 0.120197
G1 X109.331 Y133.446 E.00068
M204 S6000
G1 X109.139 Y133.586 F42000
; LINE_WIDTH: 0.234655
G1 F3000
M204 S500
G2 X109.096 Y133.867 I3.096 J.615 E.00431
; LINE_WIDTH: 0.200313
G2 X109.084 Y134.324 I3.666 J.323 E.00568
M204 S6000
G1 X109.756 Y134.709 F42000
; LINE_WIDTH: 0.112918
G1 F3000
M204 S500
G1 X109.797 Y134.821 E.00066
; LINE_WIDTH: 0.144731
G1 X109.851 Y134.949 E.00112
; LINE_WIDTH: 0.181421
G1 X109.88 Y135.005 E.00069
; LINE_WIDTH: 0.219281
G1 X109.888 Y135.046 E.00058
; LINE_WIDTH: 0.263831
G1 X109.895 Y135.087 E.00073
; LINE_WIDTH: 0.308381
G1 X109.903 Y135.129 E.00088
; LINE_WIDTH: 0.331023
G2 X110.076 Y135.26 I4.483 J-5.692 E.00494
G1 X110.1 Y135.276 E.00066
M204 S6000
G1 X109.818 Y135.244 F42000
; LINE_WIDTH: 0.106113
G1 F3000
M204 S500
G2 X110.633 Y135.352 I3.25 J-21.528 E.00411
M204 S6000
G1 X110.632 Y135.363 F42000
; LINE_WIDTH: 0.263712
G1 F3000
M204 S500
G3 X110.175 Y135.28 I1.549 J-9.864 E.0081
; LINE_WIDTH: 0.297612
G1 X110.138 Y135.278 E.00076
; LINE_WIDTH: 0.326307
G1 X110.1 Y135.276 E.00084
; LINE_WIDTH: 0.316033
G1 X110.112 Y135.316 E.0009
; LINE_WIDTH: 0.266802
G1 X110.123 Y135.356 E.00074
; LINE_WIDTH: 0.217571
G1 X110.135 Y135.396 E.00057
; LINE_WIDTH: 0.16834
G1 X110.146 Y135.436 E.00041
; LINE_WIDTH: 0.123395
G1 X110.414 Y135.673 E.00228
; WIPE_START
G1 X110.146 Y135.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.633 Y135.601 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.462138
G1 F3000
M204 S500
G1 X111.799 Y136.267 E.02272
; LINE_WIDTH: 0.407509
G1 X111.818 Y136.395 E.00375
; LINE_WIDTH: 0.370265
G1 X111.838 Y136.524 E.00337
; LINE_WIDTH: 0.343962
G3 X111.863 Y137.235 I-9.345 J.692 E.01692
G1 X111.875 Y137.467 E.00552
; LINE_WIDTH: 0.389073
G3 X111.866 Y137.725 I-2.788 J.026 E.00705
; LINE_WIDTH: 0.416915
G1 X111.856 Y137.951 E.0067
M204 S6000
G1 X112.037 Y137.432 F42000
; LINE_WIDTH: 0.355525
G1 F3000
M204 S500
G1 X111.795 Y137.803 E.01096
; LINE_WIDTH: 0.325031
G1 X111.731 Y137.888 E.00235
; LINE_WIDTH: 0.284705
G1 X111.66 Y137.98 E.00222
; LINE_WIDTH: 0.232302
G2 X111.583 Y138.075 I.711 J.657 E.00184
G1 X111.278 Y138.555 E.0085
; LINE_WIDTH: 0.215346
G1 X110.108 Y140.405 E.02982
G3 X110.039 Y140.513 I-.805 J-.438 E.00174
; LINE_WIDTH: 0.240512
G1 X109.936 Y140.637 E.00252
; LINE_WIDTH: 0.288866
G1 X109.833 Y140.762 E.00314
; LINE_WIDTH: 0.337219
G1 X109.729 Y140.886 E.00376
; LINE_WIDTH: 0.385572
G1 X109.626 Y141.011 E.00438
; LINE_WIDTH: 0.421632
G1 X109.008 Y141.656 E.02675
M204 S6000
G1 X109.006 Y141.515 F42000
; LINE_WIDTH: 0.65119
G1 F3000
M204 S500
G1 X109.326 Y141.283 E.01901
; LINE_WIDTH: 0.618625
G1 X110.01 Y140.729 E.04003
M204 S6000
G1 X109.41 Y140.919 F42000
; LINE_WIDTH: 0.505035
G1 F3000
M204 S500
G1 X109.038 Y142.311 E.05262
M204 S6000
G1 X108.812 Y143.066 F42000
; LINE_WIDTH: 0.157968
G1 F3000
M204 S500
G1 X108.573 Y143.941 E.00824
; LINE_WIDTH: 0.143736
G1 X108.552 Y144.025 E.00069
; LINE_WIDTH: 0.116523
G1 X108.53 Y144.109 E.0005
M204 S6000
G1 X108.53 Y144.109 F42000
; LINE_WIDTH: 0.383486
G1 F3000
M204 S500
G1 X108.816 Y143.068 E.02904
M204 S6000
G1 X108.817 Y143.068 F42000
; LINE_WIDTH: 0.317613
G1 F3000
M204 S500
G1 X108.531 Y144.109 E.02342
; WIPE_START
G1 X108.817 Y143.068 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.765 Y136.028 Z.6 F42000
G1 X112.447 Y134.399 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.230903
G1 F3000
M204 S500
G1 X112.1 Y134.819 E.00809
M204 S6000
G1 X112.084 Y134.802 F42000
; LINE_WIDTH: 0.130072
G1 F3000
M204 S500
G2 X112.447 Y134.444 I-3.647 J-4.07 E.00351
M204 S6000
G1 X112.307 Y134.692 F42000
; LINE_WIDTH: 0.24682
G1 F3000
M204 S500
G2 X112.328 Y133.397 I-6.499 J-.754 E.0209
G1 X112.292 Y133.349 E.00096
; LINE_WIDTH: 0.231721
G1 X112.099 Y133.116 E.00451
M204 S6000
G1 X112.082 Y133.134 F42000
; LINE_WIDTH: 0.130402
G1 F3000
M204 S500
G3 X112.447 Y133.491 I-3.653 J4.09 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X112.082 Y133.134 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/25
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
; OBJECT_ID: 75
M204 S10000
G17
G3 Z.6 I-.904 J-.814 P1  F42000
G1 X110.205 Y135.219 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.855 Y135.414 I.886 J-1.773 E.02196
G2 X111.264 Y135.328 I.006 J-.99 E.01353
G2 X111.946 Y134.973 I-1.58 J-3.864 E.02477
G2 X112.21 Y134.647 I-.602 J-.756 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01963
G2 X108.781 Y143.557 I105.466 J68.732 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.09312
G2 X109.374 Y140.479 I.278 J-.697 E.02651
G1 X109.681 Y140.167 E.01408
G1 X111.21 Y137.721 E.09275
G2 X111.302 Y137.429 I-.463 J-.306 E.00997
G1 X111.302 Y136.796 E.02035
G2 X111.059 Y136.209 I-.855 J.01 E.02095
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.16089
G1 X110.855 Y135.414 E-.10328
G1 X111.004 Y135.406 E-.0566
G1 X111.264 Y135.328 E-.10312
G1 X111.946 Y134.973 E-.29225
G1 X112.031 Y134.895 E-.04386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.998 Y133.958 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.18 Y133.225 E.03158
G3 X111.352 Y133.176 I.215 J.434 E.00535
G3 X111.902 Y133.591 I.026 J.537 E.02227
G3 X111.91 Y134.262 I-3.617 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.971 E.01777
G3 X110.867 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.667 J-2.863 E.01729
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.015 I.469 J-.24 E.01182
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09165
G1 X110.232 Y133.699 E-.06569
G1 X111.18 Y133.225 E-.40284
G1 X111.352 Y133.176 E-.06786
G1 X111.539 Y133.193 E-.07139
G1 X111.682 Y133.264 E-.06057
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.11 Y140.188 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F7160.291
M204 S5000
G1 X109.001 Y140.247 E.00371
G3 X108.734 Y140.224 I-.105 J-.326 E.00818
G3 X108.466 Y139.965 I1.016 J-1.32 E.01113
G3 X108.39 Y139.781 I.184 J-.184 E.00609
G1 X108.39 Y135.722 E.12088
G3 X108.466 Y135.538 I.26 J0 E.00609
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.199 J.204 E.0041
G3 X109.189 Y135.183 I.074 J.401 E.00844
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.392 E.01719
G3 X110.868 Y137.529 I-.259 J-.005 E.0043
G1 X109.372 Y139.923 E.08409
G1 X109.152 Y140.145 E.00931
; WIPE_START
M204 S6000
G1 X109.001 Y140.247 E-.06948
G1 X108.935 Y140.269 E-.02636
G1 X108.797 Y140.254 E-.05267
G1 X108.734 Y140.224 E-.02653
G1 X108.466 Y139.965 E-.14167
G1 X108.41 Y139.88 E-.03859
G1 X108.39 Y139.781 E-.03856
G1 X108.39 Y138.817 E-.36614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.277 Y132.954 Z.8 F42000
G1 X132.785 Y109.549 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.685 E.00437
G2 X132.866 Y109.978 I.9 J-.082 E.00983
G1 X133.356 Y110.959 E.03525
G2 X134.552 Y111.347 I.805 J-.444 E.04453
G2 X134.967 Y111.123 I-.997 J-2.336 E.01516
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.589 J1.5 E.01704
G2 X134.847 Y112.398 I.691 J.294 E.02339
G1 X114.487 Y112.398 E.65471
G2 X112.398 Y114.487 I.032 J2.121 E.10508
G1 X112.398 Y133.246 E.60322
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04492
G1 X110.041 Y133.356 E.03524
G2 X109.653 Y134.552 I.444 J.805 E.04453
G2 X109.879 Y134.97 I2.345 J-1.001 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.791 I-1.51 J1.599 E.01715
G2 X108.602 Y134.848 I-.293 J.692 E.02337
G1 X108.602 Y109.916 E.80173
G2 X109.975 Y108.602 I-1.39 J-2.826 E.06208
G1 X133.246 Y108.602 E.74833
G1 X133.291 Y108.79 E.00622
G2 X132.791 Y109.489 I.397 J.812 E.02878
M204 S10000
G1 X133.178 Y109.554 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.563 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.133 I-.513 J.233 E.00724
G3 X134.835 Y110.681 I-2.864 J-.667 E.01729
G3 X134.401 Y110.985 I-.736 J-.591 E.016
G3 X133.699 Y110.768 I-.239 J-.469 E.02421
G1 X133.225 Y109.819 E.03159
G3 X133.176 Y109.614 I.463 J-.218 E.00634
; WIPE_START
M204 S6000
G1 X133.194 Y109.461 E-.05854
G1 X133.277 Y109.292 E-.07138
G1 X133.416 Y109.166 E-.07138
G1 X133.501 Y109.124 E-.03587
G1 X133.676 Y109.09 E-.06774
G1 X134.262 Y109.09 E-.22288
G1 X134.437 Y109.123 E-.06754
G1 X134.521 Y109.165 E-.03577
G1 X134.596 Y109.222 E-.03575
G1 X134.704 Y109.363 E-.0676
G1 X134.734 Y109.423 E-.02554
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.811 I.337 J.053 E.00403
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.419 J.528 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.226 Y111.933 E.01257
G3 X140.217 Y112.276 I-.353 J.163 E.01058
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.185 E.0061
G1 X135.731 Y112.61 E.12058
G3 X135.567 Y112.561 I-.002 J-.294 E.00517
G1 X135.205 Y112.203 E.01518
G3 X135.131 Y111.996 I.266 J-.213 E.00667
; WIPE_START
M204 S6000
G1 X135.182 Y111.811 E-.07299
G1 X136.243 Y110.46 E-.65247
G1 X136.307 Y110.396 E-.03454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.567 Y111.719 I-.805 J-.289 E.02249
G1 X140.175 Y111.325 E.01788
G1 X137.72 Y109.79 E.09311
G2 X137.428 Y109.698 I-.306 J.464 E.00997
G1 X136.795 Y109.698 E.02036
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.145 I-1.761 J-.879 E.02179
G2 X135.329 Y109.736 I-.988 J-.006 E.01354
G2 X134.974 Y109.054 I-3.866 J1.581 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.919 Y109.072 E.0183
G2 X142.966 Y112.189 I67.655 J-103.916 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
M73 P55 R5
G1 E-.04 F1800
M204 S10000
G1 X147.279 Y112.446 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.281 J-.137 E.00379
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99174
G2 X112.79 Y114.495 I.02 J1.726 E.07954
G1 X112.79 Y138.226 E.70686
G2 X112.619 Y138.305 I.046 J.325 E.00569
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.871 E.07841
G1 X108.406 Y144.937 E.14146
G1 X108.389 Y145.028 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.681 Y147.297 I.312 J-.013 E.01379
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y109.653 E1.13599
G2 X109.734 Y108.21 I-.965 J-2.546 E.06417
G1 X137.729 Y108.21 E.83389
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07455
G2 X147.247 Y112.497 I-.014 J-.312 E.00819
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07026
G1 X147.31 Y110.508 E-.68974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131751
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.55 J-.954 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02756
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.047 Y112.011 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.40895
G1 F7376.445
M204 S6000
G1 X141.923 Y112.011 E.02535
G1 X141.242 Y111.601 E.02301
G1 X141 Y111.787 E.00883
G1 X141.034 Y111.953 E.00489
M204 S10000
G1 X140.71 Y111.517 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.335998
G1 F9212.571
M204 S6000
G1 X140.39 Y111.046 E.01317
G3 X138.128 Y109.626 I70.14 J-114.259 E.06184
; LINE_WIDTH: 0.330822
G1 F9378.197
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300208
G1 F10494.107
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168774
G1 F15000
M204 S6000
G1 X138.617 Y109.758 E.00969
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521867
G1 F5637.371
M204 S6000
G1 X135.906 Y109.521 E.00725
G1 X135.975 Y109.565 E.00311
; LINE_WIDTH: 0.508513
G1 F5799.063
G1 X136.13 Y109.482 E.00646
; LINE_WIDTH: 0.477318
G1 F6215.505
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443123
G1 F6746.585
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390016
G1 F7778.834
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.138 E.00523
G1 X137.427 Y109.112 E.0014
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405928
G1 F7437.863
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.443123
G1 F6746.585
G1 X136.171 Y109.015 E.00972
; LINE_WIDTH: 0.475715
G1 F6238.52
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511913
G1 F5757.021
G1 X135.474 Y109.043 E.01291
G1 X135.689 Y109.488 E.0183
M204 S10000
G1 X135.634 Y110.011 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124509
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00095
G1 X135.628 Y110.248 E.00064
M204 S10000
G1 X135.153 Y111.003 F42000
; LINE_WIDTH: 0.115949
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.154
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.111325
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140129
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.06 Y111.914 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60476
G1 F4805.639
M204 S6000
G1 X134.199 Y111.913 E.00613
M204 S10000
G1 X113.597 Y110.553 F42000
; LINE_WIDTH: 0.49787
G1 F5934.719
M204 S6000
G1 X113.922 Y110.53 E.01173
; LINE_WIDTH: 0.45309
G1 F6582.637
G1 X114.248 Y110.508 E.01058
; LINE_WIDTH: 0.415267
G1 F7251.305
G1 X130.973 Y110.5 E.49191
M204 S10000
G1 X110.932 Y111.881 F42000
; LINE_WIDTH: 0.524815
G1 F5602.88
M204 S6000
G1 X111.345 Y111.386 E.02456
G1 X111.88 Y110.932 E.0267
G1 X111.109 Y110.932 E.02936
G1 X110.932 Y111.111 E.00959
G1 X110.932 Y111.821 E.02702
M204 S10000
G1 X110.52 Y113.951 F42000
; LINE_WIDTH: 0.425457
G1 F7058.155
M204 S6000
G1 X110.79 Y113.018 E.02936
G1 X111.141 Y112.328 E.02337
G1 X111.569 Y111.778 E.02107
G1 X112.086 Y111.31 E.02108
G1 X112.677 Y110.94 E.02106
G1 X113.315 Y110.668 E.02094
; LINE_WIDTH: 0.461543
G1 F6449.725
G1 X113.456 Y110.61 E.00505
; LINE_WIDTH: 0.500688
G1 F5898.191
G1 X113.597 Y110.553 E.00552
; LINE_WIDTH: 0.503549
G1 F5861.559
G1 X113.361 Y110.536 E.0086
; LINE_WIDTH: 0.470125
G1 F6320.151
G1 X113.125 Y110.519 E.00797
; LINE_WIDTH: 0.421818
G1 F7125.927
G1 X112.89 Y110.502 E.00707
G1 X110.916 Y110.502 E.05907
G1 X110.544 Y110.885 E.01598
G1 X110.502 Y110.97 E.00284
G2 X110.517 Y113.892 I62.99 J1.137 E.08744
M204 S10000
G1 X112.006 Y131.819 F42000
; LINE_WIDTH: 0.41999
G1 F7160.477
M204 S6000
G1 X112.006 Y114.478 E.51652
G1 X112.048 Y114.047 E.01288
G1 X112.229 Y113.469 E.01805
G3 X113.873 Y112.086 I2.329 J1.1 E.066
G3 X114.478 Y112.006 I.896 J4.413 E.01818
G1 X133.545 Y112.006 E.56793
; LINE_WIDTH: 0.442969
G1 F6749.178
G1 X133.674 Y111.983 E.00414
; LINE_WIDTH: 0.488927
G1 F6053.727
G1 X133.803 Y111.96 E.00461
; LINE_WIDTH: 0.534884
G1 F5488.209
G1 X133.932 Y111.937 E.00509
; LINE_WIDTH: 0.580842
G1 F5019.322
G1 X134.06 Y111.914 E.00556
G1 X133.953 Y111.865 E.00504
; LINE_WIDTH: 0.534884
G1 F5488.209
G1 X133.845 Y111.815 E.00461
; LINE_WIDTH: 0.488927
G1 F6053.727
G1 X133.737 Y111.766 E.00418
; LINE_WIDTH: 0.420044
G1 F7159.455
G1 X133.629 Y111.716 E.00353
G1 X133.247 Y111.458 E.01374
G1 X133.01 Y111.142 E.01177
G1 X132.511 Y110.145 E.03321
G1 X132.431 Y109.923 E.00704
G1 X132.4 Y109.448 E.01419
G1 X132.541 Y108.994 E.01415
G1 X110.188 Y108.994 E.66588
G1 X110.042 Y109.216 E.00792
G1 X109.621 Y109.688 E.01884
G3 X108.994 Y110.14 I-1.894 J-1.967 E.02311
G1 X108.994 Y133.545 E.69722
; LINE_WIDTH: 0.442974
G1 F6749.093
G1 X109.017 Y133.673 E.00413
; LINE_WIDTH: 0.488942
G1 F6053.523
G1 X109.04 Y133.802 E.00461
; LINE_WIDTH: 0.534909
G1 F5487.93
G1 X109.063 Y133.931 E.00508
; LINE_WIDTH: 0.580877
G1 F5018.996
G1 X109.086 Y134.06 E.00556
G1 X109.135 Y133.952 E.00503
; LINE_WIDTH: 0.534909
G1 F5487.93
G1 X109.185 Y133.844 E.0046
; LINE_WIDTH: 0.488942
G1 F6053.523
G1 X109.234 Y133.737 E.00417
; LINE_WIDTH: 0.420682
G1 F7147.371
G1 X109.284 Y133.629 E.00353
G1 X109.541 Y133.247 E.01377
G1 X109.857 Y133.009 E.01179
G1 X110.854 Y132.511 E.03326
G1 X111.077 Y132.431 E.00706
G1 X111.552 Y132.399 E.01423
G1 X112.006 Y132.54 E.01417
G1 X112.006 Y131.879 E.01973
M204 S10000
G1 X111.629 Y132.034 F42000
; LINE_WIDTH: 0.41999
G1 F7160.475
M204 S6000
G1 X111.629 Y114.478 E.52293
G1 X111.688 Y113.935 E.01627
G1 X111.869 Y113.356 E.01805
G1 X112.12 Y112.894 E.01566
G3 X113.242 Y111.919 I2.616 J1.877 E.04467
G1 X113.801 Y111.716 E.01771
G3 X114.478 Y111.629 I.975 J4.894 E.02034
G1 X132.903 Y111.629 E.5488
G1 X132.672 Y111.311 E.01169
G1 X132.174 Y110.314 E.03321
G1 X132.056 Y109.958 E.01116
G1 X132.034 Y109.371 E.0175
G1 X110.394 Y109.371 E.64459
G1 X109.905 Y109.936 E.02224
G1 X109.491 Y110.278 E.01602
G1 X109.371 Y110.355 E.00423
G1 X109.371 Y132.902 E.67157
G1 X109.689 Y132.672 E.01168
G1 X110.686 Y132.174 E.0332
G1 X111.041 Y132.056 E.01117
G1 X111.569 Y132.036 E.01572
M204 S10000
G1 X111.252 Y131.657 F42000
G1 F7160.475
M204 S6000
G1 X111.252 Y114.478 E.5117
G1 X111.328 Y113.822 E.01967
G1 X111.509 Y113.243 E.01805
G1 X111.794 Y112.706 E.01812
G1 X112.147 Y112.263 E.01686
G1 X112.571 Y111.888 E.01687
G1 X113.054 Y111.593 E.01685
G1 X113.576 Y111.387 E.01672
G1 X114.478 Y111.252 E.02715
G1 X132.221 Y111.252 E.52851
G1 X131.837 Y110.483 E.02561
G1 X131.681 Y109.994 E.01529
G1 X131.658 Y109.748 E.00734
G1 X110.578 Y109.748 E.62787
G3 X109.748 Y110.555 I-3.186 J-2.447 E.0346
G1 X109.748 Y132.221 E.64533
G1 X110.517 Y131.836 E.0256
G1 X111.006 Y131.68 E.0153
G1 X111.192 Y131.663 E.00556
M204 S10000
M73 P56 R5
G1 X110.875 Y131.327 F42000
G1 F7160.475
M204 S6000
G1 X110.875 Y114.478 E.50187
G1 X110.968 Y113.709 E.02306
G1 X111.15 Y113.131 E.01805
G1 X111.467 Y112.517 E.02058
G1 X111.858 Y112.02 E.01882
G1 X112.329 Y111.599 E.01882
G1 X112.865 Y111.266 E.01881
G1 X113.447 Y111.033 E.01868
G1 X114.3 Y110.887 E.02576
G1 X131.611 Y110.875 E.51564
G1 X131.389 Y110.384 E.01604
G1 X131.327 Y110.125 E.00792
G1 X110.747 Y110.125 E.613
G1 X110.308 Y110.59 E.01905
G1 X110.125 Y110.736 E.00697
G1 X110.125 Y131.611 E.62176
G1 X110.614 Y131.389 E.01599
G1 X110.816 Y131.341 E.00618
M204 S10000
G1 X110.5 Y131.032 F42000
; LINE_WIDTH: 0.41573
G1 F7242.303
M204 S6000
G1 X110.5 Y114.478 E.48751
G1 X110.518 Y114.011 E.01374
M204 S10000
G1 X109.087 Y134.26 F42000
; LINE_WIDTH: 0.60486
G1 F4804.783
M204 S6000
G1 X109.086 Y134.12 E.00622
; WIPE_START
G1 X109.087 Y134.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111119
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139528
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.792 Y135.407 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.148272
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00124
; LINE_WIDTH: 0.114041
G1 X109.979 Y135.174 E.00084
M204 S10000
G1 X110.778 Y135.674 F42000
; LINE_WIDTH: 0.122965
G1 F15000
M204 S6000
G1 X110.989 Y135.634 E.00136
M204 S10000
G1 X111.957 Y135.474 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516566
G1 F5700.458
M204 S6000
G1 X111.458 Y135.715 E.02075
G1 X111.471 Y135.934 E.00822
G1 X111.429 Y135.971 E.00208
G1 X111.529 Y136.116 E.00662
; LINE_WIDTH: 0.480685
G1 F6167.693
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.446355
G1 F6692.528
G1 X111.621 Y136.448 E.00549
; LINE_WIDTH: 0.399938
G1 F7562.654
G1 X111.667 Y136.614 E.00486
G1 X111.678 Y137.443 E.02339
G1 X111.642 Y137.804 E.01024
G1 X111.873 Y137.95 E.00771
G1 X112.012 Y137.811 E.00554
G1 X112.018 Y136.611 E.03386
; LINE_WIDTH: 0.412025
G1 F7314.992
G1 X112.001 Y136.417 E.00568
; LINE_WIDTH: 0.446355
G1 F6692.528
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480685
G1 F6167.693
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.507615
G1 F5810.263
G1 X111.958 Y135.534 E.01819
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.514 Y138.18 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.626255
G1 F4628.564
M204 S6000
G1 X110.066 Y140.476 E.12504
M204 S10000
G1 X109.861 Y140.885 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54682
G1 F5358.206
M204 S6000
G1 X109.731 Y140.803 E.00614
G1 X109.255 Y141.066 E.02163
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05953
; WIPE_START
G1 X109.058 Y142.217 E-.56833
G1 X109.058 Y141.713 E-.19167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.59 Y140.386 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109943
G1 F15000
M204 S6000
G3 X108.406 Y140.293 I1.533 J-3.255 E.00109
; WIPE_START
G1 X108.59 Y140.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.406 Y147.413 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.134393
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00066
; LINE_WIDTH: 0.169042
G2 X108.559 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138385
G1 X112.594 Y147.549 E.03043
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.462 Y140.963 Z.8 F42000
G1 X133.459 Y108.65 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X134.479 Y108.65 E.03932
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5533.467
G1 X133.459 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/25
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z.8 I-.916 J-.802 P1  F42000
G1 X110.205 Y135.219 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.886 J-1.772 E.02196
G2 X111.264 Y135.328 I.006 J-.99 E.01354
G2 X111.946 Y134.973 I-1.585 J-3.875 E.02475
G2 X112.21 Y134.647 I-.601 J-.756 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.498 J68.751 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.597 E.0936
G2 X109.374 Y140.479 I.296 J-.647 E.02659
G1 X109.682 Y140.167 E.01409
G1 X111.21 Y137.721 E.09274
G2 X111.302 Y137.429 I-.462 J-.306 E.00999
G1 X111.302 Y136.796 E.02035
G2 X111.059 Y136.209 I-.854 J.01 E.02095
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.589 Y135.364 E-.161
G1 X110.856 Y135.414 E-.10319
G1 X111.004 Y135.406 E-.05661
G1 X111.264 Y135.328 E-.10318
G1 X111.946 Y134.973 E-.29206
G1 X112.031 Y134.895 E-.04395
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.996 Y133.964 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.488 J.196 E.01081
G1 X111.181 Y133.224 E.03158
G3 X111.36 Y133.176 I.207 J.412 E.00556
G3 X111.902 Y133.591 I.02 J.537 E.02205
G3 X111.91 Y134.262 I-3.608 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.97 E.01776
G3 X110.867 Y135.021 I-.233 J-.514 E.00725
G3 X110.319 Y134.835 I.671 J-2.875 E.01728
G3 X110.015 Y134.4 I.59 J-.736 E.016
G3 X109.977 Y134.021 I.469 J-.24 E.01162
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09426
G1 X110.232 Y133.699 E-.06573
G1 X111.181 Y133.224 E-.40287
G1 X111.36 Y133.176 E-.07045
G1 X111.54 Y133.193 E-.06867
G1 X111.676 Y133.261 E-.05802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.111 Y140.187 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X108.744 Y140.231 I-.215 J-.238 E.01176
G3 X108.466 Y139.965 I1.053 J-1.374 E.01149
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.916 Y135.137 I.199 J.204 E.00411
G3 X109.19 Y135.183 I.073 J.402 E.00844
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.392 E.01718
G3 X110.868 Y137.529 I-.258 J-.005 E.00431
G1 X109.372 Y139.922 E.08408
G1 X109.154 Y140.144 E.00928
; WIPE_START
M204 S6000
G1 X109.003 Y140.254 E-.07079
G1 X108.935 Y140.269 E-.02648
G1 X108.853 Y140.269 E-.03105
G1 X108.744 Y140.231 E-.04406
G1 X108.466 Y139.965 E-.14625
G1 X108.41 Y139.88 E-.03855
G1 X108.39 Y139.781 E-.03851
G1 X108.39 Y138.822 E-.3643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.271 Y132.954 Z1 F42000
G1 X132.79 Y109.486 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.518 E.00104
G2 X132.866 Y109.978 I.9 J.084 E.01519
G1 X133.356 Y110.959 E.03524
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.99 J-2.323 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.701 I1.603 J1.511 E.01704
G2 X134.847 Y112.398 I.691 J.294 E.02338
G1 X114.487 Y112.398 E.65472
G2 X112.398 Y114.487 I.032 J2.121 E.10508
G1 X112.398 Y133.246 E.60322
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.653 Y134.552 I.444 J.805 E.04454
G2 X109.879 Y134.97 I2.332 J-.994 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.514 J1.605 E.01714
G2 X108.602 Y134.848 I-.294 J.691 E.02338
G1 X108.602 Y109.916 E.80172
G2 X109.975 Y108.602 I-1.39 J-2.826 E.06208
G1 X133.246 Y108.602 E.74833
G1 X133.291 Y108.79 E.00622
G2 X132.819 Y109.354 I.397 J.812 E.02435
G1 X132.803 Y109.427 E.0024
M204 S10000
G1 X133.178 Y109.554 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01608
G1 X134.971 Y109.897 E.01777
G3 X135.021 Y110.133 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-2.873 J-.67 E.01729
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.176 Y109.614 I.463 J-.218 E.00634
; WIPE_START
M204 S6000
G1 X133.228 Y109.373 E-.09363
G1 X133.341 Y109.223 E-.07145
G1 X133.416 Y109.166 E-.03585
G1 X133.501 Y109.124 E-.03576
G1 X133.676 Y109.09 E-.06776
G1 X134.262 Y109.09 E-.22288
G1 X134.437 Y109.124 E-.06759
G1 X134.521 Y109.165 E-.03569
G1 X134.596 Y109.222 E-.03585
G1 X134.704 Y109.363 E-.06747
G1 X134.735 Y109.424 E-.02608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.42 J.528 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.217 Y111.924 E.0122
G3 X140.217 Y112.276 I-.271 J.176 E.01108
G1 X139.964 Y112.533 E.01076
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.721 Y112.61 E.12089
G3 X135.56 Y112.554 I.012 J-.293 E.00515
G1 X135.205 Y112.203 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07311
G1 X136.243 Y110.46 E-.65241
G1 X136.307 Y110.396 E-.03448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.772 J-.28 E.0235
G1 X140.175 Y111.325 E.01674
G1 X137.72 Y109.79 E.09311
G2 X137.428 Y109.698 I-.306 J.463 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02094
G1 X135.949 Y110.2 E.01176
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.759 J-.879 E.0218
G2 X135.329 Y109.736 I-.99 J-.006 E.01353
G2 X134.974 Y109.054 I-3.854 J1.575 E.02476
G2 X134.648 Y108.791 I-.755 J.6 E.01359
G1 X134.692 Y108.602 E.00623
G1 X137.464 Y108.602 E.08913
G1 X137.517 Y108.67 E.00277
G1 X137.918 Y109.072 E.01828
G2 X142.965 Y112.189 I67.658 J-103.92 E.19077
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.275 Y112.443 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.297 J-.153 E.00376
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99174
G2 X112.79 Y114.495 I.02 J1.726 E.07954
G1 X112.79 Y138.226 E.70686
G2 X112.619 Y138.305 I.046 J.325 E.00569
G1 X112.273 Y138.65 E.01456
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.028 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.681 Y147.297 I.306 J-.007 E.01386
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y109.653 E1.13598
G2 X109.734 Y108.21 I-.965 J-2.546 E.06417
G1 X137.729 Y108.21 E.83389
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00617
G1 X138.165 Y108.764 E.01494
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.024 Y112.621 E.07491
M73 P57 R5
G2 X147.243 Y112.493 I-.046 J-.331 E.00776
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.06955
G1 X147.31 Y110.506 E-.69045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131753
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.555 J-.962 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02756
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.916 Y111.458 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.431513
G1 F6948.142
M204 S6000
G1 X140.747 Y111.325 E.0066
; LINE_WIDTH: 0.395401
G1 F7659.99
G1 X140.578 Y111.192 E.00599
; LINE_WIDTH: 0.338619
G1 F9130.928
G2 X139.999 Y110.806 I-3.959 J5.3 E.01626
G1 X138.128 Y109.626 E.05167
; LINE_WIDTH: 0.330777
G1 F9379.66
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300113
G1 F10497.982
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168831
G1 F15000
M204 S6000
G1 X138.617 Y109.758 E.0097
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521716
G1 F5639.151
M204 S6000
G1 X135.906 Y109.521 E.00726
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508425
G1 F5800.152
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477315
G1 F6215.541
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443153
G1 F6746.079
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390019
G1 F7778.771
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.138 E.00523
G1 X137.427 Y109.112 E.0014
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405938
G1 F7437.659
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.443153
G1 F6746.079
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.475698
G1 F6238.771
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511746
G1 F5759.07
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.01829
M204 S10000
G1 X135.634 Y110.011 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124522
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00095
G1 X135.628 Y110.248 E.00064
M204 S10000
G1 X135.153 Y111.003 F42000
; LINE_WIDTH: 0.115931
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.15395
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.387 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.111269
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.139986
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.06 Y111.914 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60481
G1 F4805.211
M204 S6000
G1 X134.199 Y111.913 E.00613
M204 S10000
G1 X113.597 Y110.553 F42000
; LINE_WIDTH: 0.49789
G1 F5934.457
M204 S6000
G1 X113.922 Y110.53 E.01173
; LINE_WIDTH: 0.45311
G1 F6582.316
G1 X114.248 Y110.508 E.01058
; LINE_WIDTH: 0.415267
G1 F7251.301
G1 X130.973 Y110.5 E.49191
M204 S10000
G1 X110.932 Y111.881 F42000
; LINE_WIDTH: 0.52484
G1 F5602.599
M204 S6000
G1 X111.345 Y111.386 E.02456
G1 X111.88 Y110.932 E.0267
G1 X111.109 Y110.932 E.02937
G1 X110.932 Y111.111 E.00959
G1 X110.932 Y111.821 E.02702
M204 S10000
G1 X110.519 Y113.971 F42000
; LINE_WIDTH: 0.425218
G1 F7062.552
M204 S6000
G1 X110.788 Y113.025 E.02971
G1 X111.141 Y112.328 E.02357
G1 X111.569 Y111.778 E.02106
G1 X112.086 Y111.31 E.02106
G1 X112.676 Y110.94 E.02104
G1 X113.314 Y110.669 E.02093
; LINE_WIDTH: 0.461518
G1 F6450.11
G1 X113.455 Y110.611 E.00505
; LINE_WIDTH: 0.500693
G1 F5898.126
G1 X113.597 Y110.553 E.00552
; LINE_WIDTH: 0.503565
G1 F5861.347
G1 X113.361 Y110.536 E.0086
; LINE_WIDTH: 0.470135
G1 F6320.003
G1 X113.125 Y110.519 E.00798
; LINE_WIDTH: 0.421756
G1 F7127.098
G1 X112.889 Y110.502 E.00707
G1 X110.916 Y110.502 E.05905
G1 X110.542 Y110.886 E.01602
G1 X110.502 Y110.969 E.00277
G2 X110.516 Y113.911 I69.12 J1.143 E.08805
M204 S10000
G1 X110.5 Y131.032 F42000
; LINE_WIDTH: 0.415676
G1 F7243.349
M204 S6000
G1 X110.5 Y114.478 E.48744
G1 X110.517 Y114.031 E.01317
M204 S10000
G1 X110.875 Y131.327 F42000
; LINE_WIDTH: 0.41999
G1 F7160.478
M204 S6000
G1 X110.875 Y114.478 E.50186
G1 X110.965 Y113.731 E.02241
G1 X111.148 Y113.136 E.01855
G1 X111.467 Y112.517 E.02074
G1 X111.858 Y112.02 E.01881
G1 X112.329 Y111.599 E.01882
G1 X112.865 Y111.266 E.0188
G1 X113.447 Y111.033 E.01868
G1 X114.3 Y110.887 E.02577
G1 X131.611 Y110.875 E.51564
G1 X131.389 Y110.384 E.01604
G1 X131.327 Y110.125 E.00791
G1 X110.747 Y110.125 E.613
G1 X110.307 Y110.591 E.01909
G1 X110.125 Y110.736 E.00693
G1 X110.125 Y131.611 E.62176
G1 X110.623 Y131.386 E.01625
G1 X110.816 Y131.341 E.00593
M204 S10000
G1 X111.252 Y131.656 F42000
G1 F7160.478
M204 S6000
G1 X111.252 Y114.478 E.51167
G1 X111.325 Y113.842 E.01906
G1 X111.508 Y113.247 E.01855
G1 X111.794 Y112.705 E.01823
G1 X112.147 Y112.263 E.01686
G1 X112.571 Y111.888 E.01686
G1 X113.054 Y111.593 E.01685
G1 X113.576 Y111.387 E.01672
G1 X114.478 Y111.252 E.02716
G1 X132.221 Y111.252 E.52851
G1 X131.837 Y110.483 E.02561
G1 X131.681 Y109.994 E.01529
G1 X131.658 Y109.748 E.00734
G1 X110.578 Y109.748 E.62787
G3 X109.748 Y110.555 I-3.185 J-2.445 E.0346
G1 X109.748 Y132.221 E.64533
G1 X110.517 Y131.836 E.02561
G1 X111.018 Y131.677 E.01565
G1 X111.192 Y131.662 E.00521
M204 S10000
G1 X111.629 Y132.034 F42000
; LINE_WIDTH: 0.41999
G1 F7160.475
M204 S6000
G1 X111.629 Y114.478 E.52292
G1 X111.685 Y113.953 E.01572
G1 X111.869 Y113.358 E.01855
G1 X112.12 Y112.894 E.01573
G3 X113.242 Y111.919 I2.616 J1.878 E.04466
M73 P58 R5
G1 X113.801 Y111.716 E.01771
G3 X114.478 Y111.629 I.976 J4.895 E.02034
G1 X132.903 Y111.629 E.5488
G1 X132.672 Y111.311 E.01169
G1 X132.174 Y110.314 E.0332
G1 X132.056 Y109.958 E.01116
G1 X132.034 Y109.371 E.0175
G1 X110.394 Y109.371 E.64458
G1 X109.905 Y109.937 E.02228
G1 X109.491 Y110.278 E.01597
G1 X109.371 Y110.355 E.00425
G1 X109.371 Y132.902 E.67157
G1 X109.689 Y132.672 E.01169
G1 X110.686 Y132.174 E.03319
G1 X111.051 Y132.053 E.01147
G1 X111.569 Y132.036 E.01542
M204 S10000
G1 X112.006 Y132.54 F42000
; LINE_WIDTH: 0.41999
G1 F7160.477
M204 S6000
G1 X112.006 Y114.478 E.53801
G1 X112.045 Y114.064 E.01237
G1 X112.229 Y113.469 E.01855
G3 X113.873 Y112.086 I2.328 J1.099 E.06601
G3 X114.478 Y112.006 I.896 J4.415 E.01818
G1 X133.545 Y112.006 E.56792
; LINE_WIDTH: 0.442982
G1 F6748.967
G1 X133.673 Y111.983 E.00414
; LINE_WIDTH: 0.488964
G1 F6053.218
G1 X133.802 Y111.96 E.00462
; LINE_WIDTH: 0.534947
G1 F5487.512
G1 X133.931 Y111.937 E.00509
; LINE_WIDTH: 0.580929
G1 F5018.506
G1 X134.06 Y111.914 E.00557
G1 X133.953 Y111.864 E.00504
; LINE_WIDTH: 0.534947
G1 F5487.512
G1 X133.845 Y111.815 E.00461
; LINE_WIDTH: 0.488964
G1 F6053.218
G1 X133.737 Y111.766 E.00418
; LINE_WIDTH: 0.420044
G1 F7159.453
G1 X133.629 Y111.716 E.00353
G1 X133.247 Y111.458 E.01373
G1 X133.01 Y111.142 E.01178
G1 X132.511 Y110.145 E.0332
G1 X132.432 Y109.923 E.00704
G1 X132.4 Y109.447 E.0142
G1 X132.541 Y108.994 E.01414
G1 X110.188 Y108.994 E.66588
G1 X110.043 Y109.216 E.0079
G1 X109.621 Y109.689 E.01889
G3 X108.994 Y110.14 I-1.896 J-1.972 E.02307
G1 X108.994 Y133.559 E.69766
; LINE_WIDTH: 0.442949
G1 F6749.515
G1 X109.017 Y133.685 E.00403
; LINE_WIDTH: 0.488867
G1 F6054.541
G1 X109.04 Y133.81 E.00449
; LINE_WIDTH: 0.534784
G1 F5489.325
G1 X109.063 Y133.936 E.00496
; LINE_WIDTH: 0.580702
G1 F5020.629
G1 X109.086 Y134.061 E.00542
G1 X109.134 Y133.956 E.00491
; LINE_WIDTH: 0.534784
G1 F5489.325
G1 X109.183 Y133.851 E.00449
; LINE_WIDTH: 0.488867
G1 F6054.541
G1 X109.231 Y133.746 E.00407
; LINE_WIDTH: 0.420812
G1 F7144.902
G1 X109.279 Y133.641 E.00345
G1 X109.542 Y133.246 E.01416
G1 X109.858 Y133.009 E.01179
G1 X110.854 Y132.511 E.03327
G1 X111.085 Y132.428 E.0073
G1 X111.552 Y132.399 E.01399
G1 X111.949 Y132.522 E.01239
; WIPE_START
G1 X111.552 Y132.399 E-.1577
G1 X111.085 Y132.428 E-.17803
G1 X110.854 Y132.511 E-.09297
G1 X110.075 Y132.901 E-.33129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.087 Y134.26 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.60475
G1 F4805.724
M204 S6000
G1 X109.086 Y134.121 E.00616
; WIPE_START
G1 X109.087 Y134.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11111
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.1395
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.792 Y135.407 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.148251
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00124
; LINE_WIDTH: 0.114028
G1 X109.979 Y135.174 E.00084
M204 S10000
G1 X110.778 Y135.674 F42000
; LINE_WIDTH: 0.122999
G1 F15000
M204 S6000
G1 X110.989 Y135.634 E.00136
M204 S10000
G1 X111.957 Y135.473 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516383
G1 F5702.664
M204 S6000
G1 X111.458 Y135.715 E.02074
G1 X111.471 Y135.935 E.00824
G1 X111.429 Y135.971 E.00208
G1 X111.529 Y136.116 E.0066
; LINE_WIDTH: 0.480679
G1 F6167.787
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.446355
G1 F6692.528
G1 X111.621 Y136.448 E.00548
; LINE_WIDTH: 0.399927
G1 F7562.875
G1 X111.667 Y136.614 E.00485
G1 X111.678 Y137.443 E.02339
G1 X111.642 Y137.805 E.01026
G1 X111.873 Y137.95 E.00769
G1 X112.012 Y137.811 E.00554
G1 X112.018 Y136.61 E.03387
; LINE_WIDTH: 0.412032
G1 F7314.86
G1 X112.001 Y136.417 E.00567
; LINE_WIDTH: 0.446355
G1 F6692.528
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480679
G1 F6167.787
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.5075
G1 F5811.701
G1 X111.958 Y135.533 E.01819
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.514 Y138.181 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.626253
G1 F4628.578
M204 S6000
G1 X110.066 Y140.475 E.12503
M204 S10000
G1 X109.861 Y140.885 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54681
G1 F5358.313
M204 S6000
G1 X109.731 Y140.803 E.00613
G1 X109.255 Y141.066 E.02164
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05954
; WIPE_START
G1 X109.058 Y142.217 E-.56842
G1 X109.058 Y141.713 E-.19158
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.406 Y147.413 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.134333
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00066
; LINE_WIDTH: 0.169009
G2 X108.56 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138384
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.462 Y140.963 Z1 F42000
G1 X133.459 Y108.65 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X134.479 Y108.65 E.03932
; WIPE_START
G1 X133.459 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.433 Y111.751 Z1 F42000
G1 X141.035 Y112.019 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39388
G1 F7693.184
M204 S6000
G1 X141.95 Y112.019 E.02538
G1 X141.277 Y111.613 E.0218
G1 X141.029 Y111.959 E.01181
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7693.184
G1 X141.277 Y111.613 E-.16185
G1 X141.95 Y112.019 E-.29886
G1 X141.163 Y112.019 E-.2993
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/25
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S94.35
; OBJECT_ID: 75
M204 S10000
G17
G3 Z1 I-.73 J-.974 P1  F42000
G1 X110.205 Y135.219 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.887 J-1.774 E.02196
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.574 J-3.853 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01358
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.471 J68.734 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.09313
G1 X108.855 Y140.669 E.00833
G1 X109.137 Y140.637 E.00913
G1 X109.35 Y140.503 E.0081
G1 X109.681 Y140.167 E.01518
G1 X111.21 Y137.721 E.09277
G2 X111.302 Y137.429 I-.463 J-.306 E.00997
G1 X111.302 Y136.796 E.02035
G2 X111.059 Y136.209 I-.855 J.01 E.02095
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.16089
G1 X110.856 Y135.414 E-.10332
G1 X111.004 Y135.406 E-.05646
G1 X111.264 Y135.328 E-.10329
G1 X111.946 Y134.973 E-.29221
G1 X112.031 Y134.895 E-.04384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.998 Y133.958 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.362 Y133.176 I.205 J.407 E.00564
G3 X111.902 Y133.591 I.017 J.536 E.02197
G3 X111.91 Y134.262 I-3.604 J.378 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01608
G1 X111.103 Y134.971 E.01776
G3 X110.867 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.667 J-2.863 E.01729
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.239 E.01182
; WIPE_START
M204 S6000
G1 X110.093 Y133.805 E-.09076
G1 X110.232 Y133.699 E-.06667
G1 X111.181 Y133.224 E-.40291
G1 X111.362 Y133.176 E-.07142
G1 X111.539 Y133.193 E-.0676
G1 X111.682 Y133.264 E-.06064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.196 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X108.734 Y140.224 I-.203 J-.235 E.01179
G3 X108.466 Y139.965 I1.016 J-1.32 E.01113
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.199 J.204 E.00411
G3 X109.189 Y135.183 I.074 J.402 E.00844
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.519 J.416 E.01121
G1 X110.91 Y137.392 E.01718
G3 X110.868 Y137.529 I-.259 J-.005 E.0043
G1 X109.372 Y139.923 E.08409
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.004 Y140.258 E-.06677
G1 X108.877 Y140.272 E-.04862
G1 X108.734 Y140.224 E-.05722
G1 X108.466 Y139.965 E-.14167
G1 X108.41 Y139.88 E-.03858
G1 X108.39 Y139.781 E-.03852
G1 X108.39 Y138.811 E-.36863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.272 Y132.944 Z1.2 F42000
G1 X132.79 Y109.486 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.518 E.00104
G2 X132.866 Y109.978 I.9 J.084 E.01519
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.986 J-2.316 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.589 J1.5 E.01704
G2 X134.847 Y112.398 I.69 J.294 E.02338
G1 X114.487 Y112.398 E.65472
G2 X112.398 Y114.487 I.032 J2.121 E.10508
G1 X112.398 Y133.246 E.60322
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.653 Y134.552 I.444 J.805 E.04454
G2 X109.879 Y134.97 I2.348 J-1.002 E.0153
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.791 I-1.508 J1.597 E.01715
G2 X108.602 Y134.848 I-.293 J.692 E.02337
G1 X108.602 Y109.917 E.80172
G2 X109.975 Y108.602 I-1.391 J-2.827 E.06208
G1 X133.246 Y108.602 E.74833
G1 X133.291 Y108.79 E.00622
G2 X132.819 Y109.354 I.397 J.812 E.02436
G1 X132.803 Y109.427 E.00239
M204 S10000
G1 X133.178 Y109.554 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.133 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-2.862 J-.666 E.01729
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02421
G1 X133.225 Y109.819 E.03158
G3 X133.176 Y109.614 I.463 J-.218 E.00634
; WIPE_START
M204 S6000
G1 X133.228 Y109.373 E-.09361
G1 X133.277 Y109.292 E-.03588
G1 X133.414 Y109.167 E-.07053
G1 X133.501 Y109.124 E-.03671
G1 X133.676 Y109.09 E-.06777
G1 X134.262 Y109.09 E-.22286
G1 X134.437 Y109.123 E-.06752
G1 X134.521 Y109.165 E-.03578
G1 X134.596 Y109.222 E-.0358
G1 X134.704 Y109.363 E-.06757
G1 X134.735 Y109.424 E-.02597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.811 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05115
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.416 J.519 E.0112
G1 X137.392 Y110.09 E.01721
G3 X137.528 Y110.132 I-.006 J.259 E.0043
G1 X139.929 Y111.633 E.08434
G1 X140.217 Y111.924 E.0122
G3 X140.217 Y112.276 I-.271 J.176 E.01108
G1 X139.964 Y112.533 E.01076
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.721 Y112.61 E.1209
G3 X135.56 Y112.554 I.012 J-.294 E.00515
G1 X135.206 Y112.203 E.01487
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.811 E-.07302
G1 X136.243 Y110.46 E-.65249
G1 X136.307 Y110.396 E-.03449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.772 J-.28 E.0235
M73 P59 R5
G1 X140.175 Y111.325 E.01675
G1 X137.72 Y109.79 E.09309
G2 X137.429 Y109.698 I-.307 J.464 E.00996
G1 X136.795 Y109.698 E.02039
G2 X136.207 Y109.941 I.01 J.855 E.02094
G1 X135.949 Y110.2 E.01176
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.761 J-.879 E.0218
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.876 J1.585 E.02476
G2 X134.648 Y108.791 I-.755 J.601 E.01359
G1 X134.692 Y108.602 E.00623
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.918 Y109.072 E.01829
G2 X142.966 Y112.189 I67.65 J-103.907 E.19077
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.275 Y112.443 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.297 J-.153 E.00375
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.495 I.02 J1.726 E.07954
G1 X112.79 Y138.226 E.70686
G2 X112.62 Y138.304 I.046 J.325 E.00567
G1 X112.273 Y138.65 E.01457
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14146
G1 X108.389 Y145.028 E.00277
G1 X108.383 Y146.998 E.05868
G2 X108.668 Y147.297 I.333 J-.032 E.01326
G1 X112.79 Y147.309 E.12277
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y109.653 E1.13598
G2 X109.734 Y108.21 I-.965 J-2.546 E.06417
G1 X137.729 Y108.21 E.83389
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.764 E.01494
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.024 Y112.621 E.07492
G2 X147.243 Y112.493 I-.047 J-.331 E.00774
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.06952
G1 X147.31 Y110.506 E-.69048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131756
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.555 J-.96 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02757
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.916 Y111.458 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.431463
G1 F6949.043
M204 S6000
G1 X140.747 Y111.325 E.0066
; LINE_WIDTH: 0.39536
G1 F7660.894
G1 X140.578 Y111.192 E.00599
; LINE_WIDTH: 0.338596
G1 F9131.625
G2 X139.999 Y110.806 I-3.957 J5.298 E.01626
G1 X138.128 Y109.626 E.05167
; LINE_WIDTH: 0.330776
G1 F9379.712
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300059
G1 F10500.181
G1 X137.736 Y109.57 E.00402
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.169338
G1 F15000
M204 S6000
G1 X138.62 Y109.76 E.00977
M204 S10000
G1 X135.716 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516703
G1 F5698.817
M204 S6000
G1 X135.924 Y109.528 E.00784
G1 X135.967 Y109.574 E.00236
G1 X136.106 Y109.47 E.00652
; LINE_WIDTH: 0.483723
G1 F6125.192
G1 X136.242 Y109.425 E.00499
; LINE_WIDTH: 0.447208
G1 F6678.416
G1 X136.378 Y109.381 E.00457
; LINE_WIDTH: 0.391824
G1 F7738.535
G3 X137.335 Y109.322 I.682 J3.298 E.02652
G1 X137.384 Y109.137 E.00528
G1 X137.427 Y109.112 E.00137
G1 X137.293 Y108.978 E.00522
G1 X136.785 Y108.978 E.01401
; LINE_WIDTH: 0.402158
G1 F7515.919
G1 X136.51 Y108.993 E.00781
; LINE_WIDTH: 0.431813
G1 F6942.792
G1 X136.235 Y109.007 E.00846
; LINE_WIDTH: 0.46442
G1 F6405.694
G1 X135.855 Y109.025 E.01267
; LINE_WIDTH: 0.510023
G1 F5780.309
G1 X135.474 Y109.043 E.01405
G1 X135.689 Y109.488 E.01823
M204 S10000
G1 X135.634 Y110.011 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124493
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00095
G1 X135.628 Y110.247 E.00064
M204 S10000
G1 X135.153 Y111.003 F42000
; LINE_WIDTH: 0.115937
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.153963
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.111284
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140011
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.035 Y112.019 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39391
G1 F7692.527
M204 S6000
G1 X141.95 Y112.019 E.02538
G1 X141.277 Y111.613 E.02181
G1 X141.029 Y111.959 E.01181
; WIPE_START
G1 X141.277 Y111.613 E-.16185
G1 X141.95 Y112.019 E-.29889
G1 X141.163 Y112.019 E-.29926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.533 Y112.22 Z1.2 F42000
G1 X112.766 Y112.766 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.623 Y109.623 E.14294
G3 X108.95 Y110.115 I-2.56 J-2.792 E.02686
G1 X108.95 Y113.854 E.12022
G1 X111.442 Y113.854 E.08013
G1 X116.346 Y108.95 E.22299
G1 X116.626 Y108.95 E.00902
G1 X119.726 Y112.05 E.14095
G1 X120.922 Y112.05 E.03849
G1 X124.022 Y108.95 E.14095
G1 X124.302 Y108.95 E.00902
G1 X127.402 Y112.05 E.14095
G1 X128.598 Y112.05 E.03849
G1 X131.698 Y108.95 E.14095
G1 X131.978 Y108.95 E.00902
G1 X132.448 Y109.42 E.02138
G2 X132.547 Y110.12 I1.909 J.086 E.02284
G1 X132.955 Y110.935 E.0293
; WIPE_START
G1 X132.547 Y110.12 E-.34627
G1 X132.437 Y109.717 E-.15856
G1 X132.448 Y109.42 E-.11293
G1 X132.184 Y109.156 E-.14225
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.929 Y111.529 Z1.2 F42000
G1 X110.5 Y116.248 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F7252.995
M204 S6000
G1 X110.5 Y115.812 E.01284
M204 S10000
G1 X110.875 Y116.623 F42000
; LINE_WIDTH: 0.41999
G1 F7160.474
M204 S6000
G1 X110.875 Y115.377 E.03711
G1 X110.125 Y115.377 E.02232
G1 X110.125 Y116.623 E.03711
G1 X110.815 Y116.623 E.02053
M204 S10000
G1 X111.252 Y117 F42000
G1 F7160.474
M204 S6000
G1 X111.252 Y115 E.05958
G1 X109.748 Y115 E.04478
G1 X109.748 Y117 E.05958
G1 X111.192 Y117 E.04299
M204 S10000
G1 X111.629 Y117.377 F42000
G1 F7160.474
M204 S6000
G1 X111.629 Y114.623 E.08204
G1 X109.371 Y114.623 E.06724
G1 X109.371 Y117.377 E.08204
G1 X111.569 Y117.377 E.06546
M204 S10000
G1 X112.006 Y117.754 F42000
G1 F7160.474
M204 S6000
G1 X112.006 Y114.478 E.09759
G3 X112.029 Y114.246 I2.233 J.105 E.00694
G1 X108.994 Y114.246 E.09039
G1 X108.994 Y117.754 E.1045
G1 X111.946 Y117.754 E.08792
M204 S10000
G1 X108.95 Y122.393 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y122.854 E.0148
G1 X110.118 Y122.854 E.03756
G1 X112.05 Y120.922 E.08783
G1 X112.05 Y119.726 E.03849
G1 X110.47 Y118.146 E.07183
G1 X108.95 Y118.146 E.04887
G1 X108.95 Y118.255 E.00349
M204 S10000
G1 X110.5 Y125.248 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F7252.995
M204 S6000
G1 X110.5 Y124.812 E.01284
M204 S10000
G1 X110.875 Y125.623 F42000
; LINE_WIDTH: 0.41999
G1 F7160.474
M204 S6000
G1 X110.875 Y124.377 E.03711
G1 X110.125 Y124.377 E.02232
G1 X110.125 Y125.623 E.03711
G1 X110.815 Y125.623 E.02053
M204 S10000
G1 X111.252 Y126 F42000
G1 F7160.474
M204 S6000
G1 X111.252 Y124 E.05958
G1 X109.748 Y124 E.04478
G1 X109.748 Y126 E.05958
G1 X111.192 Y126 E.04299
M204 S10000
G1 X111.629 Y126.377 F42000
G1 F7160.474
M204 S6000
G1 X111.629 Y123.623 E.08204
G1 X109.371 Y123.623 E.06724
G1 X109.371 Y126.377 E.08204
G1 X111.569 Y126.377 E.06546
M204 S10000
G1 X112.006 Y126.754 F42000
G1 F7160.474
M204 S6000
G1 X112.006 Y123.246 E.1045
G1 X108.994 Y123.246 E.08971
G1 X108.994 Y126.754 E.1045
G1 X111.946 Y126.754 E.08792
M204 S10000
G1 X111.477 Y132.436 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
M73 P60 R5
G2 X110.88 Y132.547 I-.057 J1.352 E.0197
G1 X109.973 Y133.001 E.03262
G1 X108.95 Y131.978 E.0465
G1 X108.95 Y131.698 E.00902
G1 X112.05 Y128.598 E.14095
G1 X112.05 Y127.402 E.03849
G1 X111.794 Y127.146 E.01162
G1 X110.166 Y127.146 E.05236
; WIPE_START
G1 X111.794 Y127.146 E-.61876
G1 X112.05 Y127.402 E-.13726
G1 X112.05 Y127.412 E-.00399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y133.458 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y134.479 E.03932
; WIPE_START
G1 X112.35 Y133.458 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517367
G1 F5690.836
M204 S6000
G1 X111.458 Y135.715 E.02078
G1 X111.471 Y135.934 E.00825
G1 X111.429 Y135.971 E.00209
G1 X111.524 Y136.093 E.00583
; LINE_WIDTH: 0.490098
G1 F6037.871
M73 P60 R4
G1 X111.567 Y136.218 E.00465
; LINE_WIDTH: 0.454353
G1 F6562.437
G1 X111.609 Y136.343 E.00428
; LINE_WIDTH: 0.399321
G1 F7575.742
G1 X111.678 Y136.786 E.01263
G3 X111.642 Y137.805 I-5.133 J.331 E.02874
G1 X111.873 Y137.95 E.00767
G1 X112.012 Y137.811 E.00553
G1 X112.022 Y136.786 E.02887
; LINE_WIDTH: 0.404543
G1 F7466.35
G1 X112.005 Y136.488 E.00852
; LINE_WIDTH: 0.438968
G1 F6817.364
G1 X111.988 Y136.191 E.00933
; LINE_WIDTH: 0.471433
G1 F6300.866
G1 X111.974 Y135.862 E.01113
; LINE_WIDTH: 0.501938
G1 F5882.129
G1 X111.96 Y135.533 E.01193
M204 S10000
G1 X110.989 Y135.634 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.122999
G1 F15000
M204 S6000
G1 X110.779 Y135.674 E.00136
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114046
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148289
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.111117
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139516
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.514 Y138.18 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.626251
G1 F4628.595
M204 S6000
G1 X110.066 Y140.476 E.12504
M204 S10000
G1 X109.864 Y140.884 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54319
G1 F5397.085
M204 S6000
G1 X109.708 Y140.786 E.00726
G1 X109.338 Y141.046 E.01786
G1 X109.056 Y141.103 E.0114
G1 X109.056 Y142.223 E.04428
G1 X109.833 Y140.936 E.05943
; WIPE_START
G1 X109.056 Y142.223 E-.57148
G1 X109.056 Y141.727 E-.18852
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.59 Y140.386 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109805
G1 F15000
M204 S6000
G3 X108.406 Y140.293 I1.526 J-3.24 E.00109
; WIPE_START
G1 X108.59 Y140.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.406 Y147.421 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.139909
G1 F15000
M204 S6000
G1 X108.475 Y147.524 E.00095
G2 X108.645 Y147.543 I.734 J-5.621 E.00131
G1 X112.594 Y147.549 E.03025
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X110.594 Y147.546 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/25
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z1.2 I1.215 J.073 P1  F42000
G1 X112.398 Y117.615 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X112.398 Y123.388 E.18564
G1 X108.602 Y123.388 E.12206
G1 X108.602 Y117.615 E.18564
G1 X112.338 Y117.615 E.12013
; WIPE_START
G1 X112.359 Y119.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.315 Y127.175 Z1.4 F42000
G1 X110.205 Y135.219 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.886 J-1.772 E.02196
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.579 J-3.864 E.02476
G2 X112.21 Y134.647 I-.601 J-.755 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.522 J68.765 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.611 E.09313
G2 X109.374 Y140.479 I.278 J-.697 E.02651
G1 X109.681 Y140.167 E.01406
G1 X111.21 Y137.721 E.09277
G2 X111.302 Y137.429 I-.464 J-.306 E.00997
G1 X111.302 Y136.796 E.02034
G2 X111.059 Y136.209 I-.855 J.01 E.02095
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.16086
G1 X110.856 Y135.414 E-.10337
G1 X111.004 Y135.406 E-.05643
G1 X111.264 Y135.328 E-.10329
G1 X111.946 Y134.973 E-.29214
G1 X112.031 Y134.895 E-.04391
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.636 Y133.806 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F6632.609
M204 S6000
G1 X109.629 Y133.826 E.00069
G2 X109.653 Y134.552 I.856 J.335 E.02402
G2 X109.879 Y134.97 I2.334 J-.995 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.791 I-1.508 J1.597 E.01715
G2 X108.602 Y134.848 I-.293 J.691 E.02337
G1 X108.602 Y126.615 E.26477
G1 X112.398 Y126.615 E.12206
G1 X112.398 Y133.246 E.21323
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.706 Y133.673 I.444 J.805 E.01501
G1 X109.664 Y133.752 E.00289
M204 S10000
G1 X109.994 Y133.97 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.49 J.191 E.01098
G1 X111.181 Y133.224 E.03158
G3 X111.365 Y133.176 I.204 J.403 E.00573
G3 X111.902 Y133.591 I.014 J.536 E.02188
G3 X111.91 Y134.262 I-3.611 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.97 E.01776
G3 X110.868 Y135.021 I-.233 J-.513 E.00724
G3 X110.319 Y134.834 I.665 J-2.859 E.01729
G3 X110.015 Y134.4 I.59 J-.736 E.01599
G3 X109.975 Y134.027 I.469 J-.239 E.01145
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09628
G1 X110.232 Y133.699 E-.06576
G1 X111.181 Y133.224 E-.40286
G1 X111.365 Y133.176 E-.07251
G1 X111.539 Y133.193 E-.06649
G1 X111.671 Y133.259 E-.05609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.11 Y140.188 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F7160.291
M204 S5000
G1 X109.001 Y140.247 E.00371
G3 X108.734 Y140.224 I-.105 J-.326 E.00818
G3 X108.466 Y139.965 I1.014 J-1.319 E.01113
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.199 J.204 E.00411
G3 X109.189 Y135.183 I.074 J.402 E.00845
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.392 E.01719
G3 X110.868 Y137.529 I-.259 J-.005 E.00431
G1 X109.372 Y139.923 E.0841
G1 X109.153 Y140.145 E.0093
; WIPE_START
M204 S6000
G1 X109.001 Y140.247 E-.06952
G1 X108.935 Y140.269 E-.02636
G1 X108.865 Y140.269 E-.02655
G1 X108.734 Y140.224 E-.05263
G1 X108.466 Y139.965 E-.1417
G1 X108.41 Y139.88 E-.0386
G1 X108.39 Y139.781 E-.03853
G1 X108.39 Y138.817 E-.36612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.271 Y132.95 Z1.4 F42000
G1 X132.79 Y109.487 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.518 E.00099
G2 X132.866 Y109.978 I.9 J.084 E.01519
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.986 J-2.316 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.585 J1.498 E.01705
G2 X134.847 Y112.398 I.693 J.294 E.02337
G1 X114.487 Y112.398 E.65471
G2 X112.396 Y114.388 I.02 J2.115 E.10214
G1 X108.602 Y114.388 E.122
G1 X108.602 Y109.917 E.14377
G2 X109.975 Y108.602 I-1.391 J-2.827 E.06208
G1 X133.246 Y108.602 E.74833
G1 X133.291 Y108.79 E.00622
G2 X132.819 Y109.354 I.397 J.812 E.02436
G1 X132.803 Y109.428 E.00244
M204 S10000
G1 X133.179 Y109.554 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.51 J.049 E.02212
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.513 J.233 E.00724
G3 X134.835 Y110.681 I-2.859 J-.665 E.01729
G3 X134.401 Y110.985 I-.736 J-.59 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.177 Y109.614 I.465 J-.217 E.00633
; WIPE_START
M204 S6000
G1 X133.194 Y109.461 E-.05851
G1 X133.275 Y109.295 E-.07031
G1 X133.416 Y109.166 E-.07259
G1 X133.501 Y109.124 E-.03581
G1 X133.676 Y109.09 E-.0677
G1 X134.262 Y109.09 E-.22289
G1 X134.437 Y109.124 E-.06755
G1 X134.521 Y109.165 E-.03578
G1 X134.596 Y109.222 E-.03575
G1 X134.704 Y109.363 E-.06757
G1 X134.734 Y109.423 E-.02555
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.811 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.415 J.517 E.01121
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.0043
G1 X139.929 Y111.633 E.08435
G1 X140.217 Y111.924 E.0122
G3 X140.217 Y112.276 I-.28 J.176 E.01105
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.721 Y112.61 E.12089
G3 X135.56 Y112.554 I.012 J-.293 E.00515
G1 X135.206 Y112.203 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00667
; WIPE_START
M204 S6000
G1 X135.182 Y111.811 E-.07301
G1 X136.243 Y110.46 E-.65248
G1 X136.307 Y110.396 E-.03451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.738 J-.283 E.02356
G1 X140.175 Y111.325 E.01675
G1 X137.72 Y109.79 E.09312
G2 X137.428 Y109.698 I-.306 J.464 E.00997
G1 X136.795 Y109.698 E.02036
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.76 J-.879 E.0218
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.863 J1.579 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.669 E.00275
G1 X137.918 Y109.072 E.0183
G2 X142.966 Y112.189 I67.653 J-103.912 E.19077
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.275 Y112.443 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.297 J-.153 E.00376
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.495 I.02 J1.726 E.07954
G1 X112.79 Y138.226 E.70686
G2 X112.619 Y138.305 I.046 J.325 E.00569
G1 X112.273 Y138.65 E.01456
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.028 E.00277
G1 X108.383 Y147.01 E.05902
G2 X108.681 Y147.297 I.318 J-.032 E.01339
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y109.653 E1.13598
G2 X109.734 Y108.21 I-.965 J-2.546 E.06417
G1 X137.729 Y108.21 E.83389
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.764 E.01494
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.024 Y112.621 E.07491
G2 X147.243 Y112.493 I-.046 J-.331 E.00775
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.06955
G1 X147.31 Y110.506 E-.69045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131753
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.558 J-.966 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02756
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.014 Y112.026 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38035
M73 P61 R4
G1 F8001.66
M204 S6000
G1 X141.975 Y112.026 E.02562
G1 X141.189 Y111.552 E.02446
G1 X141.218 Y111.779 E.00609
G1 X140.999 Y111.903 E.00672
G1 X141.007 Y111.966 E.00169
M204 S10000
G1 X140.44 Y110.904 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100607
G1 F15000
M204 S6000
G1 X140.747 Y111.597 E.00345
M204 S10000
G1 X140.702 Y111.29 F42000
; LINE_WIDTH: 0.339179
G1 F9113.67
M204 S6000
G2 X139.999 Y110.806 I-3.919 J4.94 E.01998
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330798
G1 F9378.986
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.30012
G1 F10497.699
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168655
G1 F15000
M204 S6000
G1 X138.619 Y109.759 E.0097
; WIPE_START
G1 X137.674 Y109.511 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.225 Y112.594 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.140319
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00097
; LINE_WIDTH: 0.111388
G1 X135.081 Y112.386 E.00068
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.407 Y111.207 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.153982
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115944
G1 X135.153 Y111.003 E.00094
M204 S10000
G1 X135.628 Y110.247 F42000
; LINE_WIDTH: 0.124554
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00064
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516232
G1 F5704.482
M204 S6000
G1 X135.923 Y109.527 E.0078
G1 X135.967 Y109.575 E.0024
G1 X136.109 Y109.468 E.00665
; LINE_WIDTH: 0.482438
G1 F6143.1
G1 X136.246 Y109.424 E.005
; LINE_WIDTH: 0.446273
G1 F6693.897
G1 X136.383 Y109.38 E.00458
; LINE_WIDTH: 0.3917
G1 F7741.279
G3 X137.335 Y109.322 I.677 J3.302 E.02636
G1 X137.383 Y109.137 E.00526
G1 X137.427 Y109.112 E.0014
G1 X137.293 Y108.978 E.00522
G1 X136.785 Y108.978 E.01401
; LINE_WIDTH: 0.401835
G1 F7522.672
G1 X136.513 Y108.992 E.0077
; LINE_WIDTH: 0.430845
G1 F6960.108
G1 X136.242 Y109.007 E.00832
; LINE_WIDTH: 0.463403
G1 F6421.195
G1 X135.858 Y109.025 E.01277
; LINE_WIDTH: 0.50966
G1 F5784.806
G1 X135.474 Y109.043 E.01417
G1 X135.689 Y109.488 E.01821
; WIPE_START
G1 X135.474 Y109.043 E-.42741
G1 X135.858 Y109.025 E-.33259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.955 Y110.935 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G3 X132.436 Y109.486 I2.168 J-1.593 E.05019
G1 X132.448 Y109.42 E.00214
G1 X131.978 Y108.95 E.02138
G1 X131.698 Y108.95 E.00902
G1 X128.596 Y112.052 E.14105
G1 X127.404 Y112.052 E.03833
G1 X124.302 Y108.95 E.14107
G1 X124.022 Y108.95 E.00902
G1 X120.917 Y112.055 E.14118
G1 X119.731 Y112.055 E.03815
G1 X116.626 Y108.95 E.14119
G1 X116.346 Y108.95 E.00902
G1 X111.257 Y114.039 E.23143
G1 X108.95 Y114.039 E.07417
G1 X108.95 Y110.115 E.12618
G2 X109.623 Y109.623 I-1.879 J-3.272 E.02686
G1 X112.766 Y112.766 E.14294
; WIPE_START
G1 X111.352 Y111.352 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.21 Y114.61 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S2000
G1 X112.583 Y114.982 E.01568
G1 X112.583 Y115.516
G1 X111.677 Y114.61 E.03815
G1 X111.144 Y114.61
G1 X112.583 Y116.049 E.06061
G1 X112.583 Y116.582
G1 X110.611 Y114.61 E.08307
G1 X110.077 Y114.61
G1 X112.583 Y117.115 E.10554
G1 X112.326 Y117.392
G1 X109.544 Y114.61 E.1172
G1 X109.011 Y114.61
G1 X111.793 Y117.392 E.1172
G1 X111.26 Y117.392
G1 X108.478 Y114.61 E.1172
G1 X108.417 Y115.083
G1 X110.726 Y117.392 E.09727
G1 X110.193 Y117.392
G1 X108.417 Y115.616 E.0748
G1 X108.417 Y116.15
G1 X109.66 Y117.392 E.05234
G1 X109.127 Y117.392
G1 X108.417 Y116.683 E.02988
; WIPE_START
M204 S6000
G1 X109.127 Y117.392 E-.38114
G1 X109.66 Y117.392 E-.20264
G1 X109.332 Y117.064 E-.17622
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y118.255 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y117.963 E.00938
G1 X110.287 Y117.963 E.04298
G1 X112.05 Y119.726 E.08016
G1 X112.05 Y120.922 E.03849
G1 X109.933 Y123.039 E.09626
G1 X108.95 Y123.039 E.03159
G1 X108.95 Y122.393 E.02077
; WIPE_START
G1 X108.95 Y123.039 E-.2454
G1 X109.933 Y123.039 E-.37336
G1 X110.196 Y122.776 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.145 Y123.61 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S2000
G1 X112.583 Y124.048 E.01844
G1 X112.583 Y124.581
G1 X111.612 Y123.61 E.0409
G1 X111.078 Y123.61
G1 X112.583 Y125.114 E.06336
G1 X112.583 Y125.647
G1 X110.545 Y123.61 E.08583
G1 X110.012 Y123.61
G1 X112.583 Y126.181 E.10829
G1 X112.261 Y126.392
G1 X109.479 Y123.61 E.1172
G1 X108.945 Y123.61
G1 X111.728 Y126.392 E.1172
G1 X111.194 Y126.392
G1 X108.417 Y123.615 E.11697
G1 X108.417 Y124.149
G1 X110.661 Y126.392 E.09451
G1 X110.128 Y126.392
G1 X108.417 Y124.682 E.07205
G1 X108.417 Y125.215
G1 X109.594 Y126.392 E.04959
G1 X109.061 Y126.392
G1 X108.417 Y125.748 E.02712
; WIPE_START
M204 S6000
G1 X109.061 Y126.392 E-.34601
G1 X109.594 Y126.392 E-.20264
G1 X109.201 Y125.999 E-.21135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.983 Y126.963 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X111.611 Y126.963 E.05236
G1 X112.05 Y127.402 E.01995
G1 X112.05 Y128.598 E.03849
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
G3 X111.306 Y132.436 I1.999 J2.865 E.0469
G1 X111.477 Y132.436 E.0055
; WIPE_START
G1 X111.306 Y132.436 E-.06503
G1 X110.88 Y132.547 E-.1673
G1 X109.973 Y133.001 E-.38548
G1 X109.708 Y132.736 E-.14218
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y133.459 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y134.479 E.03932
; WIPE_START
G1 X112.35 Y133.459 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516137
G1 F5705.632
M204 S6000
G1 X111.458 Y135.715 E.02073
G1 X111.471 Y135.936 E.00831
G1 X111.429 Y135.972 E.00205
G1 X111.529 Y136.116 E.00655
; LINE_WIDTH: 0.480694
G1 F6167.575
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.44636
G1 F6692.445
G1 X111.621 Y136.448 E.00548
; LINE_WIDTH: 0.399927
G1 F7562.881
G1 X111.667 Y136.614 E.00485
G1 X111.678 Y137.443 E.02338
G1 X111.642 Y137.805 E.01026
G1 X111.873 Y137.95 E.00768
G1 X112.012 Y137.811 E.00554
G1 X112.018 Y136.61 E.03387
; LINE_WIDTH: 0.412027
G1 F7314.958
G1 X112.001 Y136.417 E.00567
; LINE_WIDTH: 0.44636
G1 F6692.445
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480694
G1 F6167.575
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.50737
G1 F5813.327
G1 X111.958 Y135.533 E.01819
M204 S10000
G1 X110.989 Y135.634 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.123155
G1 F15000
M204 S6000
G1 X110.777 Y135.673 E.00137
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114041
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148273
G1 X109.792 Y135.407 E.00124
; WIPE_START
M73 P62 R4
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.111107
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139486
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.514 Y138.181 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.62624
G1 F4628.682
M204 S6000
G1 X110.066 Y140.476 E.12504
M204 S10000
G1 X109.861 Y140.885 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54682
G1 F5358.206
M204 S6000
G1 X109.73 Y140.803 E.00615
G1 X109.255 Y141.066 E.02162
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05953
; WIPE_START
G1 X109.058 Y142.217 E-.5683
G1 X109.058 Y141.712 E-.19171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.59 Y140.386 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109613
G1 F15000
M204 S6000
G3 X108.406 Y140.292 I1.432 J-3.042 E.00109
; WIPE_START
G1 X108.59 Y140.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.406 Y147.51 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.171729
G1 F15000
M204 S6000
G1 X108.559 Y147.537 E.00158
; LINE_WIDTH: 0.138384
G1 X112.594 Y147.549 E.03042
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/25
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z1.4 I1.046 J.622 P1  F42000
G1 X133.178 Y109.554 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.563 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.02 Y110.146 I-.491 J.226 E.00765
G3 X134.835 Y110.681 I-3.047 J-.754 E.01688
G3 X134.401 Y110.985 I-.736 J-.59 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.176 Y109.614 I.463 J-.218 E.00634
M204 S10000
G1 X132.79 Y109.486 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.518 E.00104
G2 X132.866 Y109.979 I.9 J.084 E.01519
G1 X133.356 Y110.959 E.03524
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.987 J-2.318 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.604 J1.511 E.01703
G2 X134.847 Y112.398 I.692 J.294 E.02339
G1 X114.487 Y112.398 E.65471
G2 X112.398 Y114.487 I.032 J2.121 E.10507
G1 X112.398 Y114.863 E.01211
G1 X108.602 Y114.863 E.12206
G1 X108.602 Y109.917 E.15906
G2 X109.975 Y108.602 I-1.392 J-2.827 E.06209
G1 X133.246 Y108.602 E.74833
G1 X133.291 Y108.79 E.00622
G2 X132.819 Y109.354 I.397 J.812 E.02436
G1 X132.803 Y109.427 E.00239
; WIPE_START
G1 X132.788 Y109.518 E-.03497
G1 X132.785 Y109.685 E-.06334
G1 X132.816 Y109.849 E-.06345
G1 X132.866 Y109.979 E-.05291
G1 X133.356 Y110.959 E-.41648
G1 X133.427 Y111.074 E-.05125
G1 X133.536 Y111.194 E-.06161
G1 X133.569 Y111.22 E-.01597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.419 J.527 E.0112
G1 X137.381 Y110.09 E.01689
G3 X137.519 Y110.127 I.005 J.259 E.00431
G1 X139.928 Y111.633 E.08464
G1 X140.226 Y111.933 E.01257
G3 X140.217 Y112.276 I-.353 J.163 E.01059
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.731 Y112.61 E.12057
G3 X135.567 Y112.561 I-.002 J-.293 E.00517
G1 X135.206 Y112.203 E.01518
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07311
G1 X136.243 Y110.46 E-.65241
G1 X136.307 Y110.396 E-.03448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.567 Y111.719 I-.805 J-.289 E.02248
G1 X140.175 Y111.325 E.01789
G1 X137.696 Y109.775 E.09402
G2 X137.399 Y109.698 I-.282 J.479 E.00997
G2 X136.648 Y109.712 I-.302 J3.821 E.02422
G2 X136.207 Y109.941 I.221 J.964 E.01613
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.412 Y110.164 I-1.77 J-.883 E.02116
G2 X135.329 Y109.736 I-.954 J-.036 E.01416
G2 X134.974 Y109.054 I-3.863 J1.579 E.02476
G2 X134.648 Y108.79 I-.755 J.601 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.919 Y109.072 E.0183
G2 X142.966 Y112.189 I67.639 J-103.89 E.19075
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.28 Y112.446 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.277 J-.132 E.00381
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.495 I.02 J1.726 E.07954
G1 X112.79 Y115.255 E.02264
G1 X108.21 Y115.255 E.13642
G1 X108.21 Y109.653 E.16689
G2 X109.734 Y108.21 I-.965 J-2.546 E.06417
G1 X137.729 Y108.21 E.83389
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14003
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07456
G2 X147.249 Y112.498 I-.008 J-.306 E.00825
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07032
G1 X147.31 Y110.508 E-.68968
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131751
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.555 J-.962 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02756
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.046 Y112.011 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.40881
G1 F7379.267
M204 S6000
G1 X141.923 Y112.011 E.02535
G1 X141.241 Y111.601 E.02301
G1 X141 Y111.787 E.00883
G1 X141.034 Y111.953 E.00488
M204 S10000
G1 X140.71 Y111.517 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.33602
G1 F9211.87
M204 S6000
G1 X140.391 Y111.047 E.01316
G3 X138.128 Y109.626 I71.115 J-115.809 E.06186
; LINE_WIDTH: 0.330821
G1 F9378.236
G1 X137.928 Y109.597 E.0046
; LINE_WIDTH: 0.300207
G1 F10494.122
G1 X137.727 Y109.569 E.00411
M204 S10000
G1 X137.806 Y109.545 F42000
; LINE_WIDTH: 0.146282
G1 F15000
M204 S6000
G1 X138.568 Y109.726 E.0064
M204 S10000
G1 X137.806 Y109.545 F42000
; LINE_WIDTH: 0.120457
G1 F15000
M204 S6000
G1 X137.654 Y109.516 E.00094
M204 S10000
G1 X135.717 Y109.543 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523692
G1 F5615.968
M204 S6000
G1 X135.903 Y109.524 E.0071
G1 X135.973 Y109.566 E.00308
; LINE_WIDTH: 0.509718
G1 F5784.092
G1 X136.129 Y109.483 E.00652
; LINE_WIDTH: 0.477753
G1 F6209.288
G1 X136.285 Y109.4 E.00607
; LINE_WIDTH: 0.443138
G1 F6746.332
G1 X136.536 Y109.361 E.00802
; LINE_WIDTH: 0.391711
G1 F7741.028
G1 X136.786 Y109.322 E.00699
G1 X137.306 Y109.329 E.01431
G1 X137.347 Y109.143 E.00526
G1 X137.415 Y109.102 E.00219
G1 X137.292 Y108.979 E.00479
G1 X136.792 Y108.978 E.01379
; LINE_WIDTH: 0.405888
G1 F7438.683
G1 X136.481 Y108.996 E.00893
; LINE_WIDTH: 0.443143
G1 F6746.248
G1 X136.17 Y109.015 E.00984
; LINE_WIDTH: 0.476313
G1 F6229.918
G1 X135.823 Y109.03 E.01189
; LINE_WIDTH: 0.51394
G1 F5732.247
G1 X135.476 Y109.044 E.01293
G1 X135.691 Y109.489 E.0184
M204 S10000
G1 X135.635 Y110.012 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116976
G1 F15000
M204 S6000
G1 X135.664 Y110.155 E.00085
G1 X135.628 Y110.247 E.00058
M204 S10000
G1 X135.153 Y111.003 F42000
; LINE_WIDTH: 0.115926
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.153927
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.111349
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140207
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.981 Y110.074 Z1.6 F42000
G1 X112.773 Y112.773 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.623 Y109.623 E.14324
G3 X108.95 Y110.115 I-2.541 J-2.765 E.02686
G1 X108.95 Y113.597 E.11196
G1 X111.699 Y113.597 E.08839
G1 X116.346 Y108.95 E.21132
G1 X116.626 Y108.95 E.00902
G1 X119.731 Y112.055 E.1412
G1 X120.917 Y112.055 E.03814
G1 X124.022 Y108.95 E.14118
G1 X124.302 Y108.95 E.00902
G1 X127.404 Y112.052 E.14107
G1 X128.596 Y112.052 E.03832
G1 X131.698 Y108.95 E.14105
G1 X131.978 Y108.95 E.00902
G1 X132.448 Y109.42 E.02138
G2 X132.547 Y110.12 I1.906 J.087 E.02285
G1 X132.955 Y110.935 E.0293
; WIPE_START
G1 X132.547 Y110.12 E-.3462
G1 X132.437 Y109.717 E-.15861
G1 X132.448 Y109.42 E-.11295
G1 X132.184 Y109.156 E-.14225
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.714 Y110.723 Z1.6 F42000
G1 X109.02 Y114.015 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.472525
G1 F6284.843
M204 S6000
G1 X109.02 Y114.445 E.01458
G1 X111.985 Y114.445 E.10061
G1 X112.043 Y114.015 E.01471
G1 X109.08 Y114.015 E.10053
; WIPE_START
G1 X111.08 Y114.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P63 R4
G1 X112.398 Y117.139 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X112.398 Y123.863 E.21623
G1 X108.602 Y123.863 E.12206
G1 X108.602 Y117.139 E.21623
G1 X112.338 Y117.139 E.12013
M204 S10000
G1 X112.79 Y116.747 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y124.255 E.22365
G1 X108.21 Y124.255 E.13642
G1 X108.21 Y116.747 E.22365
G1 X112.73 Y116.747 E.13464
; WIPE_START
M204 S6000
G1 X112.746 Y118.747 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.98 Y117.557 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.47174
G1 F6296.348
M204 S6000
G1 X109.02 Y117.557 E.10027
G1 X109.02 Y117.986 E.01453
G1 X111.98 Y117.986 E.10027
G1 X111.98 Y117.617 E.01249
M204 S10000
G1 X108.95 Y122.393 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y122.597 E.00655
G1 X110.375 Y122.597 E.04581
G1 X112.05 Y120.922 E.07615
G1 X112.05 Y119.726 E.03849
G1 X110.728 Y118.404 E.06012
G1 X109.099 Y118.404 E.05236
M204 S10000
G1 X109.02 Y123.015 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.47253
G1 F6284.77
M204 S6000
G1 X109.02 Y123.445 E.01458
G1 X111.98 Y123.445 E.10042
G1 X111.98 Y123.015 E.01458
G1 X109.08 Y123.015 E.09839
; WIPE_START
G1 X111.08 Y123.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.079 Y130.582 Z1.6 F42000
G1 X109.657 Y133.767 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.635 Y133.809 E.00152
G2 X109.653 Y134.552 I.85 J.352 E.0246
G2 X109.879 Y134.97 I2.34 J-.998 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.518 J1.609 E.01715
G2 X108.602 Y134.848 I-.293 J.692 E.02337
G1 X108.602 Y126.139 E.28006
G1 X112.398 Y126.139 E.12206
G1 X112.398 Y133.246 E.22853
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.802 Y133.545 I.444 J.805 E.00985
G1 X109.69 Y133.717 E.0066
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.368 Y133.176 I.202 J.398 E.00581
G3 X111.902 Y133.591 I.012 J.536 E.0218
G3 X111.91 Y134.262 I-3.611 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.971 E.01776
G3 X110.854 Y135.019 I-.226 J-.491 E.00765
G3 X110.319 Y134.835 I.755 J-3.049 E.01688
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.239 E.01182
; WIPE_START
M204 S6000
G1 X110.092 Y133.805 E-.09038
G1 X110.232 Y133.699 E-.06708
G1 X111.181 Y133.224 E-.40288
G1 X111.368 Y133.176 E-.07352
G1 X111.539 Y133.193 E-.06541
G1 X111.682 Y133.264 E-.06072
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.836 Y135.412 I.891 J-1.784 E.02132
G2 X111.264 Y135.328 I.037 J-.953 E.01416
G2 X111.946 Y134.973 I-1.575 J-3.855 E.02476
G2 X112.21 Y134.647 I-.601 J-.755 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.52 J68.765 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.611 E.09313
G2 X109.374 Y140.479 I.278 J-.697 E.0265
G1 X109.681 Y140.168 E.01403
G1 X111.21 Y137.721 E.09281
G2 X111.302 Y137.429 I-.464 J-.306 E.00997
G1 X111.302 Y136.796 E.02035
G2 X111.059 Y136.209 I-.855 J.01 E.02094
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.16091
G1 X110.836 Y135.412 E-.09573
G1 X110.995 Y135.408 E-.06061
G1 X111.264 Y135.328 E-.10665
G1 X111.946 Y134.973 E-.29215
G1 X112.031 Y134.895 E-.04395
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.111 Y140.187 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.698 Y140.196 I-.213 J-.257 E.0133
G1 X108.466 Y139.965 E.00975
G3 X108.39 Y139.781 I.184 J-.184 E.00609
G1 X108.39 Y135.722 E.12088
G3 X108.466 Y135.538 I.26 J0 E.00609
G1 X108.798 Y135.207 E.01397
G3 X108.916 Y135.137 I.199 J.204 E.00411
G3 X109.19 Y135.183 I.074 J.402 E.00845
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.515 J.414 E.01121
G1 X110.91 Y137.392 E.01719
G3 X110.868 Y137.529 I-.259 J-.005 E.0043
G1 X109.371 Y139.924 E.08413
G1 X109.154 Y140.144 E.00922
; WIPE_START
M204 S6000
G1 X109.003 Y140.254 E-.07081
G1 X108.935 Y140.269 E-.02648
G1 X108.785 Y140.251 E-.05718
G1 X108.698 Y140.196 E-.03945
G1 X108.466 Y139.965 E-.12437
G1 X108.41 Y139.88 E-.03858
G1 X108.39 Y139.781 E-.03855
G1 X108.39 Y138.821 E-.36458
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.544 Y146.452 Z1.6 F42000
G1 X108.561 Y147.261 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.154 J-.295 E.00376
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y125.747 E.65659
G1 X112.79 Y125.747 E.13642
G1 X112.79 Y138.226 E.37172
G2 X112.619 Y138.305 I.046 J.325 E.00569
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.0784
G1 X108.406 Y144.937 E.14146
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.51 Y147.228 I.332 J-.032 E.00805
M204 S10000
G1 X108.406 Y147.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134265
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00066
; LINE_WIDTH: 0.169011
G2 X108.559 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138385
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5468
G1 F5358.419
M204 S6000
G1 X109.73 Y140.803 E.00615
G1 X109.255 Y141.066 E.02162
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.937 E.05952
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626296
G1 F4628.235
M204 S6000
G1 X111.514 Y138.18 E.12506
; WIPE_START
G1 X110.447 Y139.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.988 Y135.634 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.117336
G1 F15000
M204 S6000
G1 X110.844 Y135.664 E.00087
G1 X110.75 Y135.627 E.00059
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114037
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148265
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.111121
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139534
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.956 Y135.476 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519785
G1 F5661.979
M204 S6000
G1 X111.457 Y135.717 E.02089
G1 X111.469 Y135.925 E.00786
G1 X111.424 Y135.965 E.00223
G1 X111.524 Y136.093 E.00614
; LINE_WIDTH: 0.490753
G1 F6029.039
G1 X111.565 Y136.213 E.00447
; LINE_WIDTH: 0.456238
G1 F6532.508
G1 X111.605 Y136.333 E.00413
; LINE_WIDTH: 0.426068
G1 F7046.895
G1 X111.642 Y136.56 E.00694
; LINE_WIDTH: 0.397359
G1 F7617.686
G1 X111.678 Y136.786 E.00642
G3 X111.642 Y137.805 I-5.054 J.331 E.02858
G1 X111.873 Y137.95 E.00764
G1 X112.012 Y137.811 E.0055
G1 X112.022 Y136.786 E.02871
; LINE_WIDTH: 0.405135
G1 F7454.137
G1 X112.004 Y136.484 E.00867
; LINE_WIDTH: 0.440745
G1 F6786.904
G1 X111.987 Y136.181 E.00952
; LINE_WIDTH: 0.473903
G1 F6264.755
G1 X111.973 Y135.858 E.011
; LINE_WIDTH: 0.504608
G1 F5848.112
G1 X111.958 Y135.536 E.01178
; WIPE_START
G1 X111.973 Y135.858 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.459 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.616 Y127.404 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X112.05 Y127.404 E.01394
G1 X112.05 Y128.598 E.03842
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
G3 X111.311 Y132.436 I1.984 J2.835 E.04706
G1 X111.477 Y132.436 E.00535
M204 S10000
G1 X111.98 Y126.557 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.47174
G1 F6296.348
M204 S6000
G1 X109.02 Y126.557 E.10027
G1 X109.02 Y126.986 E.01453
G1 X111.98 Y126.986 E.10027
G1 X111.98 Y126.617 E.01249
; WIPE_START
G1 X111.98 Y126.986 E-.14015
G1 X110.349 Y126.986 E-.61985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.247 Y134.538 Z1.6 F42000
G1 X108.406 Y140.299 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0980889
G1 F15000
M204 S6000
G1 X108.56 Y140.373 E.00075
G1 X108.592 Y140.361 E.00015
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.56 Y140.373 E-.12578
G1 X108.406 Y140.299 E-.63422
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/25
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S96.9
; OBJECT_ID: 75
M204 S10000
G17
G3 Z1.6 I.948 J.764 P1  F42000
G1 X133.178 Y109.554 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01608
G1 X134.971 Y109.897 E.01776
G3 X135.02 Y110.149 I-.489 J.225 E.00773
G3 X134.835 Y110.681 I-3.088 J-.772 E.01681
G3 X134.401 Y110.985 I-.736 J-.59 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.176 Y109.614 I.463 J-.218 E.00634
M204 S10000
G1 X132.79 Y109.486 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.518 E.00104
G2 X132.866 Y109.978 I.9 J.084 E.01519
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.986 J-2.316 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.702 I1.601 J1.509 E.01708
G2 X134.846 Y112.398 I.7 J.292 E.02332
G1 X114.487 Y112.398 E.65469
G2 X112.397 Y114.5 I.031 J2.12 E.10553
G1 X108.602 Y114.5 E.12204
G1 X108.602 Y109.917 E.14739
G2 X109.975 Y108.602 I-1.392 J-2.827 E.06209
G1 X133.246 Y108.602 E.74833
G1 X133.291 Y108.79 E.00622
G2 X132.819 Y109.354 I.397 J.812 E.02436
G1 X132.803 Y109.427 E.00239
; WIPE_START
G1 X132.788 Y109.518 E-.03496
G1 X132.785 Y109.685 E-.06337
G1 X132.816 Y109.849 E-.06349
G1 X132.866 Y109.978 E-.05283
G1 X133.356 Y110.959 E-.41655
G1 X133.427 Y111.074 E-.05127
G1 X133.536 Y111.194 E-.06167
G1 X133.571 Y111.217 E-.01585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.052 E.00405
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.419 J.527 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.00431
G1 X139.929 Y111.633 E.08436
G1 X140.226 Y111.933 E.01256
G3 X140.226 Y112.267 I-.311 J.167 E.01037
G1 X139.964 Y112.533 E.01113
G3 X139.78 Y112.61 I-.185 J-.185 E.0061
G1 X135.721 Y112.61 E.1209
G3 X135.559 Y112.554 I.012 J-.293 E.00516
G1 X135.205 Y112.202 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00664
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07324
G1 X136.243 Y110.46 E-.65245
G1 X136.306 Y110.397 E-.03431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.595 Y112.398 E.07628
G2 X140.567 Y111.719 I-.709 J-.31 E.02261
G1 X140.175 Y111.325 E.01787
G1 X137.72 Y109.79 E.09311
G2 X137.427 Y109.698 I-.306 J.463 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02094
G1 X135.949 Y110.2 E.01176
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.412 Y110.168 I-1.772 J-.883 E.02105
G2 X135.329 Y109.736 I-.949 J-.041 E.01427
G2 X134.974 Y109.054 I-3.856 J1.575 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01358
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00277
G1 X137.919 Y109.072 E.01829
G2 X142.965 Y112.189 I67.667 J-103.934 E.19076
; WIPE_START
M73 P64 R4
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.272 Y112.455 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.28 J-.151 E.00414
G1 X147.31 Y108.21 E.12251
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.495 I.02 J1.725 E.07954
G1 X112.79 Y114.892 E.01183
G1 X108.21 Y114.892 E.13642
G1 X108.21 Y109.653 E.15608
G2 X109.734 Y108.21 I-.965 J-2.546 E.06417
G1 X137.729 Y108.21 E.83389
G1 X137.729 Y108.224 E.00042
G2 X137.811 Y108.41 I.339 J-.038 E.00614
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.416 Y112.604 E.14002
G1 X144.509 Y112.621 E.0028
G1 X147.012 Y112.621 E.07456
G2 X147.239 Y112.505 I-.019 J-.317 E.00781
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07444
G1 X147.31 Y110.519 E-.68556
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.518 Y112.594 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132036
G1 F15000
M204 S6000
G1 X147.55 Y112.333 E.00185
G1 X147.55 Y108.406 E.02765
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.047 Y112.011 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.40891
G1 F7377.252
M204 S6000
G1 X141.923 Y112.011 E.02535
G1 X141.242 Y111.601 E.02301
G1 X141 Y111.787 E.00883
G1 X141.034 Y111.953 E.00488
M204 S10000
G1 X140.71 Y111.517 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.335991
G1 F9212.782
M204 S6000
G1 X140.391 Y111.046 E.01317
G1 X138.128 Y109.626 E.06185
; LINE_WIDTH: 0.330791
G1 F9379.217
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300144
G1 F10496.707
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168821
G1 F15000
M204 S6000
G1 X138.62 Y109.759 E.00973
; WIPE_START
G1 X137.674 Y109.511 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.224 Y112.594 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.141086
G1 F15000
M204 S6000
G1 X135.151 Y112.489 E.00099
; LINE_WIDTH: 0.111641
G1 X135.079 Y112.384 E.00069
; WIPE_START
G1 X135.151 Y112.489 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.407 Y111.207 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.153961
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115937
G1 X135.153 Y111.003 E.00094
M204 S10000
G1 X135.628 Y110.247 F42000
; LINE_WIDTH: 0.117013
G1 F15000
M204 S6000
G1 X135.664 Y110.155 E.00058
G1 X135.635 Y110.012 E.00085
M204 S10000
G1 X135.718 Y109.544 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523956
G1 F5612.885
M204 S6000
G1 X135.903 Y109.524 E.00708
G1 X135.973 Y109.565 E.00307
; LINE_WIDTH: 0.509875
G1 F5782.142
G1 X136.129 Y109.483 E.00652
; LINE_WIDTH: 0.477805
G1 F6208.538
G1 X136.285 Y109.4 E.00607
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390025
G1 F7778.635
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.137 E.00525
G1 X137.427 Y109.112 E.00138
G1 X137.293 Y108.978 E.00519
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.40594
G1 F7437.607
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.476405
G1 F6228.589
G1 X135.823 Y109.03 E.01189
; LINE_WIDTH: 0.514275
G1 F5728.17
G1 X135.476 Y109.044 E.01293
G1 X135.692 Y109.49 E.01842
; WIPE_START
G1 X135.476 Y109.044 E-.44659
G1 X135.823 Y109.03 E-.31341
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.955 Y110.935 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G3 X132.436 Y109.486 I2.167 J-1.593 E.05019
G1 X132.448 Y109.42 E.00213
G1 X131.978 Y108.95 E.02138
G1 X131.698 Y108.95 E.00902
G1 X128.596 Y112.052 E.14105
G1 X127.404 Y112.052 E.03833
G1 X124.302 Y108.95 E.14107
G1 X124.022 Y108.95 E.00902
G1 X120.917 Y112.055 E.14118
G1 X119.731 Y112.055 E.03815
G1 X116.626 Y108.95 E.14119
G1 X116.346 Y108.95 E.00902
G1 X111.144 Y114.152 E.23656
G1 X108.95 Y114.152 E.07054
G1 X108.95 Y110.115 E.12981
G2 X109.623 Y109.623 I-1.858 J-3.242 E.02686
G1 X112.772 Y112.772 E.14323
; WIPE_START
G1 X111.358 Y111.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.398 Y117.502 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.5 E.19289
G1 X108.602 Y123.5 E.12206
G1 X108.602 Y117.502 E.19289
G1 X112.338 Y117.502 E.12013
M204 S10000
G1 X112.79 Y117.11 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.892 E.20203
G1 X108.21 Y123.892 E.13642
G1 X108.21 Y117.11 E.20203
G1 X112.73 Y117.11 E.13464
; WIPE_START
M204 S6000
G1 X112.748 Y119.11 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y118.255 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y117.85 E.01301
G1 X110.174 Y117.85 E.03935
G1 X112.05 Y119.726 E.08529
G1 X112.05 Y120.922 E.03849
G1 X109.82 Y123.152 E.1014
G1 X108.95 Y123.152 E.02797
G1 X108.95 Y122.394 E.02439
; WIPE_START
G1 X108.95 Y123.152 E-.28827
G1 X109.82 Y123.152 E-.33049
G1 X110.083 Y122.889 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.784 Y130.516 Z1.8 F42000
G1 X109.657 Y133.768 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.635 Y133.809 E.00151
G2 X109.653 Y134.552 I.85 J.352 E.0246
G2 X109.879 Y134.97 I2.332 J-.995 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.79 I-1.51 J1.599 E.01717
G2 X108.602 Y134.842 I-.294 J.758 E.02319
G1 X108.602 Y126.502 E.26818
G1 X112.398 Y126.502 E.12206
G1 X112.398 Y133.246 E.21686
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.801 Y133.546 I.444 J.805 E.00991
G1 X109.69 Y133.717 E.00656
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.371 Y133.176 I.201 J.394 E.00589
G3 X111.902 Y133.591 I.009 J.536 E.02172
G3 X111.91 Y134.262 I-3.61 J.377 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01609
G1 X111.103 Y134.97 E.01776
G3 X110.851 Y135.019 I-.225 J-.489 E.00773
G3 X110.319 Y134.834 I.772 J-3.087 E.01681
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01183
; WIPE_START
M204 S6000
G1 X110.091 Y133.806 E-.09019
G1 X110.232 Y133.699 E-.06729
G1 X111.181 Y133.224 E-.40287
G1 X111.371 Y133.176 E-.07451
G1 X111.539 Y133.193 E-.0644
G1 X111.682 Y133.264 E-.06074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.832 Y135.412 I.891 J-1.785 E.02121
G2 X111.264 Y135.328 I.041 J-.949 E.01427
G2 X111.946 Y134.973 I-1.579 J-3.863 E.02476
G2 X112.209 Y134.647 I-.6 J-.754 E.01358
G1 X112.398 Y134.691 E.00623
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.837 J68.967 E.19483
G1 X108.602 Y143.507 E.00597
G1 X108.602 Y140.612 E.09311
G2 X109.374 Y140.479 I.283 J-.664 E.02663
G1 X109.681 Y140.167 E.01408
G1 X111.225 Y137.697 E.09367
G2 X111.302 Y137.399 I-.474 J-.281 E.01001
G2 X111.288 Y136.649 I-3.823 J-.302 E.02417
G2 X111.059 Y136.209 I-.963 J.221 E.01613
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.589 Y135.364 E-.16097
G1 X110.832 Y135.412 E-.0944
G1 X110.994 Y135.409 E-.0614
G1 X111.264 Y135.328 E-.10718
G1 X111.946 Y134.973 E-.29213
G1 X112.031 Y134.895 E-.04392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.111 Y140.187 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.697 Y140.196 I-.212 J-.24 E.01342
G1 X108.466 Y139.964 E.00974
G3 X108.39 Y139.781 I.185 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.259 J0 E.00609
G1 X108.798 Y135.207 E.01396
G3 X108.94 Y135.13 I.2 J.201 E.00489
G3 X109.189 Y135.183 I.06 J.327 E.00779
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.901 Y136.726 I-.416 J.38 E.00863
G3 X110.91 Y137.382 I-3.333 J.373 E.01957
M73 P65 R4
G3 X110.873 Y137.52 I-.257 J.006 E.00432
G1 X109.372 Y139.923 E.08438
G1 X109.154 Y140.144 E.00927
; WIPE_START
M204 S6000
G1 X108.991 Y140.259 E-.07571
G1 X108.877 Y140.272 E-.04354
G1 X108.785 Y140.251 E-.03583
G1 X108.697 Y140.196 E-.03939
G1 X108.466 Y139.964 E-.12431
G1 X108.41 Y139.88 E-.0387
G1 X108.39 Y139.781 E-.03834
G1 X108.39 Y138.822 E-.36418
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.531 Y146.453 Z1.8 F42000
G1 X108.546 Y147.261 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.144 J-.271 E.00419
G1 X112.79 Y147.309 E.12241
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.11 E.64578
G1 X112.79 Y126.11 E.13642
G1 X112.79 Y138.228 E.36096
G2 X112.619 Y138.305 I.039 J.315 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.41 Y144.93 E.14124
G1 X108.389 Y145.026 E.00291
G1 X108.383 Y146.997 E.05872
G2 X108.496 Y147.228 I.307 J-.006 E.00789
M204 S10000
G1 X108.406 Y147.51 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171736
G1 F15000
M204 S6000
G1 X108.559 Y147.537 E.00158
; LINE_WIDTH: 0.138385
G1 X112.594 Y147.549 E.03043
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.862 Y140.885 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5448
G1 F5379.772
M204 S6000
G1 X109.731 Y140.802 E.00616
G1 X109.283 Y141.056 E.02041
G1 X109.057 Y141.104 E.00919
G1 X109.057 Y142.22 E.04426
G1 X109.831 Y140.936 E.05946
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626259
G1 F4628.528
M204 S6000
G1 X111.518 Y138.174 E.12538
; WIPE_START
G1 X110.451 Y139.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.988 Y135.634 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.117398
G1 F15000
M204 S6000
G1 X110.844 Y135.664 E.00087
G1 X110.75 Y135.627 E.00059
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114032
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148249
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.956 Y135.476 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519978
G1 F5659.688
M204 S6000
G1 X111.456 Y135.717 E.02091
G1 X111.468 Y135.925 E.00785
G1 X111.424 Y135.965 E.00222
G1 X111.524 Y136.093 E.00614
; LINE_WIDTH: 0.488928
G1 F6053.71
G1 X111.57 Y136.227 E.00499
; LINE_WIDTH: 0.450783
G1 F6619.878
G1 X111.615 Y136.361 E.00456
; LINE_WIDTH: 0.398721
G1 F7588.524
G1 X111.678 Y136.79 E.01219
G1 X111.669 Y137.572 E.02197
G1 X111.603 Y137.773 E.00593
G1 X111.878 Y137.946 E.00915
G1 X112.013 Y137.812 E.00535
G1 X112.022 Y136.793 E.02864
; LINE_WIDTH: 0.403388
G1 F7490.274
G1 X112.006 Y136.501 E.00834
; LINE_WIDTH: 0.435623
G1 F6875.433
G1 X111.99 Y136.208 E.00908
; LINE_WIDTH: 0.468855
G1 F6338.995
G1 X111.974 Y135.872 E.01133
; LINE_WIDTH: 0.503085
G1 F5867.46
G1 X111.959 Y135.536 E.01224
; WIPE_START
G1 X111.974 Y135.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.99 Y127.22 Z1.8 F42000
G1 X109.87 Y126.85 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X111.498 Y126.85 E.05236
G1 X112.05 Y127.402 E.02508
G1 X112.05 Y128.598 E.03849
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.98 Y133.008 E.04683
G3 X111.316 Y132.436 I1.926 J2.653 E.04711
G1 X111.48 Y132.436 E.0053
; WIPE_START
G1 X111.316 Y132.436 E-.06268
G1 X110.878 Y132.548 E-.1714
G1 X109.98 Y133.008 E-.38361
G1 X109.715 Y132.743 E-.14231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.412 Y140.263 Z1.8 F42000
G1 X108.406 Y140.299 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0987172
G1 F15000
M204 S6000
G2 X108.586 Y140.384 I.828 J-1.516 E.00088
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.299 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/25
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z1.8 I.948 J.764 P1  F42000
G1 X133.178 Y109.554 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.019 Y110.151 I-.487 J.224 E.0078
G3 X134.835 Y110.681 I-3.123 J-.789 E.01674
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.239 J-.469 E.02421
G1 X133.225 Y109.819 E.03158
G3 X133.176 Y109.614 I.463 J-.218 E.00634
M204 S10000
G1 X132.79 Y109.486 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.518 E.00104
G2 X132.866 Y109.978 I.9 J.084 E.01519
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.987 J-2.318 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.592 J1.503 E.01704
G2 X134.847 Y112.398 I.692 J.294 E.02338
G1 X114.487 Y112.398 E.65471
G2 X112.41 Y114.281 I.033 J2.123 E.09847
G1 X108.602 Y114.281 E.12245
G1 X108.602 Y109.911 E.14053
G2 X109.975 Y108.602 I-1.456 J-2.901 E.0619
G1 X133.246 Y108.602 E.74833
G1 X133.291 Y108.79 E.00622
G2 X132.819 Y109.354 I.397 J.812 E.02436
G1 X132.803 Y109.427 E.00239
; WIPE_START
G1 X132.788 Y109.518 E-.03496
G1 X132.785 Y109.685 E-.06336
G1 X132.816 Y109.849 E-.06349
G1 X132.866 Y109.978 E-.0528
G1 X133.356 Y110.959 E-.41657
G1 X133.427 Y111.074 E-.05127
G1 X133.536 Y111.194 E-.06171
G1 X133.569 Y111.22 E-.01584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.357 J.376 E.01131
G1 X137.391 Y110.09 E.01718
G3 X137.527 Y110.132 I-.005 J.258 E.00431
G1 X139.928 Y111.633 E.08435
G1 X140.226 Y111.933 E.01258
G3 X140.217 Y112.276 I-.354 J.163 E.01058
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.185 E.0061
G1 X135.731 Y112.61 E.12058
G3 X135.567 Y112.561 I-.002 J-.293 E.00516
G1 X135.206 Y112.203 E.01517
G3 X135.131 Y111.996 I.266 J-.213 E.00667
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07304
G1 X136.243 Y110.46 E-.65246
G1 X136.307 Y110.396 E-.03451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.567 Y111.72 I-.806 J-.289 E.02247
G1 X140.175 Y111.325 E.0179
G1 X137.72 Y109.79 E.09311
G2 X137.427 Y109.698 I-.306 J.463 E.00998
G1 X136.795 Y109.698 E.02034
G2 X136.207 Y109.941 I.033 J.91 E.02089
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.412 Y110.171 I-1.776 J-.885 E.02095
G2 X135.329 Y109.736 I-.945 J-.046 E.01437
G2 X134.974 Y109.054 I-3.873 J1.584 E.02476
G2 X134.648 Y108.79 I-.756 J.603 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.517 Y108.67 E.00277
G1 X137.919 Y109.072 E.01829
G2 X142.966 Y112.189 I67.649 J-103.906 E.19075
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.28 Y112.447 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.277 J-.132 E.00381
G1 X147.31 Y108.21 E.12251
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99174
G2 X112.79 Y114.673 I.025 J1.736 E.0849
G1 X108.21 Y114.673 E.13642
G1 X108.21 Y109.653 E.14955
G2 X109.734 Y108.21 I-.965 J-2.546 E.06417
G1 X137.729 Y108.21 E.83389
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.337 J-.037 E.00617
G1 X138.166 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14003
G1 X144.509 Y112.621 E.0028
G1 X147.012 Y112.621 E.07456
G2 X147.249 Y112.498 I-.008 J-.306 E.00825
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07036
G1 X147.31 Y110.508 E-.68964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.502 Y112.548 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129607
G1 F15000
M204 S6000
G1 X147.428 Y112.594 E.0006
M204 S10000
G1 X147.502 Y112.548 F42000
; LINE_WIDTH: 0.131793
G1 F15000
M204 S6000
G1 X147.529 Y112.529 E.00023
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02758
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.046 Y112.012 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.40855
G1 F7384.514
M204 S6000
G1 X141.924 Y112.012 E.02535
G1 X141.241 Y111.6 E.02302
G1 X141 Y111.788 E.00883
G1 X141.034 Y111.953 E.00486
M204 S10000
G1 X140.71 Y111.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.336081
G1 F9209.963
M204 S6000
G1 X140.392 Y111.047 E.01316
G3 X138.128 Y109.626 I72.441 J-117.921 E.06189
; LINE_WIDTH: 0.330813
G1 F9378.483
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300205
G1 F10494.227
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168655
G1 F15000
M204 S6000
G1 X138.62 Y109.759 E.00971
M204 S10000
G1 X135.718 Y109.544 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.524197
G1 F5610.081
M204 S6000
G1 X135.903 Y109.525 E.00708
G1 X135.973 Y109.566 E.00306
; LINE_WIDTH: 0.510025
M73 P66 R4
G1 F5780.285
G1 X136.129 Y109.483 E.00652
; LINE_WIDTH: 0.477855
G1 F6207.824
G1 X136.285 Y109.4 E.00607
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390025
G1 F7778.639
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.137 E.00524
G1 X137.427 Y109.112 E.00138
G1 X137.293 Y108.978 E.00519
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.40594
G1 F7437.607
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.476485
G1 F6227.44
G1 X135.824 Y109.03 E.01189
; LINE_WIDTH: 0.514565
G1 F5724.647
G1 X135.477 Y109.044 E.01293
G1 X135.692 Y109.49 E.01844
M204 S10000
G1 X135.635 Y110.012 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.117051
G1 F15000
M204 S6000
G1 X135.664 Y110.155 E.00085
G1 X135.628 Y110.247 E.00058
M204 S10000
G1 X135.153 Y111.003 F42000
; LINE_WIDTH: 0.115933
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.153953
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.111356
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140253
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.98 Y110.072 Z2 F42000
G1 X112.766 Y112.766 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.623 Y109.623 E.14294
G3 X108.95 Y110.112 I-2.412 J-2.608 E.0268
G1 X108.95 Y113.933 E.12287
G1 X111.363 Y113.933 E.07758
G1 X116.346 Y108.95 E.2266
G1 X116.626 Y108.95 E.00902
G1 X119.731 Y112.055 E.1412
G1 X120.917 Y112.055 E.03815
G1 X124.022 Y108.95 E.14118
G1 X124.302 Y108.95 E.00902
G1 X127.404 Y112.052 E.14107
G1 X128.596 Y112.052 E.03833
G1 X131.698 Y108.95 E.14105
G1 X131.978 Y108.95 E.00902
G1 X132.448 Y109.42 E.02138
G2 X132.547 Y110.12 I1.908 J.086 E.02284
G1 X132.955 Y110.935 E.0293
; WIPE_START
G1 X132.547 Y110.12 E-.34627
G1 X132.437 Y109.717 E-.15855
G1 X132.448 Y109.42 E-.11293
G1 X132.184 Y109.156 E-.14224
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.179 Y112.187 Z2 F42000
G1 X112.398 Y117.719 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.281 E.17888
G1 X108.602 Y123.281 E.12206
G1 X108.602 Y117.719 E.17888
G1 X112.338 Y117.719 E.12013
M204 S10000
G1 X112.79 Y117.327 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.673 E.18905
G1 X108.21 Y123.673 E.13642
G1 X108.21 Y117.327 E.18905
G1 X112.73 Y117.327 E.13464
; WIPE_START
M204 S6000
G1 X112.749 Y119.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y122.393 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y122.933 E.01735
G1 X110.039 Y122.933 E.03501
G1 X112.05 Y120.922 E.09144
G1 X112.05 Y119.726 E.03849
G1 X110.391 Y118.067 E.07543
G1 X108.95 Y118.067 E.04632
G1 X108.95 Y118.255 E.00604
; WIPE_START
G1 X108.95 Y118.067 E-.07133
G1 X110.391 Y118.067 E-.54743
G1 X110.654 Y118.33 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.151 Y125.946 Z2 F42000
G1 X109.632 Y133.817 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.625 Y133.836 E.00063
G2 X109.653 Y134.552 I.86 J.325 E.02368
G2 X109.879 Y134.97 I2.343 J-1 E.0153
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.791 I-1.512 J1.602 E.01715
G2 X108.602 Y134.84 I-.296 J.762 E.02319
G1 X108.602 Y126.719 E.26116
G1 X112.398 Y126.719 E.12206
G1 X112.398 Y133.246 E.20989
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.703 Y133.677 I.444 J.805 E.01515
G1 X109.659 Y133.764 E.00315
M204 S10000
G1 X109.991 Y133.977 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.493 J.184 E.01121
G1 X111.181 Y133.224 E.03158
G3 X111.373 Y133.176 I.2 J.392 E.00597
G3 X111.902 Y133.591 I.007 J.536 E.02164
G3 X111.91 Y134.262 I-3.611 J.377 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01609
G1 X111.103 Y134.97 E.01776
G3 X110.849 Y135.019 I-.224 J-.487 E.0078
G3 X110.319 Y134.834 I.789 J-3.123 E.01674
G3 X110.015 Y134.4 I.591 J-.736 E.016
G3 X109.973 Y134.034 I.469 J-.239 E.01121
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09918
G1 X110.232 Y133.699 E-.0658
G1 X111.181 Y133.224 E-.40289
G1 X111.373 Y133.176 E-.07546
G1 X111.539 Y133.193 E-.0634
G1 X111.665 Y133.256 E-.05327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.829 Y135.411 I.892 J-1.789 E.02111
G2 X111.264 Y135.328 I.046 J-.945 E.01437
G2 X111.946 Y134.973 I-1.574 J-3.854 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01358
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01963
G2 X108.781 Y143.557 I105.491 J68.746 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.611 E.09313
G2 X109.374 Y140.479 I.284 J-.662 E.02665
G1 X109.681 Y140.167 E.01407
G1 X111.21 Y137.721 E.09276
G2 X111.302 Y137.429 I-.462 J-.306 E.00998
G1 X111.302 Y136.796 E.02034
G2 X111.059 Y136.209 I-.91 J.033 E.02088
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.1609
G1 X110.829 Y135.411 E-.09328
G1 X110.993 Y135.409 E-.06209
G1 X111.264 Y135.328 E-.10766
G1 X111.946 Y134.973 E-.2922
G1 X112.031 Y134.895 E-.04387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.11 Y140.188 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X108.99 Y140.254 E.00408
G3 X108.734 Y140.223 I-.093 J-.311 E.00791
G3 X108.466 Y139.965 I1.038 J-1.342 E.01111
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.943 Y135.13 I.198 J.197 E.00497
G3 X109.19 Y135.183 I.058 J.327 E.00771
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.376 J.357 E.01131
G1 X110.91 Y137.392 E.01718
G3 X110.868 Y137.529 I-.258 J-.005 E.00431
G1 X109.372 Y139.923 E.08409
G1 X109.153 Y140.145 E.00931
; WIPE_START
M204 S6000
G1 X108.99 Y140.254 E-.07425
G1 X108.877 Y140.272 E-.04365
G1 X108.734 Y140.223 E-.0574
G1 X108.466 Y139.965 E-.14151
G1 X108.41 Y139.88 E-.03856
G1 X108.39 Y139.781 E-.03853
G1 X108.39 Y138.817 E-.3661
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.538 Y146.448 Z2 F42000
G1 X108.554 Y147.262 Z2
G1 Z1.6
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.145 J-.281 E.00395
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.327 E.63932
G1 X112.79 Y126.327 E.13642
G1 X112.79 Y138.228 E.3545
G2 X112.619 Y138.305 I.043 J.323 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.0784
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.028 E.00278
G1 X108.383 Y147.01 E.05902
G2 X108.503 Y147.23 I.315 J-.029 E.00768
M204 S10000
G1 X108.406 Y147.412 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119325
G1 F15000
M204 S6000
G1 X108.447 Y147.48 E.00048
; LINE_WIDTH: 0.165595
G2 X108.559 Y147.537 I.084 J-.028 E.00135
; LINE_WIDTH: 0.138386
G1 X112.594 Y147.549 E.03043
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.863 Y140.885 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54476
G1 F5380.201
M204 S6000
G1 X109.731 Y140.801 E.00617
G1 X109.287 Y141.055 E.02027
G1 X109.057 Y141.104 E.00933
G1 X109.057 Y142.221 E.04428
G1 X109.832 Y140.936 E.05948
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626247
G1 F4628.625
M204 S6000
G1 X111.514 Y138.18 E.12504
; WIPE_START
G1 X110.447 Y139.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.988 Y135.635 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.117414
G1 F15000
M204 S6000
G1 X110.844 Y135.663 E.00086
G1 X110.75 Y135.627 E.00059
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114043
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148284
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.956 Y135.476 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51931
G1 F5667.633
M204 S6000
G1 X111.456 Y135.718 E.02089
G1 X111.468 Y135.925 E.00781
G1 X111.424 Y135.964 E.00222
G1 X111.529 Y136.116 E.00695
; LINE_WIDTH: 0.480702
G1 F6167.457
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.446365
G1 F6692.362
G1 X111.621 Y136.448 E.00549
; LINE_WIDTH: 0.399903
G1 F7563.399
G1 X111.667 Y136.614 E.00485
G1 X111.678 Y137.442 E.02337
G1 X111.643 Y137.805 E.01027
G1 X111.873 Y137.95 E.00767
G1 X112.012 Y137.811 E.00554
G1 X112.018 Y136.611 E.03386
; LINE_WIDTH: 0.412029
G1 F7314.926
G1 X112.001 Y136.417 E.00568
; LINE_WIDTH: 0.446365
G1 F6692.362
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480702
G1 F6167.457
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.50925
G1 F5789.892
G1 X111.957 Y135.536 E.01815
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.477 Y132.436 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.88 Y132.547 I-.053 J1.376 E.01969
G1 X109.973 Y133.001 E.03262
G1 X108.95 Y131.978 E.0465
G1 X108.95 Y131.698 E.00902
G1 X112.05 Y128.598 E.14095
G1 X112.05 Y127.402 E.03849
G1 X111.715 Y127.067 E.01522
G1 X110.087 Y127.067 E.05236
; WIPE_START
G1 X111.715 Y127.067 E-.61876
G1 X111.978 Y127.33 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.95 Y134.688 Z2 F42000
G1 X108.406 Y140.292 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109983
G1 F15000
M204 S6000
G2 X108.59 Y140.386 I1.664 J-3.041 E.00109
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.292 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/25
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z2 I.948 J.764 P1  F42000
G1 X133.181 Y109.554 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.513 J.051 E.02205
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.019 Y110.154 I-.485 J.224 E.00787
G3 X134.835 Y110.681 I-3.163 J-.807 E.01667
G3 X134.401 Y110.985 I-.731 J-.584 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.178 Y109.614 I.469 J-.214 E.00632
M204 S10000
G1 X132.79 Y109.486 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.518 E.00104
G2 X132.866 Y109.978 I.9 J.084 E.01519
G1 X133.356 Y110.959 E.03524
G2 X134.553 Y111.347 I.805 J-.444 E.04455
G2 X134.967 Y111.123 I-.993 J-2.329 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.78 Y111.717 I1.659 J1.555 E.01765
G2 X134.847 Y112.398 I.759 J.269 E.02271
G1 X114.487 Y112.398 E.65471
G2 X112.43 Y114.131 I.035 J2.128 E.0936
G1 X108.602 Y114.131 E.1231
G1 X108.602 Y109.911 E.13569
G2 X109.974 Y108.602 I-1.414 J-2.856 E.06191
G1 X133.246 Y108.602 E.74835
G1 X133.291 Y108.79 E.00622
G2 X132.819 Y109.354 I.397 J.812 E.02435
G1 X132.803 Y109.427 E.00239
; WIPE_START
G1 X132.788 Y109.518 E-.03499
G1 X132.785 Y109.685 E-.0634
G1 X132.816 Y109.849 E-.06344
G1 X132.866 Y109.978 E-.05284
G1 X133.356 Y110.959 E-.41647
G1 X133.427 Y111.074 E-.05138
M73 P67 R4
G1 X133.536 Y111.194 E-.06164
G1 X133.569 Y111.22 E-.01584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.127 Y111.966 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.319 J.026 E.00496
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.357 J.378 E.01131
G1 X137.389 Y110.09 E.01713
G3 X137.523 Y110.129 I-.01 J.281 E.00421
G1 X139.928 Y111.633 E.08449
G1 X140.217 Y111.924 E.01221
G3 X140.224 Y112.269 I-.366 J.18 E.01061
G1 X139.964 Y112.533 E.01106
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.731 Y112.61 E.12057
G3 X135.567 Y112.561 I-.002 J-.293 E.00517
G1 X135.206 Y112.203 E.01517
G3 X135.128 Y112.026 I.24 J-.211 E.00584
; WIPE_START
M204 S6000
G1 X135.146 Y111.869 E-.05985
G1 X135.182 Y111.81 E-.02622
G1 X136.243 Y110.46 E-.65242
G1 X136.283 Y110.42 E-.0215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.594 Y112.398 E.07631
G2 X140.542 Y111.694 I-.661 J-.304 E.02369
G1 X140.175 Y111.324 E.01676
G1 X137.708 Y109.782 E.09356
G2 X137.422 Y109.698 I-.307 J.516 E.00968
G1 X136.795 Y109.698 E.02016
G2 X136.207 Y109.941 I.033 J.911 E.02088
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.411 Y110.174 I-1.778 J-.886 E.02085
G2 X135.329 Y109.736 I-.942 J-.049 E.01447
G2 X134.974 Y109.054 I-3.867 J1.581 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00275
G1 X137.919 Y109.072 E.0183
G2 X142.966 Y112.189 I67.65 J-103.908 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.283 Y112.435 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.335 I-.29 J-.131 E.00308
G1 X147.31 Y108.21 E.12287
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.523 I.008 J1.714 E.0805
G1 X108.21 Y114.523 E.13642
G1 X108.21 Y109.653 E.14506
G2 X109.734 Y108.21 I-.966 J-2.547 E.06417
G1 X137.731 Y108.21 E.83394
G1 X137.732 Y108.252 E.00126
G2 X137.811 Y108.41 I.27 J-.037 E.00533
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07455
G2 X147.254 Y112.487 I-.019 J-.318 E.00852
; WIPE_START
M204 S6000
G1 X147.31 Y112.335 E-.0615
G1 X147.31 Y110.497 E-.6985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.433 Y112.594 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132401
G1 F15000
M204 S6000
G1 X147.531 Y112.531 E.00082
G1 X147.55 Y112.357 E.00124
G1 X147.55 Y108.406 E.02793
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.037 Y112.026 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38039
G1 F8000.711
M204 S6000
G1 X141.975 Y112.026 E.025
G1 X141.189 Y111.552 E.02446
G1 X141.218 Y111.778 E.00608
G1 X141.014 Y111.898 E.00631
G1 X141.026 Y111.967 E.00186
M204 S10000
G1 X140.44 Y110.904 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100676
G1 F15000
M204 S6000
G1 X140.747 Y111.597 E.00346
M204 S10000
G1 X140.702 Y111.29 F42000
; LINE_WIDTH: 0.339156
G1 F9114.379
M204 S6000
G2 X139.999 Y110.806 I-3.918 J4.938 E.01998
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330762
G1 F9380.163
G1 X137.928 Y109.598 E.00458
; LINE_WIDTH: 0.300068
G1 F10499.824
G1 X137.729 Y109.569 E.00409
M204 S10000
G1 X137.663 Y109.51 F42000
; LINE_WIDTH: 0.157286
G1 F15000
M204 S6000
G1 X138.593 Y109.743 E.00866
; WIPE_START
G1 X137.663 Y109.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.225 Y112.594 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.140146
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00097
; LINE_WIDTH: 0.111327
G1 X135.081 Y112.386 E.00068
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.407 Y111.207 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.153967
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115939
G1 X135.153 Y111.003 E.00094
M204 S10000
G1 X135.628 Y110.247 F42000
; LINE_WIDTH: 0.117078
G1 F15000
M204 S6000
G1 X135.663 Y110.154 E.00058
G1 X135.635 Y110.012 E.00085
M204 S10000
G1 X135.719 Y109.545 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.524428
G1 F5607.388
M204 S6000
G1 X135.903 Y109.525 E.00706
G1 X135.973 Y109.565 E.00304
; LINE_WIDTH: 0.510185
G1 F5778.306
G1 X136.129 Y109.483 E.00652
; LINE_WIDTH: 0.477975
G1 F6206.112
G1 X136.285 Y109.4 E.00607
; LINE_WIDTH: 0.443235
G1 F6744.689
G1 X136.535 Y109.361 E.008
; LINE_WIDTH: 0.390046
G1 F7778.153
G1 X136.785 Y109.322 E.00694
G1 X137.323 Y109.322 E.01476
G1 X137.367 Y109.145 E.00502
G1 X137.422 Y109.107 E.00182
G1 X137.293 Y108.978 E.00502
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405965
G1 F7437.095
G1 X136.477 Y108.996 E.00883
; LINE_WIDTH: 0.443235
G1 F6744.689
G1 X136.17 Y109.015 E.00974
; LINE_WIDTH: 0.476643
G1 F6225.179
G1 X135.823 Y109.03 E.01188
; LINE_WIDTH: 0.514877
G1 F5720.869
G1 X135.477 Y109.045 E.01293
G1 X135.693 Y109.491 E.01847
; WIPE_START
G1 X135.477 Y109.045 E-.44701
G1 X135.823 Y109.03 E-.31299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.955 Y110.935 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G3 X132.436 Y109.486 I2.168 J-1.593 E.05019
G1 X132.448 Y109.42 E.00213
G1 X131.978 Y108.95 E.02138
G1 X131.698 Y108.95 E.00902
G1 X128.596 Y112.052 E.14105
G1 X127.404 Y112.052 E.03833
G1 X124.302 Y108.95 E.14107
G1 X124.022 Y108.95 E.00902
G1 X120.917 Y112.055 E.14118
G1 X119.731 Y112.055 E.03815
G1 X116.626 Y108.95 E.14119
G1 X116.346 Y108.95 E.00902
G1 X111.514 Y113.782 E.21974
G1 X108.95 Y113.782 E.08243
G1 X108.95 Y110.112 E.11803
G2 X109.623 Y109.623 I-1.76 J-3.127 E.0268
G1 X112.773 Y112.773 E.14324
; WIPE_START
G1 X111.358 Y111.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.398 Y117.87 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.131 E.16916
G1 X108.602 Y123.131 E.12206
G1 X108.602 Y117.87 E.16916
G1 X112.338 Y117.87 E.12013
M204 S10000
G1 X112.79 Y117.478 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.523 E.18005
G1 X108.21 Y123.523 E.13642
G1 X108.21 Y117.478 E.18005
G1 X112.73 Y117.478 E.13464
; WIPE_START
M204 S6000
G1 X112.75 Y119.478 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y118.255 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X110.542 Y118.218 E.05121
G1 X112.05 Y119.726 E.06855
G1 X112.05 Y120.922 E.03849
G1 X110.19 Y122.782 E.08458
G1 X108.95 Y122.782 E.03985
G1 X108.95 Y122.393 E.01251
; WIPE_START
G1 X108.95 Y122.782 E-.14779
G1 X110.19 Y122.782 E-.47097
G1 X110.453 Y122.52 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.899 Y130.132 Z2.2 F42000
G1 X109.63 Y133.821 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.624 Y133.839 E.00062
G2 X109.653 Y134.552 I.861 J.322 E.02357
G2 X109.879 Y134.97 I2.34 J-.998 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.514 J1.605 E.01714
G2 X108.602 Y134.839 I-.297 J.764 E.0232
G1 X108.602 Y126.87 E.25627
G1 X112.398 Y126.87 E.12206
G1 X112.398 Y133.246 E.20502
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.807 J.385 E.04503
G1 X110.041 Y133.356 E.03524
G2 X109.703 Y133.678 I.444 J.805 E.01518
G1 X109.657 Y133.768 E.00324
M204 S10000
G1 X109.99 Y133.979 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.494 J.181 E.01129
G1 X111.181 Y133.224 E.03158
G3 X111.39 Y133.176 I.223 J.489 E.00646
G3 X111.902 Y133.591 I-.011 J.536 E.02113
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.971 E.01776
G3 X110.846 Y135.019 I-.224 J-.485 E.00787
G3 X110.319 Y134.834 I.808 J-3.163 E.01667
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.972 Y134.037 I.469 J-.24 E.01114
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.10016
M73 P68 R4
G1 X110.232 Y133.699 E-.06577
G1 X111.181 Y133.224 E-.40291
G1 X111.259 Y133.194 E-.03211
G1 X111.39 Y133.176 E-.05024
G1 X111.539 Y133.193 E-.05695
G1 X111.662 Y133.254 E-.05186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.826 Y135.411 I.894 J-1.792 E.02101
G2 X111.264 Y135.328 I.049 J-.942 E.01447
G2 X111.946 Y134.973 I-1.578 J-3.862 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.514 J68.761 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.09313
G2 X109.35 Y140.503 I.278 J-.716 E.02542
G1 X109.682 Y140.167 E.01518
G1 X111.218 Y137.709 E.09321
G2 X111.302 Y137.423 I-.515 J-.307 E.00968
M73 P68 R3
G1 X111.302 Y136.796 E.02016
G2 X111.059 Y136.209 I-.855 J.01 E.02094
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.589 Y135.363 E-.16093
G1 X110.826 Y135.411 E-.0921
G1 X110.991 Y135.409 E-.06279
G1 X111.264 Y135.328 E-.10812
G1 X111.946 Y134.973 E-.29218
G1 X112.031 Y134.895 E-.04388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.196 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.698 Y140.196 I-.203 J-.242 E.01311
G1 X108.466 Y139.965 E.00975
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12088
G3 X108.466 Y135.538 I.26 J0 E.00609
G1 X108.798 Y135.207 E.01397
G3 X108.945 Y135.129 I.197 J.195 E.00502
G3 X109.19 Y135.183 I.056 J.327 E.00766
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.39 E.01713
G3 X110.871 Y137.525 I-.281 J-.01 E.00421
G1 X109.372 Y139.923 E.08423
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.015 Y140.251 E-.06218
G1 X108.935 Y140.269 E-.03106
G1 X108.786 Y140.251 E-.05716
G1 X108.698 Y140.196 E-.03946
G1 X108.466 Y139.965 E-.12437
G1 X108.41 Y139.88 E-.03851
G1 X108.39 Y139.781 E-.03861
G1 X108.39 Y138.81 E-.36866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.544 Y146.441 Z2.2 F42000
G1 X108.561 Y147.261 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.154 J-.296 E.00376
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.478 E.63481
G1 X112.79 Y126.478 E.13642
G1 X112.79 Y138.228 E.34998
G2 X112.619 Y138.305 I.044 J.326 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.028 E.00278
G1 X108.383 Y147.01 E.05901
G2 X108.511 Y147.229 I.331 J-.045 E.00776
M204 S10000
G1 X108.406 Y147.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134426
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00066
; LINE_WIDTH: 0.169043
G2 X108.559 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138385
G1 X112.594 Y147.549 E.03043
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54734
G1 F5352.682
M204 S6000
G1 X109.709 Y140.789 E.00717
G1 X109.38 Y141.023 E.01608
G1 X109.058 Y141.087 E.01308
G1 X109.058 Y142.216 E.04497
G1 X109.83 Y140.936 E.05955
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626235
G1 F4628.722
M204 S6000
G1 X111.514 Y138.18 E.12508
; WIPE_START
G1 X110.447 Y139.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.988 Y135.635 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.11743
G1 F15000
M204 S6000
G1 X110.844 Y135.663 E.00086
G1 X110.75 Y135.627 E.00059
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114039
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148271
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.955 Y135.477 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519597
G1 F5664.222
M204 S6000
G1 X111.455 Y135.718 E.02091
G1 X111.468 Y135.924 E.00778
G1 X111.424 Y135.964 E.00222
G1 X111.529 Y136.116 E.00697
; LINE_WIDTH: 0.480702
G1 F6167.457
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.446365
G1 F6692.362
G1 X111.621 Y136.448 E.00549
; LINE_WIDTH: 0.399858
G1 F7564.35
G1 X111.667 Y136.614 E.00485
G1 X111.678 Y137.435 E.02316
G1 X111.637 Y137.716 E.00801
G1 X111.605 Y137.781 E.00203
G1 X111.873 Y137.95 E.00894
G1 X112.012 Y137.812 E.00553
G1 X112.018 Y136.611 E.03387
; LINE_WIDTH: 0.412029
G1 F7314.926
G1 X112.001 Y136.417 E.00568
; LINE_WIDTH: 0.446365
G1 F6692.362
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480702
G1 F6167.457
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.509425
G1 F5787.719
G1 X111.957 Y135.537 E.01815
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.238 Y127.218 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X111.866 Y127.218 E.05236
G1 X112.05 Y127.402 E.00833
G1 X112.05 Y128.598 E.03849
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
G3 X111.282 Y132.436 I2.086 J3.037 E.04615
G1 X111.477 Y132.436 E.00626
; WIPE_START
G1 X111.282 Y132.436 E-.07399
G1 X110.88 Y132.547 E-.15856
G1 X109.973 Y133.001 E-.38553
G1 X109.709 Y132.737 E-.14191
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.413 Y140.258 Z2.2 F42000
G1 X108.406 Y140.299 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0982146
G1 F15000
M204 S6000
G2 X108.586 Y140.383 I.575 J-.993 E.00087
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.299 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/25
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z2.2 I.948 J.764 P1  F42000
G1 X133.182 Y109.554 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.514 J.053 E.02201
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01777
G3 X135.019 Y110.156 I-.483 J.223 E.00794
G3 X134.835 Y110.681 I-3.206 J-.827 E.0166
G3 X134.401 Y110.985 I-.736 J-.59 E.01599
G3 X133.699 Y110.768 I-.239 J-.469 E.02421
G1 X133.225 Y109.819 E.03158
G3 X133.179 Y109.614 I.471 J-.213 E.00631
M204 S10000
G1 X132.79 Y109.486 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.785 Y109.518 E.00104
G2 X132.866 Y109.978 I.891 J.08 E.01522
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.991 J-2.324 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.59 J1.501 E.01704
G2 X134.833 Y112.398 I.777 J.302 E.02316
G1 X114.487 Y112.398 E.65426
G2 X112.447 Y114.025 I.021 J2.119 E.09036
G1 X108.602 Y114.025 E.12365
G1 X108.602 Y109.911 E.13228
G2 X109.974 Y108.602 I-1.413 J-2.855 E.06191
G1 X133.246 Y108.602 E.74836
G1 X133.291 Y108.79 E.00622
G2 X132.815 Y109.353 I.385 J.807 E.02443
G1 X132.801 Y109.427 E.0024
; WIPE_START
G1 X132.785 Y109.518 E-.03508
G1 X132.785 Y109.685 E-.06349
G1 X132.816 Y109.849 E-.06345
G1 X132.866 Y109.978 E-.05282
G1 X133.356 Y110.959 E-.4166
G1 X133.427 Y111.074 E-.05128
G1 X133.536 Y111.194 E-.06159
G1 X133.568 Y111.219 E-.01569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.129 Y111.943 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.314 J.049 E.00428
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.358 J.378 E.01131
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.217 Y111.924 E.0122
G3 X140.217 Y112.276 I-.28 J.176 E.01105
G1 X139.964 Y112.533 E.01076
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.731 Y112.61 E.12058
G3 X135.567 Y112.561 I-.002 J-.294 E.00516
G1 X135.206 Y112.203 E.01518
G3 X135.125 Y112.003 I.237 J-.211 E.00654
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07618
G1 X136.243 Y110.46 E-.65246
G1 X136.301 Y110.402 E-.03136
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.737 J-.284 E.02356
G1 X140.175 Y111.325 E.01675
G1 X137.72 Y109.79 E.09311
G2 X137.427 Y109.698 I-.306 J.464 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.034 J.912 E.02088
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.411 Y110.177 I-1.781 J-.887 E.02075
G2 X135.329 Y109.736 I-.939 J-.054 E.01457
G2 X134.974 Y109.054 I-3.863 J1.579 E.02476
G2 X134.648 Y108.79 I-.756 J.603 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.918 Y109.072 E.01829
G2 X142.966 Y112.189 I67.651 J-103.909 E.19077
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.28 Y112.443 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.335 I-.285 J-.138 E.00335
G1 X147.31 Y108.21 E.12287
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.793 Y114.417 I.02 J1.724 E.07719
G1 X108.21 Y114.417 E.13653
G1 X108.21 Y109.653 E.1419
G2 X109.734 Y108.21 I-.966 J-2.547 E.06417
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.764 E.01494
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07455
G2 X147.249 Y112.494 I-.017 J-.316 E.00826
; WIPE_START
M204 S6000
G1 X147.31 Y112.335 E-.06489
G1 X147.31 Y110.506 E-.69511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.437 Y112.594 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131835
G1 F15000
M204 S6000
G2 X147.531 Y112.531 I-.27 J-.506 E.0008
G1 X147.55 Y112.357 E.00123
G1 X147.55 Y108.406 E.02775
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.702 Y111.29 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.339189
G1 F9113.358
M204 S6000
G2 X139.999 Y110.806 I-3.919 J4.938 E.01999
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330777
G1 F9379.668
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300073
G1 F10499.617
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168797
G1 F15000
M204 S6000
G1 X138.62 Y109.759 E.00973
M204 S10000
G1 X140.442 Y110.905 F42000
; LINE_WIDTH: 0.100746
G1 F15000
M204 S6000
G1 X140.748 Y111.597 E.00346
M204 S10000
G1 X141.014 Y112.026 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38029
G1 F8003.084
M204 S6000
G1 X141.975 Y112.026 E.02562
G1 X141.189 Y111.552 E.02446
G1 X141.218 Y111.779 E.00609
G1 X140.999 Y111.904 E.00672
G1 X141.007 Y111.966 E.00168
; WIPE_START
G1 X140.999 Y111.904 E-.02391
G1 X141.218 Y111.779 E-.09586
G1 X141.189 Y111.552 E-.08689
G1 X141.975 Y112.026 E-.34882
G1 X141.437 Y112.026 E-.20452
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P69 R3
G1 X135.628 Y110.247 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.117089
G1 F15000
M204 S6000
G1 X135.663 Y110.155 E.00058
G1 X135.635 Y110.013 E.00085
M204 S10000
G1 X135.719 Y109.545 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.524709
G1 F5604.113
M204 S6000
G1 X135.903 Y109.526 E.00705
G1 X135.972 Y109.565 E.00303
; LINE_WIDTH: 0.510333
G1 F5776.482
G1 X136.129 Y109.483 E.00653
; LINE_WIDTH: 0.477958
G1 F6206.362
G1 X136.285 Y109.4 E.00608
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390025
G1 F7778.631
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.137 E.00525
G1 X137.427 Y109.112 E.00138
G1 X137.293 Y108.978 E.00519
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.40594
G1 F7437.607
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.476663
G1 F6224.891
G1 X135.824 Y109.03 E.01188
; LINE_WIDTH: 0.515208
G1 F5716.851
G1 X135.477 Y109.045 E.01294
G1 X135.693 Y109.491 E.01849
; WIPE_START
G1 X135.477 Y109.045 E-.44707
G1 X135.824 Y109.03 E-.31293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.153 Y111.003 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.115954
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.154011
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.668 Y111.669 Z2.4 F42000
G1 X112.773 Y112.773 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.623 Y109.623 E.14324
G3 X108.95 Y110.112 I-2.425 J-2.627 E.0268
G1 X108.95 Y113.676 E.11462
G1 X111.62 Y113.676 E.08584
G1 X116.346 Y108.95 E.21492
G1 X116.626 Y108.95 E.00902
G1 X119.731 Y112.055 E.1412
G1 X120.917 Y112.055 E.03815
G1 X124.022 Y108.95 E.14118
G1 X124.302 Y108.95 E.00902
G1 X127.404 Y112.052 E.14107
G1 X128.596 Y112.052 E.03833
G1 X131.698 Y108.95 E.14105
G1 X131.978 Y108.95 E.00902
G1 X132.448 Y109.42 E.02138
G2 X132.547 Y110.12 I1.907 J.087 E.02284
G1 X132.955 Y110.935 E.02931
; WIPE_START
G1 X132.547 Y110.12 E-.34631
G1 X132.437 Y109.718 E-.15848
G1 X132.448 Y109.42 E-.11296
G1 X132.184 Y109.156 E-.14225
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.212 Y112.263 Z2.4 F42000
G1 X112.398 Y117.976 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.025 E.16234
G1 X108.602 Y123.025 E.12206
G1 X108.602 Y117.976 E.16234
G1 X112.338 Y117.976 E.12013
M204 S10000
G1 X112.79 Y117.584 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.417 E.17374
G1 X108.21 Y123.417 E.13642
G1 X108.21 Y117.584 E.17374
G1 X112.73 Y117.584 E.13464
; WIPE_START
M204 S6000
G1 X112.751 Y119.584 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y122.394 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y122.676 E.0091
G1 X110.296 Y122.676 E.04327
G1 X112.05 Y120.922 E.07976
G1 X112.05 Y119.726 E.03849
G1 X110.648 Y118.324 E.06373
G1 X109.02 Y118.324 E.05236
; WIPE_START
G1 X110.648 Y118.324 E-.61876
G1 X110.911 Y118.587 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.269 Y126.192 Z2.4 F42000
G1 X109.624 Y133.832 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.587 Y133.963 E.00441
G2 X109.653 Y134.552 I.898 J.198 E.0194
G2 X109.879 Y134.97 I2.335 J-.996 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.517 J1.608 E.01714
G2 X108.602 Y134.839 I-.297 J.767 E.02319
G1 X108.602 Y126.976 E.25283
G1 X112.398 Y126.976 E.12206
G1 X112.398 Y133.246 E.20161
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.807 J.385 E.04503
G1 X110.041 Y133.356 E.03524
G2 X109.65 Y133.777 I.444 J.805 E.01881
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.393 Y133.176 I.222 J.487 E.00652
G3 X111.902 Y133.591 I-.013 J.536 E.02106
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01608
G1 X111.103 Y134.971 E.01776
G3 X110.844 Y135.018 I-.223 J-.483 E.00794
G3 X110.319 Y134.834 I.827 J-3.207 E.0166
G3 X110.015 Y134.4 I.59 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01182
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09159
G1 X110.232 Y133.699 E-.06579
G1 X111.181 Y133.224 E-.40291
G1 X111.259 Y133.194 E-.03213
G1 X111.393 Y133.176 E-.05109
G1 X111.539 Y133.193 E-.05607
G1 X111.682 Y133.264 E-.06042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.823 Y135.411 I.895 J-1.795 E.02091
G2 X111.264 Y135.328 I.053 J-.939 E.01457
G2 X111.946 Y134.973 I-1.575 J-3.856 E.02476
G2 X112.21 Y134.647 I-.601 J-.755 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.518 J68.763 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.611 E.09313
G2 X109.35 Y140.503 I.279 J-.715 E.02542
G1 X109.681 Y140.167 E.01518
G1 X111.225 Y137.697 E.09365
G2 X111.302 Y137.401 I-.477 J-.282 E.00999
G2 X111.288 Y136.649 I-3.828 J-.302 E.02421
G2 X111.059 Y136.209 I-.964 J.221 E.01614
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.589 Y135.363 E-.16092
G1 X110.823 Y135.411 E-.09092
G1 X110.99 Y135.409 E-.06358
G1 X111.264 Y135.328 E-.1085
G1 X111.946 Y134.973 E-.29217
G1 X112.031 Y134.895 E-.04392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.196 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.697 Y140.196 I-.203 J-.242 E.01312
G1 X108.466 Y139.965 E.00975
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.946 Y135.129 I.196 J.194 E.00508
G3 X109.19 Y135.183 I.054 J.327 E.00761
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.901 Y136.726 I-.416 J.38 E.00863
G3 X110.91 Y137.382 I-3.335 J.373 E.01959
G3 X110.873 Y137.52 I-.258 J.005 E.00431
G1 X109.372 Y139.923 E.08438
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.015 Y140.251 E-.06213
G1 X108.935 Y140.269 E-.03106
G1 X108.785 Y140.251 E-.05724
G1 X108.697 Y140.196 E-.03946
G1 X108.466 Y139.965 E-.12433
G1 X108.41 Y139.88 E-.03855
G1 X108.39 Y139.781 E-.03852
G1 X108.39 Y138.81 E-.36872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.536 Y146.441 Z2.4 F42000
G1 X108.551 Y147.265 Z2.4
G1 Z2
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.136 J-.272 E.004
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.584 E.63166
G1 X112.79 Y126.584 E.13642
G1 X112.79 Y138.227 E.34682
G2 X112.619 Y138.305 I.047 J.33 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.5 Y147.233 I.304 J-.005 E.00808
M204 S10000
G1 X108.406 Y147.51 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171716
G1 F15000
M204 S6000
G1 X108.56 Y147.537 E.00159
; LINE_WIDTH: 0.138384
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54737
G1 F5352.365
M204 S6000
G1 X109.709 Y140.789 E.00717
G1 X109.38 Y141.023 E.01608
G1 X109.058 Y141.087 E.01309
G1 X109.058 Y142.216 E.04497
G1 X109.83 Y140.936 E.05955
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626285
G1 F4628.321
M204 S6000
G1 X111.517 Y138.174 E.12537
; WIPE_START
G1 X110.45 Y139.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.987 Y135.635 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.117473
G1 F15000
M204 S6000
G1 X110.844 Y135.663 E.00086
G1 X110.75 Y135.627 E.00059
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114042
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148274
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.955 Y135.477 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.520858
G1 F5649.269
M204 S6000
G1 X111.455 Y135.718 E.02097
G1 X111.468 Y135.924 E.00778
G1 X111.424 Y135.964 E.00222
G1 X111.524 Y136.093 E.00619
; LINE_WIDTH: 0.48894
G1 F6053.54
G1 X111.57 Y136.227 E.00499
; LINE_WIDTH: 0.45078
G1 F6619.919
G1 X111.615 Y136.361 E.00456
; LINE_WIDTH: 0.39874
G1 F7588.108
G1 X111.678 Y136.791 E.01219
G1 X111.668 Y137.574 E.02203
G1 X111.603 Y137.773 E.00588
G1 X111.878 Y137.947 E.00915
G1 X112.013 Y137.812 E.00536
G1 X112.022 Y136.793 E.02863
; LINE_WIDTH: 0.403378
G1 F7490.482
G1 X112.006 Y136.501 E.00834
; LINE_WIDTH: 0.435613
G1 F6875.609
G1 X111.99 Y136.208 E.00909
; LINE_WIDTH: 0.469113
G1 F6335.165
G1 X111.974 Y135.873 E.01132
; LINE_WIDTH: 0.503878
G1 F5857.373
G1 X111.958 Y135.537 E.01224
; WIPE_START
G1 X111.974 Y135.873 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.696 Y127.324 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X112.05 Y127.324 E.01139
G1 X112.05 Y128.598 E.04097
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
M73 P70 R3
G3 X111.283 Y132.436 I2.086 J3.038 E.04616
G1 X111.477 Y132.436 E.00626
; WIPE_START
G1 X111.283 Y132.436 E-.07395
G1 X110.88 Y132.547 E-.15862
G1 X109.973 Y133.001 E-.38553
G1 X109.709 Y132.737 E-.14191
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.413 Y140.258 Z2.4 F42000
G1 X108.406 Y140.299 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.098165
G1 F15000
M204 S6000
G2 X108.585 Y140.383 I.696 J-1.246 E.00087
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.299 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/25
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z2.4 I.948 J.762 P1  F42000
G1 X133.196 Y109.461 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.492 J.14 E.01934
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.513 J.233 E.00724
G3 X134.835 Y110.681 I-2.862 J-.666 E.01729
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.233 J-.489 E.02404
G1 X133.225 Y109.819 E.03158
G3 X133.183 Y109.52 I.463 J-.218 E.00915
M204 S10000
G1 X132.827 Y109.323 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.819 Y109.354 E.00103
G2 X132.866 Y109.979 I.869 J.248 E.02055
G1 X133.356 Y110.959 E.03524
G2 X134.553 Y111.347 I.804 J-.441 E.04457
G2 X134.966 Y111.123 I-.987 J-2.318 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.589 J1.5 E.01705
G2 X134.847 Y112.398 I.692 J.294 E.02337
G1 X114.487 Y112.398 E.65471
G2 X112.47 Y113.953 I.036 J2.133 E.08774
G1 X108.602 Y113.953 E.12438
G1 X108.602 Y109.911 E.12996
G2 X109.974 Y108.602 I-1.413 J-2.854 E.06191
G1 X133.246 Y108.602 E.74836
G1 X133.291 Y108.79 E.00622
G2 X132.879 Y109.199 I.397 J.812 E.019
G1 X132.85 Y109.268 E.0024
; WIPE_START
G1 X132.819 Y109.354 E-.03493
G1 X132.785 Y109.518 E-.06332
G1 X132.785 Y109.685 E-.06349
G1 X132.816 Y109.849 E-.0635
G1 X132.866 Y109.979 E-.05288
G1 X133.356 Y110.959 E-.41648
G1 X133.427 Y111.074 E-.05133
G1 X133.452 Y111.101 E-.01408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.811 I.337 J.053 E.00403
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.42 J.528 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.217 Y111.924 E.01221
G3 X140.226 Y112.267 I-.345 J.18 E.01059
G1 X139.964 Y112.533 E.01113
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.721 Y112.61 E.12089
G3 X135.56 Y112.554 I.012 J-.293 E.00515
G1 X135.206 Y112.203 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00667
; WIPE_START
M204 S6000
G1 X135.182 Y111.811 E-.07299
G1 X136.243 Y110.46 E-.65247
G1 X136.307 Y110.396 E-.03454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.595 Y112.398 E.07628
G2 X140.542 Y111.695 I-.665 J-.303 E.02367
G1 X140.175 Y111.325 E.01676
G1 X137.72 Y109.79 E.09311
G2 X137.428 Y109.698 I-.306 J.463 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.759 J-.879 E.0218
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.864 J1.58 E.02476
G2 X134.648 Y108.791 I-.754 J.601 E.01358
G1 X134.692 Y108.602 E.00623
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.919 Y109.072 E.0183
G2 X142.966 Y112.189 I67.644 J-103.896 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.275 Y112.457 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.271 J-.142 E.00416
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.797 Y114.345 I.021 J1.728 E.07505
G1 X108.21 Y114.345 E.13664
G1 X108.21 Y109.653 E.13976
G2 X109.734 Y108.21 I-.966 J-2.547 E.06417
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07455
G2 X147.242 Y112.508 I-.008 J-.306 E.00789
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07465
G1 X147.31 Y110.52 E-.68535
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.518 Y112.594 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13204
G1 F15000
M204 S6000
G1 X147.55 Y112.334 E.00184
G1 X147.55 Y108.406 E.02765
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.014 Y112.026 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38046
G1 F7999.051
M204 S6000
G1 X141.975 Y112.026 E.02562
G1 X141.189 Y111.552 E.02446
G1 X141.218 Y111.778 E.00607
G1 X140.999 Y111.903 E.00671
G1 X141.007 Y111.966 E.0017
M204 S10000
G1 X140.44 Y110.904 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100464
G1 F15000
M204 S6000
G1 X140.747 Y111.596 E.00344
M204 S10000
G1 X140.702 Y111.29 F42000
; LINE_WIDTH: 0.339163
G1 F9114.139
M204 S6000
G2 X139.999 Y110.806 I-3.918 J4.937 E.01998
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330781
G1 F9379.545
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300127
G1 F10497.39
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168797
G1 F15000
M204 S6000
G1 X138.617 Y109.758 E.0097
; WIPE_START
G1 X137.674 Y109.511 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.225 Y112.594 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.140155
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00097
; LINE_WIDTH: 0.111331
G1 X135.081 Y112.386 E.00068
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.407 Y111.207 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.153957
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115935
G1 X135.153 Y111.003 E.00094
M204 S10000
G1 X135.628 Y110.247 F42000
; LINE_WIDTH: 0.124574
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00065
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521706
G1 F5639.273
M204 S6000
G1 X135.906 Y109.521 E.00727
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.50841
G1 F5800.34
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.47729
G1 F6215.899
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.44313
G1 F6746.458
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390023
G1 F7778.687
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.138 E.00523
G1 X137.427 Y109.112 E.0014
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.40593
G1 F7437.812
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.44313
G1 F6746.458
G1 X136.171 Y109.015 E.00972
; LINE_WIDTH: 0.475673
G1 F6239.132
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511733
G1 F5759.231
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.01829
; WIPE_START
G1 X135.474 Y109.043 E-.44562
G1 X135.822 Y109.029 E-.31438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.955 Y110.935 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G3 X132.436 Y109.486 I2.167 J-1.593 E.05019
G1 X132.448 Y109.42 E.00213
G1 X131.978 Y108.95 E.02138
G1 X131.698 Y108.95 E.00902
G1 X128.596 Y112.052 E.14105
G1 X127.404 Y112.052 E.03833
G1 X124.302 Y108.95 E.14107
G1 X124.022 Y108.95 E.00902
G1 X120.917 Y112.055 E.14118
G1 X119.731 Y112.055 E.03815
G1 X116.626 Y108.95 E.14119
G1 X116.346 Y108.95 E.00902
G1 X111.692 Y113.604 E.21164
G1 X108.95 Y113.604 E.08816
G1 X108.95 Y110.112 E.1123
G2 X109.623 Y109.623 I-1.744 J-3.105 E.0268
G1 X112.773 Y112.773 E.14324
; WIPE_START
G1 X111.358 Y111.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.398 Y118.046 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y122.953 E.15777
G1 X108.602 Y122.953 E.12206
G1 X108.602 Y118.046 E.15777
G1 X112.338 Y118.046 E.12013
M204 S10000
G1 X112.79 Y117.654 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.345 E.1695
G1 X108.21 Y123.345 E.13642
G1 X108.21 Y117.654 E.1695
G1 X112.73 Y117.654 E.13464
; WIPE_START
M204 S6000
G1 X112.751 Y119.654 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.09 Y118.394 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X110.719 Y118.394 E.05236
G1 X112.05 Y119.726 E.06053
G1 X112.05 Y120.922 E.03849
G1 X110.368 Y122.604 E.07648
G1 X108.95 Y122.604 E.04558
G1 X108.95 Y122.393 E.00678
; WIPE_START
G1 X108.95 Y122.604 E-.0801
G1 X110.368 Y122.604 E-.53866
G1 X110.631 Y122.341 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.965 Y129.945 Z2.6 F42000
G1 X109.624 Y133.832 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.587 Y133.964 E.00441
G2 X109.653 Y134.552 I.898 J.197 E.01938
G2 X109.879 Y134.97 I2.342 J-.999 E.0153
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.791 I-1.506 J1.594 E.01715
M73 P71 R3
G2 X108.602 Y134.838 I-.298 J.769 E.02317
G1 X108.602 Y127.046 E.25055
G1 X112.398 Y127.046 E.12206
G1 X112.398 Y133.246 E.19935
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.807 J.385 E.04503
G1 X110.041 Y133.356 E.03525
G2 X109.65 Y133.777 I.444 J.805 E.01882
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.395 Y133.176 I.222 J.486 E.00659
G3 X111.902 Y133.591 I-.015 J.536 E.02099
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.971 E.01776
G3 X110.868 Y135.021 I-.233 J-.513 E.00724
G3 X110.319 Y134.834 I.667 J-2.863 E.01729
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.239 E.01182
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09158
G1 X110.232 Y133.699 E-.0658
G1 X111.181 Y133.224 E-.40291
G1 X111.259 Y133.194 E-.03212
G1 X111.395 Y133.176 E-.05195
G1 X111.539 Y133.193 E-.05522
G1 X111.682 Y133.264 E-.06042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.855 Y135.414 I.886 J-1.772 E.02196
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.575 J-3.856 E.02476
G2 X112.21 Y134.647 I-.602 J-.755 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.526 J68.768 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.602 E.09343
G2 X109.374 Y140.479 I.29 J-.664 E.02657
G1 X109.681 Y140.167 E.01407
G1 X111.225 Y137.697 E.09366
G2 X111.302 Y137.401 I-.478 J-.282 E.00998
G2 X111.288 Y136.649 I-3.822 J-.302 E.02421
G2 X111.059 Y136.209 I-.963 J.221 E.01613
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.16091
G1 X110.855 Y135.414 E-.10327
G1 X111.004 Y135.406 E-.05651
G1 X111.264 Y135.328 E-.10323
G1 X111.946 Y134.973 E-.2922
G1 X112.031 Y134.895 E-.04389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.112 Y140.187 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.695 Y140.194 I-.212 J-.258 E.01338
G1 X108.466 Y139.965 E.00965
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.948 Y135.129 I.195 J.193 E.00513
G3 X109.189 Y135.183 I.053 J.328 E.00755
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.528 J.419 E.0112
G1 X110.91 Y137.382 E.01689
G3 X110.873 Y137.52 I-.258 J.005 E.00431
G1 X109.372 Y139.923 E.08438
G1 X109.154 Y140.144 E.00927
; WIPE_START
M204 S6000
G1 X109.003 Y140.254 E-.07086
G1 X108.935 Y140.269 E-.02647
G1 X108.858 Y140.269 E-.02923
G1 X108.768 Y140.242 E-.03574
G1 X108.695 Y140.194 E-.03317
G1 X108.466 Y139.965 E-.12313
G1 X108.41 Y139.88 E-.03858
G1 X108.39 Y139.781 E-.03854
G1 X108.39 Y138.822 E-.36426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.541 Y146.453 Z2.6 F42000
G1 X108.557 Y147.268 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.669 Y147.297 I.132 J-.276 E.00346
G1 X112.79 Y147.309 E.12275
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.654 E.62956
G1 X112.79 Y126.654 E.13642
G1 X112.79 Y138.227 E.34472
G2 X112.619 Y138.305 I.049 J.335 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y147.007 E.05892
G2 X108.506 Y147.237 I.305 J-.015 E.00802
M204 S10000
G1 X108.406 Y147.422 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.131666
G1 F15000
M204 S6000
G1 X108.457 Y147.501 E.00066
; LINE_WIDTH: 0.139268
G1 X108.475 Y147.525 E.00023
G2 X108.646 Y147.543 I.252 J-1.502 E.00131
G1 X112.594 Y147.549 E.03005
; WIPE_START
G1 X110.594 Y147.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54682
G1 F5358.206
M204 S6000
G1 X109.73 Y140.802 E.00615
G1 X109.255 Y141.066 E.02163
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05953
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626276
G1 F4628.396
M204 S6000
G1 X111.518 Y138.174 E.12538
; WIPE_START
G1 X110.451 Y139.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.123143
G1 F15000
M204 S6000
G1 X110.777 Y135.673 E.00137
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114046
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148292
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517153
G1 F5693.413
M204 S6000
G1 X111.458 Y135.715 E.02077
G1 X111.471 Y135.936 E.00831
G1 X111.429 Y135.972 E.00206
G1 X111.524 Y136.093 E.00578
; LINE_WIDTH: 0.488933
G1 F6053.642
G1 X111.57 Y136.227 E.00499
; LINE_WIDTH: 0.450778
G1 F6619.959
G1 X111.615 Y136.361 E.00456
; LINE_WIDTH: 0.39874
G1 F7588.105
G1 X111.678 Y136.791 E.01219
G1 X111.668 Y137.574 E.02203
G1 X111.603 Y137.773 E.00588
G1 X111.878 Y137.946 E.00915
G1 X112.013 Y137.812 E.00535
G1 X112.022 Y136.793 E.02863
; LINE_WIDTH: 0.40338
G1 F7490.429
G1 X112.006 Y136.501 E.00834
; LINE_WIDTH: 0.43562
G1 F6875.477
G1 X111.99 Y136.208 E.00909
; LINE_WIDTH: 0.468045
G1 F6351.073
G1 X111.975 Y135.871 E.01135
; LINE_WIDTH: 0.500655
G1 F5898.61
G1 X111.96 Y135.533 E.01222
; WIPE_START
G1 X111.975 Y135.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.477 Y132.436 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.88 Y132.547 I-.062 J1.327 E.0197
G1 X109.973 Y133.001 E.03263
G1 X108.95 Y131.978 E.0465
G1 X108.95 Y131.698 E.00902
G1 X112.05 Y128.598 E.14095
G1 X112.05 Y127.394 E.03871
G1 X111.625 Y127.394 E.01365
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6632.609
G1 X112.05 Y127.394 E-.16127
G1 X112.05 Y128.598 E-.45749
G1 X111.787 Y128.861 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/25
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z2.6 I.818 J.901 P1  F42000
G1 X133.23 Y109.374 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.458 J.228 E.01654
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.513 J.233 E.00724
G3 X134.835 Y110.681 I-1.941 J-.354 E.01733
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.233 J-.489 E.02404
G1 X133.225 Y109.819 E.03158
G3 X133.206 Y109.429 I.463 J-.218 E.01195
M204 S10000
G1 X132.864 Y109.228 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.819 Y109.354 E.00432
G2 X132.866 Y109.978 I.869 J.248 E.02055
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.804 J-.441 E.04456
G2 X134.967 Y111.123 I-.991 J-2.325 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.777 Y111.721 I1.674 J1.567 E.01779
G2 X134.847 Y112.398 I.764 J.263 E.02258
G1 X114.487 Y112.398 E.65471
G2 X112.483 Y113.913 I.017 J2.106 E.08656
G1 X108.602 Y113.913 E.12478
G1 X108.602 Y109.911 E.12868
G2 X109.974 Y108.602 I-1.412 J-2.853 E.06191
G1 X133.246 Y108.602 E.74836
G1 X133.291 Y108.79 E.00622
G2 X132.891 Y109.175 I.397 J.812 E.01811
; WIPE_START
G1 X132.819 Y109.354 E-.07373
G1 X132.785 Y109.518 E-.06334
G1 X132.785 Y109.685 E-.06347
G1 X132.816 Y109.849 E-.06347
G1 X132.866 Y109.978 E-.05287
G1 X133.356 Y110.959 E-.41655
G1 X133.393 Y111.018 E-.02658
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.149 Y111.872 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.296 J.119 E.00209
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.358 J.38 E.0113
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.258 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.223 Y111.929 E.01243
G3 X140.217 Y112.276 I-.28 J.169 E.01087
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.731 Y112.61 E.12058
G3 X135.567 Y112.561 I-.002 J-.293 E.00517
G1 X135.206 Y112.203 E.01517
G3 X135.132 Y111.93 I.239 J-.211 E.00872
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.04921
G1 X136.243 Y110.46 E-.65244
G1 X136.351 Y110.352 E-.05835
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.557 Y111.71 I-.797 J-.285 E.02285
G1 X140.175 Y111.325 E.01746
G1 X137.72 Y109.79 E.0931
G2 X137.427 Y109.698 I-.306 J.463 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.035 J.914 E.02088
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.912 J-.924 E.02178
G2 X135.329 Y109.736 I-.988 J-.006 E.01353
G2 X134.974 Y109.054 I-3.873 J1.584 E.02476
G2 X134.647 Y108.79 I-.756 J.603 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.918 Y109.072 E.0183
G2 X142.966 Y112.189 I67.66 J-103.924 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.28 Y112.446 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.277 J-.132 E.0038
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.802 Y114.305 I.008 J1.712 E.07399
G1 X108.21 Y114.305 E.13679
G1 X108.21 Y109.653 E.13857
G2 X109.734 Y108.21 I-.966 J-2.547 E.06417
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07456
G2 X147.249 Y112.498 I-.008 J-.306 E.00825
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07026
G1 X147.31 Y110.508 E-.68974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131754
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.552 J-.957 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02757
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.905 Y111.45 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.428711
G1 F6998.612
M204 S6000
G1 X140.74 Y111.32 E.00642
; LINE_WIDTH: 0.393709
G1 F7696.945
G1 X140.574 Y111.19 E.00584
; LINE_WIDTH: 0.338522
G1 F9133.908
G2 X139.999 Y110.806 I-3.97 J5.327 E.01615
G1 X138.128 Y109.626 E.05166
; LINE_WIDTH: 0.33077
G1 F9379.909
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.30007
G1 F10499.719
G1 X137.736 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.16885
G1 F15000
M204 S6000
G1 X138.618 Y109.758 E.00971
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521715
G1 F5639.155
M204 S6000
G1 X135.906 Y109.521 E.00727
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508428
G1 F5800.121
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477323
M73 P72 R3
G1 F6215.433
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390025
G1 F7778.637
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.138 E.00523
G1 X137.427 Y109.112 E.00139
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.40594
G1 F7437.607
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.475705
G1 F6238.664
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511747
G1 F5759.055
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.01829
M204 S10000
G1 X135.634 Y110.011 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124571
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00095
G1 X135.628 Y110.248 E.00065
M204 S10000
G1 X135.153 Y111.003 F42000
; LINE_WIDTH: 0.115928
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.15394
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.111328
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140138
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.032 Y112.017 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39702
G1 F7624.965
M204 S6000
G1 X141.945 Y112.017 E.02553
G1 X141.265 Y111.608 E.0222
G1 X141.026 Y111.958 E.01185
; WIPE_START
G1 X141.265 Y111.608 E-.16104
G1 X141.945 Y112.017 E-.30153
G1 X141.162 Y112.017 E-.29743
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.532 Y112.22 Z2.8 F42000
G1 X112.773 Y112.773 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.623 Y109.623 E.14324
G3 X108.95 Y110.112 I-2.412 J-2.609 E.0268
G1 X108.95 Y113.565 E.11103
G1 X111.732 Y113.565 E.08944
G1 X116.346 Y108.95 E.20984
G1 X116.626 Y108.95 E.00902
G1 X119.731 Y112.055 E.1412
G1 X120.917 Y112.055 E.03815
G1 X124.022 Y108.95 E.14118
G1 X124.302 Y108.95 E.00902
G1 X127.404 Y112.052 E.14107
G1 X128.596 Y112.052 E.03833
G1 X131.698 Y108.95 E.14105
G1 X131.978 Y108.95 E.00902
G1 X132.448 Y109.42 E.02138
G2 X132.547 Y110.12 I1.908 J.086 E.02284
G1 X132.955 Y110.935 E.0293
; WIPE_START
G1 X132.547 Y110.12 E-.34626
G1 X132.437 Y109.717 E-.15858
G1 X132.448 Y109.42 E-.11292
G1 X132.184 Y109.156 E-.14224
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.227 Y112.296 Z2.8 F42000
G1 X112.398 Y118.089 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y122.913 E.15513
G1 X108.602 Y122.913 E.12206
G1 X108.602 Y118.089 E.15513
G1 X112.338 Y118.089 E.12013
M204 S10000
G1 X112.79 Y117.697 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.305 E.16705
G1 X108.21 Y123.305 E.13642
G1 X108.21 Y117.697 E.16705
G1 X112.73 Y117.697 E.13464
; WIPE_START
M204 S6000
G1 X112.751 Y119.696 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y122.393 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y122.565 E.0055
G1 X110.408 Y122.565 E.04686
G1 X112.05 Y120.922 E.07467
G1 X112.05 Y119.726 E.03849
G1 X110.761 Y118.437 E.05861
G1 X109.133 Y118.437 E.05236
; WIPE_START
G1 X110.761 Y118.437 E-.61876
G1 X111.024 Y118.7 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.328 Y126.3 Z2.8 F42000
G1 X109.643 Y133.786 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.641 Y133.812 E.00084
G2 X109.653 Y134.552 I.866 J.357 E.02448
G2 X109.879 Y134.97 I2.345 J-1.001 E.0153
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.511 J1.601 E.01714
G2 X108.602 Y134.837 I-.299 J.771 E.02317
G1 X108.602 Y127.089 E.24916
G1 X112.398 Y127.089 E.12206
G1 X112.398 Y133.246 E.19799
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.807 J.385 E.04504
G1 X110.041 Y133.356 E.03524
G2 X109.715 Y133.669 I.466 J.813 E.01469
G1 X109.675 Y133.735 E.00247
M204 S10000
G1 X110.002 Y133.959 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.495 J.205 E.01056
G1 X111.181 Y133.224 E.03158
G3 X111.397 Y133.176 I.222 J.485 E.00666
G3 X111.902 Y133.591 I-.018 J.536 E.02093
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01609
G1 X111.103 Y134.97 E.01776
G3 X110.868 Y135.021 I-.233 J-.513 E.00724
G3 X110.319 Y134.834 I.667 J-2.863 E.01729
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.982 Y134.016 I.481 J-.236 E.01176
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.0915
G1 X110.232 Y133.699 E-.06579
G1 X111.181 Y133.224 E-.40287
G1 X111.259 Y133.194 E-.03216
G1 X111.397 Y133.176 E-.05274
G1 X111.539 Y133.193 E-.05441
G1 X111.682 Y133.264 E-.06053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.855 Y135.414 I.886 J-1.772 E.02196
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.575 J-3.856 E.02476
G2 X112.209 Y134.647 I-.6 J-.754 E.01358
G1 X112.398 Y134.691 E.00623
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01965
G2 X108.781 Y143.557 I105.499 J68.751 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.602 E.09345
G2 X109.374 Y140.479 I.291 J-.662 E.02656
G1 X109.681 Y140.167 E.01408
G1 X111.225 Y137.697 E.09366
G2 X111.302 Y137.401 I-.478 J-.282 E.00998
G2 X111.288 Y136.649 I-3.83 J-.302 E.02421
G2 X111.059 Y136.209 I-.964 J.221 E.01614
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.1609
G1 X110.855 Y135.414 E-.10328
G1 X111.004 Y135.406 E-.05653
G1 X111.264 Y135.328 E-.10321
G1 X111.946 Y134.973 E-.29222
G1 X112.031 Y134.895 E-.04387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.111 Y140.187 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.695 Y140.193 I-.212 J-.258 E.01339
G1 X108.466 Y139.965 E.00964
G3 X108.39 Y139.781 I.184 J-.184 E.00609
G1 X108.39 Y135.722 E.12088
G3 X108.466 Y135.538 I.26 J0 E.00609
G1 X108.798 Y135.207 E.01397
G3 X108.95 Y135.128 I.195 J.192 E.0052
G3 X109.19 Y135.183 I.05 J.329 E.00749
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.901 Y136.726 I-.416 J.38 E.00863
G3 X110.91 Y137.382 I-3.335 J.373 E.01959
G3 X110.873 Y137.52 I-.259 J.005 E.00431
G1 X109.372 Y139.923 E.08438
G1 X109.154 Y140.144 E.00927
; WIPE_START
M204 S6000
G1 X109.003 Y140.254 E-.0708
G1 X108.935 Y140.269 E-.02649
G1 X108.858 Y140.269 E-.02936
G1 X108.766 Y140.242 E-.03625
G1 X108.695 Y140.193 E-.03269
G1 X108.466 Y139.965 E-.12302
G1 X108.41 Y139.88 E-.03856
G1 X108.39 Y139.781 E-.03857
G1 X108.39 Y138.822 E-.36425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.541 Y146.453 Z2.8 F42000
G1 X108.557 Y147.267 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.132 J-.276 E.0038
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.697 E.6283
G1 X112.79 Y126.697 E.13642
G1 X112.79 Y138.227 E.34346
G2 X112.619 Y138.305 I.051 J.34 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05865
G2 X108.506 Y147.236 I.306 J-.007 E.00826
M204 S10000
G1 X108.406 Y147.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134289
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00066
; LINE_WIDTH: 0.169013
G2 X108.559 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138385
G1 X112.594 Y147.549 E.03043
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54682
G1 F5358.206
M204 S6000
G1 X109.731 Y140.803 E.00614
G1 X109.255 Y141.066 E.02163
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05953
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626276
G1 F4628.397
M204 S6000
G1 X111.518 Y138.174 E.12538
; WIPE_START
G1 X110.451 Y139.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.123088
G1 F15000
M204 S6000
G1 X110.777 Y135.673 E.00136
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.11406
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.14833
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517245
G1 F5692.299
M204 S6000
G1 X111.458 Y135.715 E.02078
G1 X111.471 Y135.936 E.00829
G1 X111.429 Y135.971 E.00207
G1 X111.524 Y136.093 E.0058
; LINE_WIDTH: 0.488915
G1 F6053.879
G1 X111.57 Y136.227 E.00498
; LINE_WIDTH: 0.450785
G1 F6619.838
M73 P73 R3
G1 X111.615 Y136.361 E.00456
; LINE_WIDTH: 0.398748
G1 F7587.945
G1 X111.678 Y136.791 E.01219
G1 X111.668 Y137.574 E.02203
G1 X111.603 Y137.773 E.00588
G1 X111.878 Y137.947 E.00915
G1 X112.013 Y137.812 E.00535
G1 X112.022 Y136.793 E.02863
; LINE_WIDTH: 0.403383
G1 F7490.377
G1 X112.006 Y136.501 E.00834
; LINE_WIDTH: 0.435628
G1 F6875.346
G1 X111.99 Y136.208 E.00909
; LINE_WIDTH: 0.46808
G1 F6350.551
G1 X111.975 Y135.871 E.01135
; LINE_WIDTH: 0.50074
G1 F5897.514
G1 X111.96 Y135.533 E.01222
; WIPE_START
G1 X111.975 Y135.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.583 Y127.437 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X112.05 Y127.437 E.01501
G1 X112.05 Y128.598 E.03735
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
G3 X111.283 Y132.436 I2.088 J3.041 E.04616
G1 X111.477 Y132.436 E.00625
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6632.609
G1 X111.283 Y132.436 E-.07389
G1 X110.88 Y132.547 E-.15873
G1 X109.973 Y133.001 E-.38547
G1 X109.709 Y132.737 E-.14191
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/25
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z2.8 I.858 J.864 P1  F42000
G1 X133.233 Y109.375 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.462 J.231 E.01646
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01777
G3 X135.021 Y110.132 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-1.938 J-.352 E.01733
G3 X134.401 Y110.985 I-.731 J-.584 E.016
G3 X133.699 Y110.768 I-.24 J-.469 E.02421
G1 X133.225 Y109.819 E.03158
G3 X133.21 Y109.431 I.47 J-.213 E.01188
M204 S10000
G1 X132.865 Y109.224 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.815 Y109.353 E.00446
G2 X132.866 Y109.978 I.86 J.244 E.0206
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.986 J-2.315 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.701 I1.598 J1.507 E.01705
G2 X134.847 Y112.398 I.692 J.293 E.02337
G1 X114.487 Y112.398 E.65471
G2 X112.487 Y113.898 I.017 J2.105 E.08606
G1 X108.602 Y113.898 E.12493
G1 X108.602 Y109.911 E.1282
G2 X109.974 Y108.602 I-1.411 J-2.852 E.06191
G1 X133.246 Y108.602 E.74836
G1 X133.291 Y108.79 E.00622
G2 X132.89 Y109.169 I.385 J.807 E.01803
; WIPE_START
G1 X132.815 Y109.353 E-.07545
G1 X132.785 Y109.518 E-.0635
G1 X132.785 Y109.685 E-.06352
G1 X132.816 Y109.849 E-.06345
G1 X132.866 Y109.978 E-.05281
G1 X133.356 Y110.959 E-.4166
G1 X133.39 Y111.014 E-.02467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.42 J.528 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.217 Y111.924 E.0122
G3 X140.217 Y112.276 I-.28 J.176 E.01105
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.724 Y112.61 E.12079
G3 X135.565 Y112.559 I.016 J-.323 E.00504
G1 X135.206 Y112.203 E.01507
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07307
G1 X136.243 Y110.46 E-.65245
G1 X136.307 Y110.396 E-.03447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.737 J-.284 E.02357
G1 X140.175 Y111.325 E.01675
G1 X137.72 Y109.79 E.0931
G2 X137.428 Y109.698 I-.306 J.464 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.903 J-.921 E.02179
G2 X135.329 Y109.736 I-.99 J-.006 E.01352
G2 X134.974 Y109.054 I-3.872 J1.584 E.02476
G2 X134.648 Y108.79 I-.756 J.603 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00275
G1 X137.919 Y109.072 E.0183
G2 X142.966 Y112.189 I67.634 J-103.881 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.275 Y112.443 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.297 J-.153 E.00376
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.804 Y114.29 I.007 J1.711 E.07354
G1 X108.21 Y114.29 E.13685
G1 X108.21 Y109.653 E.13813
G2 X109.734 Y108.21 I-.966 J-2.547 E.06417
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.024 Y112.621 E.07491
G2 X147.243 Y112.493 I-.046 J-.331 E.00776
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.06953
G1 X147.31 Y110.506 E-.69047
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131752
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.553 J-.959 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02756
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.014 Y112.026 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38022
G1 F8004.743
M204 S6000
G1 X141.975 Y112.026 E.02562
G1 X141.189 Y111.552 E.02446
G1 X141.219 Y111.779 E.0061
G1 X140.999 Y111.904 E.00673
G1 X141.007 Y111.966 E.00167
M204 S10000
G1 X140.441 Y110.905 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100906
G1 F15000
M204 S6000
G1 X140.748 Y111.598 E.00347
M204 S10000
G1 X140.702 Y111.29 F42000
; LINE_WIDTH: 0.339188
G1 F9113.369
M204 S6000
G2 X139.999 Y110.806 I-3.92 J4.939 E.01999
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330799
G1 F9378.939
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300147
G1 F10496.592
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168892
G1 F15000
M204 S6000
G1 X138.618 Y109.758 E.00971
; WIPE_START
G1 X137.674 Y109.511 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.225 Y112.594 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.140189
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00097
; LINE_WIDTH: 0.111343
G1 X135.081 Y112.386 E.00068
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.407 Y111.207 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.153969
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115939
G1 X135.153 Y111.003 E.00094
M204 S10000
G1 X135.628 Y110.247 F42000
; LINE_WIDTH: 0.124487
G1 F15000
M204 S6000
G1 X135.665 Y110.155 E.00064
G1 X135.634 Y110.012 E.00095
M204 S10000
G1 X135.716 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522002
G1 F5635.784
M204 S6000
G1 X135.906 Y109.521 E.00724
G1 X135.975 Y109.565 E.00311
; LINE_WIDTH: 0.508603
G1 F5797.942
G1 X136.13 Y109.482 E.00646
; LINE_WIDTH: 0.477368
G1 F6214.79
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443145
G1 F6746.206
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390024
G1 F7778.657
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.138 E.00523
G1 X137.427 Y109.112 E.00139
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405935
G1 F7437.71
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.443145
G1 F6746.206
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.475783
G1 F6237.546
G1 X135.823 Y109.029 E.01191
; LINE_WIDTH: 0.51208
G1 F5754.973
G1 X135.475 Y109.043 E.01291
G1 X135.69 Y109.488 E.01832
; WIPE_START
G1 X135.475 Y109.043 E-.44584
G1 X135.823 Y109.029 E-.31416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
M204 S10000
G1 X132.915 Y108.806 F42000
; LINE_WIDTH: 0.107993
G1 F15000
M204 S6000
G2 X132.793 Y108.907 I.013 J.14 E.00087
; WIPE_START
G1 X132.833 Y108.842 E-.3515
G1 X132.915 Y108.806 E-.4085
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.955 Y110.935 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G3 X132.436 Y109.486 I2.168 J-1.593 E.05019
G1 X132.448 Y109.42 E.00213
G1 X131.978 Y108.95 E.02138
G1 X131.698 Y108.95 E.00902
G1 X128.596 Y112.052 E.14105
G1 X127.404 Y112.052 E.03833
G1 X124.302 Y108.95 E.14107
G1 X124.022 Y108.95 E.00902
G1 X120.917 Y112.055 E.14118
G1 X119.731 Y112.055 E.03815
G1 X116.626 Y108.95 E.14119
G1 X116.346 Y108.95 E.00902
G1 X111.747 Y113.55 E.20916
G1 X108.95 Y113.55 E.08992
G1 X108.95 Y110.112 E.11055
G2 X109.623 Y109.623 I-1.732 J-3.088 E.0268
G1 X112.773 Y112.773 E.14324
; WIPE_START
G1 X111.358 Y111.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.398 Y118.101 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y122.898 E.15427
G1 X108.602 Y122.898 E.12206
G1 X108.602 Y118.101 E.15427
G1 X112.338 Y118.101 E.12013
M204 S10000
G1 X112.79 Y117.709 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.29 E.16625
G1 X108.21 Y123.29 E.13642
G1 X108.21 Y117.709 E.16625
G1 X112.73 Y117.709 E.13464
; WIPE_START
M204 S6000
G1 X112.751 Y119.708 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.145 Y118.449 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X110.773 Y118.449 E.05236
G1 X112.05 Y119.726 E.05806
G1 X112.05 Y120.922 E.03849
G1 X110.422 Y122.55 E.074
G1 X108.95 Y122.55 E.04734
G1 X108.95 Y122.393 E.00502
; WIPE_START
G1 X108.95 Y122.55 E-.05934
G1 X110.422 Y122.55 E-.55941
M73 P74 R3
G1 X110.685 Y122.287 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.987 Y129.887 Z3 F42000
G1 X109.624 Y133.832 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.587 Y133.964 E.00441
G2 X109.653 Y134.552 I.898 J.197 E.01939
G2 X109.879 Y134.97 I2.334 J-.995 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.516 J1.607 E.01714
G2 X108.602 Y134.836 I-.3 J.772 E.02318
G1 X108.602 Y127.101 E.24875
G1 X112.398 Y127.101 E.12206
G1 X112.398 Y133.246 E.19761
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.807 J.385 E.04503
G1 X110.041 Y133.356 E.03525
G2 X109.65 Y133.777 I.444 J.805 E.01881
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.399 Y133.176 I.222 J.485 E.00672
G3 X111.902 Y133.591 I-.02 J.537 E.02086
G3 X111.91 Y134.262 I-3.613 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01608
G1 X111.103 Y134.971 E.01777
G3 X110.868 Y135.021 I-.233 J-.513 E.00724
G3 X110.319 Y134.835 I.353 J-1.94 E.01733
G3 X110.015 Y134.4 I.59 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01182
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09164
G1 X110.232 Y133.699 E-.06575
G1 X111.181 Y133.224 E-.40291
G1 X111.259 Y133.194 E-.03213
G1 X111.399 Y133.176 E-.05358
G1 X111.539 Y133.193 E-.0536
G1 X111.682 Y133.264 E-.0604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.928 J-1.912 E.02195
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.58 J-3.866 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.495 J68.749 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.611 E.09313
G2 X109.374 Y140.479 I.278 J-.697 E.02652
G1 X109.682 Y140.167 E.01407
G1 X111.21 Y137.721 E.09274
G2 X111.302 Y137.429 I-.463 J-.306 E.00998
G1 X111.302 Y136.796 E.02035
G2 X111.059 Y136.209 I-.855 J.01 E.02094
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.16089
G1 X110.856 Y135.414 E-.10333
G1 X111.004 Y135.406 E-.05644
G1 X111.264 Y135.328 E-.10325
G1 X111.946 Y134.973 E-.29222
G1 X112.031 Y134.895 E-.04388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.11 Y140.188 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X109.001 Y140.247 E.00371
G3 X108.734 Y140.224 I-.105 J-.326 E.00818
G3 X108.466 Y139.965 I1.022 J-1.327 E.01113
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.952 Y135.128 I.195 J.191 E.00525
G3 X109.19 Y135.183 I.049 J.329 E.00744
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.392 E.01719
G3 X110.868 Y137.529 I-.259 J-.005 E.00431
G1 X109.372 Y139.923 E.08408
G1 X109.153 Y140.145 E.00931
; WIPE_START
M204 S6000
G1 X109.001 Y140.247 E-.06953
G1 X108.935 Y140.269 E-.02639
G1 X108.865 Y140.269 E-.02649
G1 X108.734 Y140.224 E-.05266
G1 X108.466 Y139.965 E-.14168
G1 X108.41 Y139.88 E-.03854
G1 X108.39 Y139.781 E-.03854
G1 X108.39 Y138.817 E-.36617
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.541 Y146.448 Z3 F42000
G1 X108.557 Y147.267 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.132 J-.276 E.0038
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.709 E.62795
G1 X112.79 Y126.709 E.13642
G1 X112.79 Y138.227 E.34309
G2 X112.619 Y138.305 I.054 J.345 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.028 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.506 Y147.236 I.306 J-.007 E.00826
M204 S10000
G1 X108.406 Y147.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134422
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00067
; LINE_WIDTH: 0.169035
G2 X108.56 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138384
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5468
G1 F5358.419
M204 S6000
G1 X109.73 Y140.802 E.00615
G1 X109.255 Y141.066 E.02163
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05953
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626239
G1 F4628.688
M204 S6000
G1 X111.514 Y138.181 E.12503
; WIPE_START
G1 X110.447 Y139.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.123011
G1 F15000
M204 S6000
G1 X110.779 Y135.675 E.00135
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.11404
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148274
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516396
G1 F5702.515
M204 S6000
G1 X111.458 Y135.715 E.02073
G1 X111.471 Y135.934 E.00822
G1 X111.428 Y135.971 E.0021
G1 X111.529 Y136.116 E.00662
; LINE_WIDTH: 0.480677
G1 F6167.81
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.44635
G1 F6692.611
G1 X111.621 Y136.448 E.00549
; LINE_WIDTH: 0.399937
G1 F7562.666
G1 X111.667 Y136.614 E.00485
G1 X111.678 Y137.443 E.02338
G1 X111.642 Y137.805 E.01025
G1 X111.873 Y137.95 E.0077
G1 X112.012 Y137.811 E.00554
G1 X112.018 Y136.611 E.03387
; LINE_WIDTH: 0.412024
G1 F7315.026
G1 X112.001 Y136.417 E.00567
; LINE_WIDTH: 0.44635
G1 F6692.611
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480677
G1 F6167.81
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.5075
G1 F5811.701
G1 X111.958 Y135.533 E.01819
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.459 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.477 Y132.436 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.88 Y132.547 I-.061 J1.329 E.0197
G1 X109.973 Y133.001 E.03262
G1 X108.95 Y131.978 E.0465
G1 X108.95 Y131.698 E.00902
G1 X112.05 Y128.598 E.14095
G1 X112.05 Y127.449 E.03697
G1 X111.571 Y127.449 E.01539
; WIPE_START
G1 X112.05 Y127.449 E-.18192
G1 X112.05 Y128.598 E-.43684
G1 X111.787 Y128.861 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.622 Y136.18 Z3 F42000
G1 X108.406 Y140.293 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109749
G1 F15000
M204 S6000
G2 X108.59 Y140.386 I1.766 J-3.256 E.00109
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.293 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/25
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z3 I.949 J.762 P1  F42000
G1 X133.236 Y109.377 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.465 J.233 E.0164
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.563 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.513 J.233 E.00724
G3 X134.835 Y110.681 I-1.943 J-.354 E.01733
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.239 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.212 Y109.432 I.476 J-.21 E.01184
M204 S10000
G1 X132.866 Y109.221 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.825 Y109.356 E.00453
G2 X132.866 Y109.978 I.886 J.254 E.02046
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.991 J-2.325 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.59 J1.501 E.01704
G2 X134.836 Y112.398 I.77 J.299 E.02318
G1 X114.487 Y112.398 E.65435
G2 X114.231 Y112.417 I-.021 J1.472 E.00825
G2 X112.483 Y113.913 I.294 J2.113 E.07816
G1 X108.602 Y113.913 E.12478
G1 X108.602 Y109.911 E.12868
G2 X109.974 Y108.602 I-1.41 J-2.851 E.06191
G1 X133.246 Y108.602 E.74837
G1 X133.291 Y108.79 E.00622
G2 X132.9 Y109.173 I.421 J.82 E.01785
; WIPE_START
G1 X132.825 Y109.356 E-.07525
G1 X132.785 Y109.518 E-.06333
G1 X132.785 Y109.685 E-.06342
G1 X132.816 Y109.849 E-.06346
G1 X132.866 Y109.978 E-.05286
G1 X133.356 Y110.959 E-.41652
G1 X133.391 Y111.015 E-.02517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.129 Y111.945 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.315 J.047 E.00434
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.42 J.528 E.0112
G1 X137.391 Y110.09 E.01718
G3 X137.527 Y110.132 I-.005 J.258 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.223 Y111.93 E.01246
G3 X140.217 Y112.276 I-.281 J.168 E.01085
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.731 Y112.61 E.12058
G3 X135.567 Y112.561 I-.002 J-.294 E.00516
G1 X135.206 Y112.203 E.01517
G3 X135.126 Y112.005 I.239 J-.211 E.00647
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07688
G1 X136.243 Y110.46 E-.65245
G1 X136.3 Y110.403 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.559 Y111.712 I-.8 J-.286 E.02278
G1 X140.175 Y111.325 E.01754
G1 X137.72 Y109.79 E.0931
G2 X137.427 Y109.698 I-.306 J.461 E.00999
G1 X136.795 Y109.698 E.02034
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.406 Y110.221 I-1.887 J-.927 E.01934
G2 X135.329 Y109.736 I-.828 J-.117 E.01603
G2 X134.974 Y109.054 I-3.862 J1.579 E.02475
G2 X134.648 Y108.79 I-.755 J.601 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00275
G1 X137.919 Y109.072 E.01831
G2 X142.966 Y112.189 I67.646 J-103.901 E.19075
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.28 Y112.446 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.277 J-.132 E.0038
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.802 Y114.305 I.021 J1.727 E.07385
G1 X108.21 Y114.305 E.13679
G1 X108.21 Y109.653 E.13857
G2 X109.734 Y108.21 I-.967 J-2.548 E.06417
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.409 I.338 J-.037 E.00616
G1 X138.165 Y108.765 E.01496
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07455
G2 X147.249 Y112.498 I-.008 J-.306 E.00825
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.0703
G1 X147.31 Y110.508 E-.6897
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.502 Y112.548 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131793
G1 F15000
M204 S6000
G1 X147.529 Y112.529 E.00023
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02758
M204 S10000
G1 X147.502 Y112.548 F42000
; LINE_WIDTH: 0.129692
G1 F15000
M204 S6000
G1 X147.428 Y112.594 E.0006
; WIPE_START
G1 X147.502 Y112.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.031 Y112.017 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39721
G1 F7620.875
M204 S6000
G1 X141.944 Y112.017 E.02556
G1 X141.264 Y111.608 E.02222
G1 X141.025 Y111.958 E.01187
M204 S10000
G1 X140.905 Y111.449 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.428509
G1 F7002.28
M204 S6000
G1 X140.739 Y111.319 E.0064
; LINE_WIDTH: 0.393592
G1 F7699.511
G1 X140.574 Y111.189 E.00582
; LINE_WIDTH: 0.338541
G1 F9133.317
G2 X139.999 Y110.806 I-3.974 J5.334 E.01614
G1 X138.128 Y109.626 E.05166
; LINE_WIDTH: 0.330833
M73 P75 R3
G1 F9377.846
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300211
G1 F10493.959
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.169044
G1 F15000
M204 S6000
G1 X138.617 Y109.758 E.00972
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521628
G1 F5640.185
M204 S6000
G1 X135.906 Y109.521 E.00727
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508363
G1 F5800.932
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477288
G1 F6215.935
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443145
G1 F6746.206
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390024
G1 F7778.664
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.138 E.00523
G1 X137.427 Y109.112 E.00139
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405935
G1 F7437.71
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.443145
G1 F6746.206
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.475665
G1 F6239.241
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511654
G1 F5760.199
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.01829
M204 S10000
G1 X135.634 Y110.011 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124617
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00095
G1 X135.629 Y110.248 E.00065
M204 S10000
G1 X135.152 Y111.003 F42000
; LINE_WIDTH: 0.115956
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.154024
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.981 Y110.074 Z3.2 F42000
G1 X112.773 Y112.773 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.623 Y109.623 E.14324
G3 X108.95 Y110.112 I-2.397 J-2.589 E.0268
G1 X108.95 Y113.565 E.11103
G1 X111.732 Y113.565 E.08944
G1 X116.346 Y108.95 E.20984
G1 X116.626 Y108.95 E.00902
G1 X119.731 Y112.055 E.1412
G1 X120.917 Y112.055 E.03815
G1 X124.022 Y108.95 E.14118
G1 X124.302 Y108.95 E.00902
G1 X127.404 Y112.052 E.14107
G1 X128.596 Y112.052 E.03833
G1 X131.698 Y108.95 E.14105
G1 X131.978 Y108.95 E.00902
G1 X132.448 Y109.421 E.02138
G2 X132.547 Y110.12 I1.907 J.087 E.02284
G1 X132.955 Y110.935 E.0293
; WIPE_START
G1 X132.547 Y110.12 E-.34625
G1 X132.437 Y109.717 E-.15856
G1 X132.448 Y109.421 E-.11295
G1 X132.184 Y109.156 E-.14224
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.227 Y112.296 Z3.2 F42000
G1 X112.398 Y118.089 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y122.913 E.15513
G1 X108.602 Y122.913 E.12206
G1 X108.602 Y118.089 E.15513
G1 X112.338 Y118.089 E.12013
M204 S10000
G1 X112.79 Y117.697 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.305 E.16705
G1 X108.21 Y123.305 E.13642
G1 X108.21 Y117.697 E.16705
G1 X112.73 Y117.697 E.13464
; WIPE_START
M204 S6000
G1 X112.751 Y119.696 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y122.393 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y122.565 E.0055
G1 X110.408 Y122.565 E.04686
G1 X112.05 Y120.922 E.07467
G1 X112.05 Y119.726 E.03849
G1 X110.761 Y118.437 E.05861
G1 X109.133 Y118.437 E.05236
; WIPE_START
G1 X110.761 Y118.437 E-.61876
G1 X111.024 Y118.7 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.321 Y126.3 Z3.2 F42000
G1 X109.624 Y133.832 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.587 Y133.964 E.00441
G2 X109.653 Y134.552 I.898 J.197 E.01939
G2 X109.879 Y134.97 I2.346 J-1.002 E.0153
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.512 J1.601 E.01714
G2 X108.602 Y134.835 I-.3 J.774 E.02316
G1 X108.602 Y127.089 E.24911
G1 X112.398 Y127.089 E.12206
G1 X112.398 Y133.246 E.19799
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.807 J.384 E.04504
G1 X110.041 Y133.356 E.03525
G2 X109.65 Y133.777 I.444 J.805 E.01882
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.402 Y133.176 I.222 J.485 E.00679
G3 X111.902 Y133.591 I-.023 J.537 E.0208
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.97 E.01776
G3 X110.868 Y135.021 I-.233 J-.513 E.00724
G3 X110.319 Y134.835 I.354 J-1.943 E.01733
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01182
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09162
G1 X110.232 Y133.699 E-.06578
G1 X111.181 Y133.224 E-.40292
G1 X111.259 Y133.194 E-.03212
G1 X111.402 Y133.176 E-.05445
G1 X111.539 Y133.193 E-.05269
G1 X111.682 Y133.264 E-.06043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.779 Y135.406 I.935 J-1.902 E.0195
G2 X111.264 Y135.328 I.117 J-.829 E.01602
G2 X111.946 Y134.973 I-1.577 J-3.859 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.495 J68.749 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.601 E.09348
G2 X109.374 Y140.479 I.292 J-.659 E.02657
G1 X109.682 Y140.167 E.01408
G1 X111.225 Y137.697 E.09366
G2 X111.302 Y137.401 I-.477 J-.282 E.00998
G2 X111.288 Y136.649 I-3.829 J-.302 E.0242
G2 X111.059 Y136.209 I-.964 J.221 E.01613
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.589 Y135.363 E-.16091
G1 X110.779 Y135.406 E-.07429
G1 X110.779 Y135.406 E0
G1 X111.004 Y135.406 E-.08536
G1 X111.264 Y135.328 E-.10322
G1 X111.946 Y134.973 E-.2922
G1 X112.032 Y134.895 E-.04402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.111 Y140.187 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.763 Y140.24 I-.214 J-.236 E.01112
G3 X108.466 Y139.965 I.597 J-.941 E.01214
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.954 Y135.128 I.194 J.19 E.00531
G3 X109.189 Y135.183 I.046 J.33 E.00738
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.382 E.01689
G3 X110.873 Y137.52 I-.258 J.005 E.00431
G1 X109.372 Y139.923 E.08438
G1 X109.154 Y140.144 E.00927
; WIPE_START
M204 S6000
G1 X109.003 Y140.254 E-.07081
G1 X108.935 Y140.269 E-.02648
G1 X108.857 Y140.269 E-.02969
G1 X108.763 Y140.24 E-.03725
G1 X108.694 Y140.193 E-.0317
G1 X108.466 Y139.965 E-.12268
G1 X108.41 Y139.88 E-.03849
G1 X108.39 Y139.781 E-.03857
G1 X108.39 Y138.822 E-.36433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.544 Y146.453 Z3.2 F42000
G1 X108.561 Y147.261 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.154 J-.295 E.00375
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.697 E.6283
G1 X112.79 Y126.697 E.13642
G1 X112.79 Y138.227 E.34344
G2 X112.619 Y138.305 I.057 J.351 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05867
G2 X108.511 Y147.229 I.332 J-.032 E.00808
M204 S10000
G1 X108.406 Y147.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134565
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00067
; LINE_WIDTH: 0.169059
G2 X108.56 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138383
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54682
G1 F5358.206
M204 S6000
G1 X109.731 Y140.803 E.00614
G1 X109.255 Y141.066 E.02163
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05953
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626297
G1 F4628.224
M204 S6000
G1 X111.518 Y138.174 E.12538
; WIPE_START
G1 X110.45 Y139.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.123069
G1 F15000
M204 S6000
G1 X110.779 Y135.674 E.00136
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114048
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.1483
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517254
G1 F5692.198
M204 S6000
G1 X111.458 Y135.715 E.02077
G1 X111.471 Y135.935 E.00826
G1 X111.429 Y135.971 E.00209
G1 X111.524 Y136.093 E.00582
; LINE_WIDTH: 0.488953
M73 P76 R3
G1 F6053.37
G1 X111.57 Y136.227 E.00498
; LINE_WIDTH: 0.450818
G1 F6619.309
G1 X111.615 Y136.361 E.00456
; LINE_WIDTH: 0.398749
G1 F7587.929
G1 X111.678 Y136.791 E.0122
G1 X111.668 Y137.574 E.02203
G1 X111.603 Y137.773 E.00588
G1 X111.878 Y137.947 E.00915
G1 X112.013 Y137.812 E.00536
G1 X112.022 Y136.793 E.02863
; LINE_WIDTH: 0.40339
G1 F7490.222
G1 X112.006 Y136.501 E.00835
; LINE_WIDTH: 0.43565
G1 F6874.953
G1 X111.99 Y136.208 E.00909
; LINE_WIDTH: 0.468098
G1 F6350.289
M73 P76 R2
G1 X111.975 Y135.871 E.01134
; LINE_WIDTH: 0.500733
G1 F5897.611
G1 X111.96 Y135.533 E.01222
; WIPE_START
G1 X111.975 Y135.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.459 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.583 Y127.437 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X112.05 Y127.437 E.01501
G1 X112.05 Y128.598 E.03735
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
G3 X111.283 Y132.436 I2.086 J3.037 E.04616
G1 X111.477 Y132.436 E.00626
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6632.609
G1 X111.283 Y132.436 E-.07397
G1 X110.88 Y132.547 E-.15859
G1 X109.973 Y133.001 E-.38554
G1 X109.709 Y132.737 E-.14191
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/25
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z3.2 I.856 J.865 P1  F42000
G1 X133.202 Y109.463 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.499 J.146 E.01917
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-1.944 J-.354 E.01733
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.188 Y109.521 I.476 J-.21 E.00908
M204 S10000
G1 X132.827 Y109.323 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.819 Y109.354 E.00103
G2 X132.866 Y109.978 I.869 J.248 E.02055
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.988 J-2.32 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.702 I1.586 J1.498 E.01705
G2 X134.847 Y112.398 I.692 J.293 E.02337
G1 X114.487 Y112.398 E.65471
G2 X112.47 Y113.953 I.018 J2.109 E.08791
G1 X108.602 Y113.953 E.12438
G1 X108.602 Y109.911 E.12996
G2 X109.974 Y108.602 I-1.41 J-2.85 E.06191
G1 X133.246 Y108.602 E.74837
G1 X133.291 Y108.79 E.00622
G2 X132.879 Y109.199 I.397 J.812 E.019
G1 X132.85 Y109.268 E.0024
; WIPE_START
G1 X132.819 Y109.354 E-.03491
G1 X132.785 Y109.518 E-.06333
G1 X132.785 Y109.685 E-.0635
G1 X132.816 Y109.849 E-.06351
G1 X132.866 Y109.978 E-.05281
G1 X133.356 Y110.959 E-.41654
G1 X133.427 Y111.074 E-.05132
G1 X133.452 Y111.101 E-.01408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.811 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.359 J.383 E.0113
G1 X137.381 Y110.09 E.01689
G3 X137.519 Y110.127 I.005 J.258 E.00431
G1 X139.929 Y111.633 E.08464
G1 X140.217 Y111.924 E.0122
G3 X140.217 Y112.276 I-.28 J.176 E.01105
G1 X139.964 Y112.533 E.01076
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.721 Y112.61 E.12089
G3 X135.56 Y112.554 I.012 J-.293 E.00515
G1 X135.205 Y112.203 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.811 E-.07302
G1 X136.243 Y110.46 E-.65247
G1 X136.307 Y110.396 E-.03451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.738 J-.283 E.02357
G1 X140.175 Y111.325 E.01675
G1 X137.696 Y109.775 E.09401
G2 X137.399 Y109.698 I-.282 J.478 E.00998
G2 X136.648 Y109.712 I-.302 J3.816 E.0242
G1 X136.567 Y109.737 E.00271
G2 X135.949 Y110.2 I.531 J1.354 E.02515
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.65 J-.846 E.02181
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.871 J1.583 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.919 Y109.072 E.0183
G2 X142.966 Y112.189 I67.653 J-103.913 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.279 Y112.446 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.282 J-.137 E.00379
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.797 Y114.345 I.008 J1.714 E.07519
G1 X108.21 Y114.345 E.13664
G1 X108.21 Y109.653 E.13975
G2 X109.734 Y108.21 I-.967 J-2.548 E.06417
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.024 Y112.621 E.07491
G2 X147.248 Y112.497 I-.027 J-.313 E.00786
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07012
G1 X147.31 Y110.508 E-.68988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131752
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.554 J-.959 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02756
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.014 Y112.026 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38046
G1 F7999.051
M204 S6000
G1 X141.975 Y112.026 E.02562
G1 X141.189 Y111.552 E.02446
G1 X141.218 Y111.778 E.00607
G1 X140.999 Y111.903 E.00671
G1 X141.007 Y111.966 E.0017
M204 S10000
G1 X140.44 Y110.904 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100557
G1 F15000
M204 S6000
G1 X140.747 Y111.596 E.00345
M204 S10000
G1 X140.701 Y111.29 F42000
; LINE_WIDTH: 0.339156
G1 F9114.363
M204 S6000
G2 X139.999 Y110.806 I-3.918 J4.938 E.01997
G1 X138.128 Y109.626 E.05176
; LINE_WIDTH: 0.330815
G1 F9378.446
G1 X137.928 Y109.597 E.0046
; LINE_WIDTH: 0.300205
G1 F10494.209
G1 X137.727 Y109.569 E.00411
M204 S10000
G1 X137.654 Y109.516 F42000
; LINE_WIDTH: 0.120535
G1 F15000
M204 S6000
G1 X137.806 Y109.545 E.00095
; LINE_WIDTH: 0.146443
G1 X138.567 Y109.726 E.00639
; WIPE_START
G1 X137.806 Y109.545 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.225 Y112.594 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.140121
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00097
; LINE_WIDTH: 0.111321
G1 X135.081 Y112.386 E.00068
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.407 Y111.207 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.15398
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115941
G1 X135.153 Y111.003 E.00094
M204 S10000
G1 X135.628 Y110.248 F42000
; LINE_WIDTH: 0.124541
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00064
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52181
G1 F5638.043
M204 S6000
G1 X135.906 Y109.521 E.00726
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508503
G1 F5799.187
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477388
G1 F6214.504
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443183
G1 F6745.574
G1 X136.536 Y109.361 E.00802
; LINE_WIDTH: 0.391708
G1 F7741.092
G1 X136.786 Y109.322 E.00699
G1 X137.306 Y109.329 E.01431
G1 X137.347 Y109.143 E.00526
G1 X137.415 Y109.102 E.00218
G1 X137.292 Y108.979 E.00479
G1 X136.792 Y108.978 E.01379
; LINE_WIDTH: 0.405903
G1 F7438.375
G1 X136.481 Y108.996 E.00893
; LINE_WIDTH: 0.443188
G1 F6745.49
G1 X136.17 Y109.015 E.00985
; LINE_WIDTH: 0.47578
G1 F6237.583
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511863
G1 F5757.634
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.0183
; WIPE_START
G1 X135.474 Y109.043 E-.44579
G1 X135.822 Y109.029 E-.31421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.955 Y110.935 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G3 X132.436 Y109.486 I2.167 J-1.593 E.05019
G1 X132.448 Y109.42 E.00213
G1 X131.978 Y108.95 E.02138
G1 X131.698 Y108.95 E.00902
G1 X128.596 Y112.052 E.14105
M73 P77 R2
G1 X127.404 Y112.052 E.03833
G1 X124.302 Y108.95 E.14107
G1 X124.022 Y108.95 E.00902
G1 X120.917 Y112.055 E.14118
G1 X119.731 Y112.055 E.03815
G1 X116.626 Y108.95 E.14119
G1 X116.346 Y108.95 E.00902
G1 X111.692 Y113.604 E.21164
G1 X108.95 Y113.604 E.08816
G1 X108.95 Y110.112 E.11231
G2 X109.623 Y109.623 I-1.719 J-3.07 E.0268
G1 X112.767 Y112.767 E.14298
; WIPE_START
G1 X111.352 Y111.352 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.398 Y118.046 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y122.953 E.15777
G1 X108.602 Y122.953 E.12206
G1 X108.602 Y118.046 E.15777
G1 X112.338 Y118.046 E.12013
M204 S10000
G1 X112.79 Y117.656 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.345 E.16946
G1 X108.21 Y123.345 E.13642
G1 X108.21 Y117.656 E.16946
G1 X112.73 Y117.656 E.13464
; WIPE_START
M204 S6000
G1 X112.751 Y119.655 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.09 Y118.394 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X110.719 Y118.394 E.05236
G1 X112.05 Y119.726 E.06053
G1 X112.05 Y120.922 E.03849
G1 X110.368 Y122.604 E.07648
G1 X108.95 Y122.604 E.04558
G1 X108.95 Y122.393 E.00678
; WIPE_START
G1 X108.95 Y122.604 E-.0801
G1 X110.368 Y122.604 E-.53866
G1 X110.631 Y122.341 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.965 Y129.945 Z3.4 F42000
G1 X109.624 Y133.832 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.587 Y133.963 E.00441
G2 X109.653 Y134.552 I.898 J.198 E.0194
G2 X109.879 Y134.97 I2.339 J-.998 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.508 J1.597 E.01714
G2 X108.602 Y134.835 I-.301 J.775 E.02316
G1 X108.602 Y127.046 E.25045
G1 X112.398 Y127.046 E.12206
G1 X112.398 Y133.246 E.19935
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.807 J.385 E.04503
G1 X110.041 Y133.356 E.03525
G2 X109.65 Y133.777 I.444 J.805 E.01881
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.404 Y133.176 I.222 J.485 E.00686
G3 X111.902 Y133.591 I-.025 J.537 E.02073
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01609
G1 X111.103 Y134.971 E.01776
G3 X110.868 Y135.021 I-.233 J-.513 E.00724
G3 X110.319 Y134.835 I.354 J-1.944 E.01733
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01182
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09162
G1 X110.232 Y133.699 E-.06574
G1 X111.181 Y133.224 E-.40292
G1 X111.259 Y133.194 E-.03211
G1 X111.404 Y133.176 E-.05531
G1 X111.539 Y133.193 E-.05187
G1 X111.682 Y133.264 E-.06042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.743 Y135.401 I.961 J-1.95 E.01833
G2 X111.264 Y135.328 I.149 J-.836 E.01721
G2 X111.946 Y134.973 I-1.578 J-3.861 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01358
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.507 J68.757 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.09313
G2 X109.35 Y140.503 I.278 J-.716 E.02542
G1 X109.682 Y140.167 E.01518
G1 X111.221 Y137.703 E.09342
G2 X111.302 Y137.417 I-.522 J-.302 E.00966
G1 X111.302 Y136.796 E.01997
G2 X111.059 Y136.209 I-.855 J.01 E.02095
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.602 Y135.369 E-.16644
G1 X110.743 Y135.401 E-.05486
G1 X111.004 Y135.406 E-.09923
G1 X111.264 Y135.328 E-.10328
G1 X111.946 Y134.973 E-.29222
G1 X112.032 Y134.895 E-.04396
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.196 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.734 Y140.224 I-.204 J-.245 E.01175
G3 X108.466 Y139.965 I1.022 J-1.326 E.01112
G3 X108.39 Y139.781 I.184 J-.184 E.00609
G1 X108.39 Y135.722 E.12088
G3 X108.466 Y135.538 I.26 J0 E.00609
G1 X108.798 Y135.207 E.01397
G3 X108.956 Y135.127 I.195 J.19 E.00536
G3 X109.189 Y135.183 I.044 J.331 E.00732
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.528 J.419 E.0112
G1 X110.91 Y137.388 E.01706
G3 X110.872 Y137.523 I-.283 J-.008 E.0042
G1 X109.372 Y139.923 E.0843
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.015 Y140.251 E-.06215
G1 X108.935 Y140.269 E-.03102
G1 X108.797 Y140.254 E-.05268
G1 X108.734 Y140.224 E-.02655
G1 X108.466 Y139.965 E-.14163
G1 X108.41 Y139.88 E-.03859
G1 X108.39 Y139.781 E-.03858
G1 X108.39 Y138.81 E-.36881
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.533 Y146.441 Z3.4 F42000
G1 X108.549 Y147.259 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.152 J-.279 E.00413
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.656 E.62952
G1 X112.79 Y126.656 E.13642
G1 X112.79 Y138.226 E.34466
G2 X112.619 Y138.305 I.061 J.357 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.0784
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.499 Y147.225 I.317 J-.018 E.00781
M204 S10000
G1 X108.406 Y147.51 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17173
G1 F15000
M204 S6000
G1 X108.559 Y147.537 E.00158
; LINE_WIDTH: 0.138384
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54738
G1 F5352.258
M204 S6000
G1 X109.709 Y140.789 E.00717
G1 X109.38 Y141.023 E.01607
G1 X109.058 Y141.087 E.01309
G1 X109.058 Y142.216 E.04497
G1 X109.83 Y140.936 E.05955
M204 S10000
G1 X110.066 Y140.475 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626268
G1 F4628.456
M204 S6000
G1 X111.516 Y138.178 E.12519
; WIPE_START
G1 X110.448 Y139.869 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.123074
G1 F15000
M204 S6000
G1 X110.778 Y135.674 E.00136
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114021
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148222
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5163
G1 F5703.671
M204 S6000
G1 X111.458 Y135.715 E.02073
G1 X111.471 Y135.935 E.00826
G1 X111.429 Y135.971 E.00207
G1 X111.529 Y136.116 E.00659
; LINE_WIDTH: 0.480694
G1 F6167.575
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.44636
G1 F6692.445
G1 X111.621 Y136.448 E.00549
; LINE_WIDTH: 0.399613
G1 F7569.546
G1 X111.667 Y136.614 E.00485
G1 X111.678 Y137.427 E.02292
G1 X111.643 Y137.693 E.00757
G1 X111.604 Y137.778 E.00262
G1 X111.875 Y137.949 E.00903
G1 X112.013 Y137.812 E.00547
G1 X112.018 Y136.61 E.03385
; LINE_WIDTH: 0.412027
G1 F7314.958
G1 X112.001 Y136.417 E.00567
; LINE_WIDTH: 0.44636
G1 F6692.445
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480694
G1 F6167.575
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.50746
G1 F5812.201
G1 X111.958 Y135.533 E.01819
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.477 Y132.436 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.88 Y132.547 I-.062 J1.327 E.0197
G1 X109.973 Y133.001 E.03262
G1 X108.95 Y131.978 E.0465
G1 X108.95 Y131.698 E.00902
G1 X112.05 Y128.598 E.14095
G1 X112.05 Y127.394 E.03871
G1 X111.625 Y127.394 E.01365
; WIPE_START
G1 X112.05 Y127.394 E-.16127
G1 X112.05 Y128.598 E-.45749
G1 X111.787 Y128.861 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.622 Y136.18 Z3.4 F42000
G1 X108.406 Y140.293 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109878
G1 F15000
M204 S6000
G2 X108.59 Y140.386 I1.731 J-3.189 E.00109
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.293 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/25
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z3.4 I.948 J.764 P1  F42000
G1 X133.181 Y109.554 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.513 J.052 E.02204
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-1.939 J-.353 E.01733
G3 X134.401 Y110.985 I-.736 J-.59 E.01599
G3 X133.699 Y110.768 I-.239 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.179 Y109.614 I.469 J-.214 E.00632
M204 S10000
G1 X132.79 Y109.486 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.785 Y109.518 E.00104
G2 X132.866 Y109.978 I.891 J.08 E.01522
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.991 J-2.325 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.598 J1.507 E.01704
G2 X134.847 Y112.398 I.693 J.294 E.02338
G1 X114.487 Y112.398 E.65471
G2 X114.241 Y112.415 I-.023 J1.413 E.00792
G2 X112.447 Y114.025 I.289 J2.127 E.08229
G1 X108.602 Y114.025 E.12365
G1 X108.602 Y109.911 E.13228
G2 X109.973 Y108.602 I-1.409 J-2.849 E.06191
G1 X133.246 Y108.602 E.74837
G1 X133.291 Y108.79 E.00622
G2 X132.815 Y109.353 I.385 J.807 E.02443
G1 X132.801 Y109.427 E.00241
; WIPE_START
G1 X132.785 Y109.518 E-.03509
G1 X132.785 Y109.685 E-.06345
G1 X132.816 Y109.849 E-.06347
G1 X132.866 Y109.978 E-.05282
G1 X133.356 Y110.959 E-.41655
G1 X133.427 Y111.074 E-.05132
G1 X133.536 Y111.194 E-.06165
G1 X133.568 Y111.219 E-.01564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.419 J.527 E.0112
G1 X137.386 Y110.09 E.01705
G3 X137.521 Y110.128 I-.007 J.282 E.00421
G1 X139.929 Y111.633 E.08457
G1 X140.217 Y111.924 E.01221
G3 X140.217 Y112.276 I-.28 J.176 E.01105
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.723 Y112.61 E.12082
G3 X135.564 Y112.558 I.017 J-.321 E.00505
G1 X135.206 Y112.203 E.01503
G3 X135.131 Y111.996 I.266 J-.213 E.00667
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07302
G1 X136.243 Y110.46 E-.65243
G1 X136.307 Y110.396 E-.03454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.695 I-.738 J-.283 E.02356
G1 X140.175 Y111.325 E.01676
G1 X137.701 Y109.778 E.0938
G2 X137.415 Y109.698 I-.301 J.52 E.00968
G1 X136.795 Y109.698 E.01994
G2 X136.207 Y109.941 I.01 J.855 E.02094
G1 X135.949 Y110.2 E.01176
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.663 J-.85 E.02181
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.858 J1.576 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.919 Y109.072 E.01829
G2 X142.966 Y112.189 I67.635 J-103.883 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.285 Y112.443 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.335 I-.273 J-.119 E.00331
G1 X147.31 Y108.21 E.12287
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.795 Y114.386 I.008 J1.712 E.07641
G1 X112.793 Y114.417 E.00093
G1 X108.21 Y114.417 E.13653
G1 X108.21 Y114.386 E.00093
G1 X108.21 Y109.653 E.14097
G2 X109.734 Y108.21 I-.967 J-2.548 E.06418
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.0004
G2 X137.811 Y108.41 I.337 J-.037 E.00615
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.024 Y112.621 E.07491
G2 X147.256 Y112.495 I-.011 J-.298 E.00815
; WIPE_START
M204 S6000
G1 X147.31 Y112.335 E-.06431
G1 X147.31 Y110.504 E-.69569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.437 Y112.594 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131993
G1 F15000
M204 S6000
G2 X147.531 Y112.531 I-.288 J-.533 E.0008
G1 X147.55 Y112.357 E.00123
G1 X147.55 Y108.406 E.0278
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.702 Y111.29 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.33917
G1 F9113.947
M204 S6000
G2 X139.999 Y110.806 I-3.917 J4.936 E.01998
M73 P78 R2
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.33081
G1 F9378.59
G1 X137.928 Y109.597 E.0046
; LINE_WIDTH: 0.300137
G1 F10496.989
G1 X137.727 Y109.569 E.00411
M204 S10000
G1 X137.659 Y109.51 F42000
; LINE_WIDTH: 0.151565
G1 F15000
M204 S6000
G1 X138.579 Y109.733 E.00813
M204 S10000
G1 X140.441 Y110.905 F42000
; LINE_WIDTH: 0.100483
G1 F15000
M204 S6000
G1 X140.747 Y111.596 E.00344
M204 S10000
G1 X141.014 Y112.026 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38044
G1 F7999.526
M204 S6000
G1 X141.975 Y112.026 E.02562
G1 X141.189 Y111.552 E.02446
G1 X141.218 Y111.778 E.00608
G1 X140.999 Y111.903 E.00671
G1 X141.007 Y111.966 E.0017
; WIPE_START
G1 X140.999 Y111.903 E-.02423
G1 X141.218 Y111.778 E-.0957
G1 X141.189 Y111.552 E-.08661
G1 X141.975 Y112.026 E-.34865
G1 X141.436 Y112.026 E-.20482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.628 Y110.248 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124535
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00064
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52182
G1 F5637.924
M204 S6000
G1 X135.906 Y109.521 E.00726
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.50849
G1 F5799.343
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.47733
G1 F6215.327
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443145
G1 F6746.206
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390043
G1 F7778.221
G1 X136.785 Y109.322 E.00693
G1 X137.318 Y109.322 E.01462
G1 X137.362 Y109.141 E.00512
G1 X137.419 Y109.104 E.00186
G1 X137.293 Y108.978 E.00487
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405935
G1 F7437.71
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.443145
G1 F6746.206
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.475723
G1 F6238.412
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511862
G1 F5757.643
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.0183
; WIPE_START
G1 X135.474 Y109.043 E-.44572
G1 X135.822 Y109.029 E-.31428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
M204 S10000
G1 X132.906 Y108.806 F42000
; LINE_WIDTH: 0.108125
G1 F15000
M204 S6000
G1 X132.84 Y108.839 E.00039
G2 X132.793 Y108.907 I.026 J.068 E.00045
; WIPE_START
G1 X132.84 Y108.839 E-.39865
G1 X132.906 Y108.806 E-.36135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.152 Y111.003 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.115958
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.154026
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.111362
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140245
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.521 Y112.586 Z3.6 F42000
G1 X112.773 Y112.773 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.623 Y109.623 E.14325
G3 X108.95 Y110.112 I-2.383 J-2.569 E.0268
G1 X108.95 Y113.676 E.11463
G1 X111.62 Y113.676 E.08584
G1 X116.346 Y108.95 E.21492
G1 X116.626 Y108.95 E.00902
G1 X119.731 Y112.055 E.1412
G1 X120.917 Y112.055 E.03815
G1 X124.022 Y108.95 E.14118
G1 X124.302 Y108.95 E.00902
G1 X127.404 Y112.052 E.14107
G1 X128.596 Y112.052 E.03833
G1 X131.698 Y108.95 E.14105
G1 X131.978 Y108.95 E.00902
G1 X132.448 Y109.42 E.02138
G2 X132.547 Y110.12 I1.908 J.087 E.02284
G1 X132.955 Y110.935 E.0293
; WIPE_START
G1 X132.547 Y110.12 E-.34629
G1 X132.437 Y109.717 E-.15852
G1 X132.448 Y109.42 E-.11294
G1 X132.184 Y109.156 E-.14224
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.212 Y112.263 Z3.6 F42000
G1 X112.398 Y117.976 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.025 E.16234
G1 X108.602 Y123.025 E.12206
G1 X108.602 Y117.976 E.16234
G1 X112.338 Y117.976 E.12013
M204 S10000
G1 X112.79 Y117.613 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.386 E.17194
G1 X112.79 Y123.417 E.00093
G1 X108.21 Y123.417 E.13642
G1 X108.21 Y123.386 E.00093
G1 X108.21 Y117.613 E.17194
G1 X108.21 Y117.584 E.00087
G1 X112.759 Y117.584 E.13551
; WIPE_START
M204 S6000
G1 X112.77 Y119.584 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y122.394 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y122.676 E.0091
G1 X110.296 Y122.676 E.04327
G1 X112.05 Y120.922 E.07976
G1 X112.05 Y119.726 E.03849
G1 X110.648 Y118.324 E.06373
G1 X109.02 Y118.324 E.05236
; WIPE_START
G1 X110.648 Y118.324 E-.61876
G1 X110.911 Y118.587 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.269 Y126.192 Z3.6 F42000
G1 X109.624 Y133.832 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.587 Y133.964 E.00441
G2 X109.653 Y134.552 I.898 J.197 E.01939
G2 X109.879 Y134.97 I2.34 J-.998 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.791 I-1.507 J1.595 E.01715
G2 X108.602 Y134.834 I-.301 J.777 E.02315
G1 X108.602 Y126.976 E.25269
G1 X112.398 Y126.976 E.12206
G1 X112.398 Y133.246 E.20161
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.807 J.385 E.04503
G1 X110.041 Y133.356 E.03525
G2 X109.65 Y133.777 I.444 J.805 E.01881
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.406 Y133.176 I.222 J.486 E.00692
G3 X111.902 Y133.591 I-.027 J.537 E.02067
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01608
G1 X111.103 Y134.97 E.01776
G3 X110.868 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.353 J-1.941 E.01733
G3 X110.015 Y134.4 I.59 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01182
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09163
G1 X110.232 Y133.699 E-.06575
G1 X111.181 Y133.224 E-.40292
G1 X111.259 Y133.194 E-.03214
G1 X111.406 Y133.176 E-.05606
G1 X111.539 Y133.193 E-.05109
G1 X111.682 Y133.264 E-.06041
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.857 J-1.675 E.02197
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.575 J-3.855 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.507 J68.757 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.6 E.09351
G2 X109.351 Y140.503 I.302 J-.61 E.02572
G1 X109.681 Y140.167 E.01517
G1 X111.222 Y137.703 E.09345
G2 X111.302 Y137.416 I-.521 J-.301 E.00967
G1 X111.302 Y136.796 E.01994
G2 X111.059 Y136.209 I-.917 J.036 E.02088
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.601 Y135.368 E-.16611
G1 X110.856 Y135.414 E-.09814
G1 X111.004 Y135.406 E-.05645
G1 X111.264 Y135.328 E-.10329
G1 X111.946 Y134.973 E-.29216
G1 X112.031 Y134.895 E-.04386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.195 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.76 Y140.239 I-.212 J-.299 E.01073
G3 X108.466 Y139.965 I.634 J-.974 E.01203
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.958 Y135.127 I.195 J.19 E.00542
G3 X109.189 Y135.183 I.042 J.332 E.00727
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.383 J.36 E.0113
G1 X110.91 Y137.388 E.01705
G3 X110.872 Y137.522 I-.283 J-.007 E.00421
G1 X109.372 Y139.923 E.08431
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.015 Y140.251 E-.06218
G1 X108.935 Y140.269 E-.03107
G1 X108.856 Y140.269 E-.02999
G1 X108.76 Y140.239 E-.03833
G1 X108.466 Y139.965 E-.15264
G1 X108.41 Y139.88 E-.03852
G1 X108.39 Y139.781 E-.03858
G1 X108.39 Y138.811 E-.36869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.532 Y146.442 Z3.6 F42000
G1 X108.547 Y147.262 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.143 J-.271 E.00415
G1 X112.79 Y147.309 E.12241
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.613 E.63079
G1 X108.21 Y126.584 E.00087
G1 X112.79 Y126.584 E.13642
G1 X112.79 Y126.613 E.00087
G1 X112.79 Y138.226 E.34591
G2 X112.619 Y138.305 I.064 J.364 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
M73 P79 R2
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.497 Y147.229 I.306 J-.007 E.0079
M204 S10000
G1 X108.406 Y147.51 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171708
G1 F15000
M204 S6000
G1 X108.56 Y147.537 E.00159
; LINE_WIDTH: 0.138383
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54738
G1 F5352.258
M204 S6000
G1 X109.709 Y140.789 E.00717
G1 X109.38 Y141.023 E.01606
G1 X109.058 Y141.087 E.0131
G1 X109.058 Y142.216 E.04497
G1 X109.83 Y140.936 E.05955
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626269
G1 F4628.453
M204 S6000
G1 X111.516 Y138.177 E.12521
; WIPE_START
G1 X110.449 Y139.869 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.12302
G1 F15000
M204 S6000
G1 X110.778 Y135.674 E.00136
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114035
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148263
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.474 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516426
G1 F5702.144
M204 S6000
G1 X111.458 Y135.715 E.02074
G1 X111.471 Y135.935 E.00824
G1 X111.429 Y135.971 E.00208
G1 X111.529 Y136.116 E.0066
; LINE_WIDTH: 0.480714
G1 F6167.294
G1 X111.575 Y136.283 E.00599
; LINE_WIDTH: 0.44636
G1 F6692.445
G1 X111.621 Y136.45 E.00552
; LINE_WIDTH: 0.401496
G1 F7529.789
G1 X111.667 Y136.617 E.00491
G1 X111.658 Y137.616 E.02829
G1 X111.604 Y137.777 E.00482
G1 X111.875 Y137.949 E.0091
G1 X112.013 Y137.812 E.00549
G1 X112.018 Y136.621 E.03373
; LINE_WIDTH: 0.412015
G1 F7315.189
G1 X112.001 Y136.424 E.00578
; LINE_WIDTH: 0.446365
G1 F6692.362
G1 X111.984 Y136.226 E.00632
; LINE_WIDTH: 0.480715
G1 F6167.271
G1 X111.967 Y136.029 E.00685
; LINE_WIDTH: 0.507545
G1 F5811.138
G1 X111.958 Y135.534 E.01818
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.459 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.696 Y127.324 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X112.05 Y127.324 E.01139
G1 X112.05 Y128.598 E.04097
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
G3 X111.283 Y132.436 I2.086 J3.037 E.04616
G1 X111.477 Y132.436 E.00626
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6632.609
G1 X111.283 Y132.436 E-.07394
G1 X110.88 Y132.547 E-.15861
G1 X109.973 Y133.001 E-.38554
G1 X109.709 Y132.737 E-.14191
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/25
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z3.6 I.855 J.866 P1  F42000
G1 X133.181 Y109.554 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.513 J.051 E.02205
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.563 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.513 J.233 E.00724
G3 X134.835 Y110.681 I-1.939 J-.353 E.01733
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.178 Y109.614 I.469 J-.214 E.00632
M204 S10000
G1 X132.79 Y109.486 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.785 Y109.518 E.00104
G2 X132.866 Y109.978 I.891 J.08 E.01523
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.99 J-2.323 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.594 J1.504 E.01703
G2 X134.838 Y112.398 I.763 J.297 E.02321
G1 X114.487 Y112.398 E.65443
G2 X112.43 Y114.131 I.035 J2.128 E.0936
G1 X108.602 Y114.131 E.1231
G1 X108.602 Y109.911 E.13569
G2 X109.091 Y109.617 I-2.294 J-4.371 E.01836
G2 X109.973 Y108.602 I-2.093 J-2.71 E.04353
G1 X133.246 Y108.602 E.74837
G1 X133.291 Y108.79 E.00622
G2 X132.815 Y109.353 I.385 J.807 E.02442
G1 X132.801 Y109.427 E.00241
; WIPE_START
G1 X132.785 Y109.518 E-.0351
G1 X132.785 Y109.685 E-.0635
G1 X132.816 Y109.849 E-.06349
G1 X132.866 Y109.978 E-.05282
G1 X133.356 Y110.959 E-.41654
G1 X133.435 Y111.085 E-.05654
G1 X133.561 Y111.214 E-.0686
G1 X133.568 Y111.219 E-.00341
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.129 Y111.946 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.316 J.045 E.00437
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.419 J.527 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.258 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.224 Y111.931 E.01249
G3 X140.217 Y112.276 I-.373 J.165 E.01061
G1 X139.964 Y112.533 E.01076
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.721 Y112.61 E.12089
G3 X135.56 Y112.554 I.012 J-.292 E.00515
G1 X135.206 Y112.203 E.01486
G3 X135.126 Y112.006 I.24 J-.211 E.00644
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07726
G1 X136.243 Y110.46 E-.65245
G1 X136.299 Y110.404 E-.03029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.561 Y111.714 I-.803 J-.286 E.02268
G1 X140.175 Y111.325 E.01765
G1 X137.72 Y109.79 E.0931
G2 X137.428 Y109.698 I-.306 J.462 E.00999
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.672 J-.853 E.02181
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.868 J1.582 E.02476
G2 X134.648 Y108.79 I-.756 J.603 E.01358
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.919 Y109.072 E.01829
G2 X142.966 Y112.189 I67.641 J-103.893 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.272 Y112.455 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.281 J-.152 E.00413
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.792 Y114.458 I.02 J1.724 E.07841
G1 X112.79 Y114.495 E.00112
M106 S255
G1 X112.79 Y114.523 E.00082
M106 S96.9
M106 S255
G1 X108.21 Y114.523 E.13642
M106 S96.9
G1 X108.21 Y114.458 E.00194
G1 X108.21 Y109.653 E.14312
G2 X109.734 Y108.21 I-.967 J-2.548 E.06418
G1 X137.73 Y108.21 E.83388
G1 X137.729 Y108.223 E.0004
G2 X137.811 Y108.41 I.337 J-.037 E.00615
G1 X138.165 Y108.765 E.01494
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.024 Y112.621 E.0749
G2 X147.238 Y112.505 I-.033 J-.318 E.00746
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07438
G1 X147.31 Y110.519 E-.68562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.518 Y112.594 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13204
G1 F15000
M204 S6000
G1 X147.55 Y112.334 E.00184
G1 X147.55 Y108.406 E.02765
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.029 Y112.017 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39743
G1 F7616.147
M204 S6000
G1 X141.944 Y112.017 E.02561
G1 X141.263 Y111.607 E.02225
G1 X141.023 Y111.957 E.01189
M204 S10000
G1 X140.904 Y111.449 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.428328
G1 F7005.571
M204 S6000
G1 X140.739 Y111.319 E.00639
; LINE_WIDTH: 0.393481
G1 F7701.947
G1 X140.574 Y111.189 E.00581
; LINE_WIDTH: 0.338527
G1 F9133.755
G2 X139.999 Y110.806 I-3.973 J5.333 E.01613
G1 X138.128 Y109.626 E.05165
; LINE_WIDTH: 0.3308
G1 F9378.933
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300133
G1 F10497.135
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.169044
G1 F15000
M204 S6000
G1 X138.617 Y109.758 E.00972
; WIPE_START
G1 X137.674 Y109.511 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.407 Y111.207 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.153965
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115938
G1 X135.153 Y111.003 E.00094
M204 S10000
G1 X135.628 Y110.248 F42000
; LINE_WIDTH: 0.124597
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00065
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521668
G1 F5639.709
M204 S6000
G1 X135.906 Y109.521 E.00727
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508403
G1 F5800.433
G1 X136.13 Y109.482 E.00644
; LINE_WIDTH: 0.477328
G1 F6215.362
G1 X136.285 Y109.4 E.00601
; LINE_WIDTH: 0.443175
G1 F6745.699
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.39002
G1 F7778.745
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.138 E.00523
G1 X137.427 Y109.112 E.00139
M73 P80 R2
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405945
G1 F7437.504
G1 X136.477 Y108.996 E.00882
; LINE_WIDTH: 0.443175
G1 F6745.699
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.475705
G1 F6238.664
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511695
G1 F5759.694
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.01829
; WIPE_START
G1 X135.474 Y109.043 E-.44567
G1 X135.822 Y109.029 E-.31433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
M204 S10000
G1 X132.915 Y108.806 F42000
; LINE_WIDTH: 0.110054
G1 F15000
M204 S6000
G2 X132.793 Y108.907 I.013 J.14 E.0009
; WIPE_START
G1 X132.833 Y108.842 E-.35145
G1 X132.915 Y108.806 E-.40855
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.955 Y110.935 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G3 X132.436 Y109.486 I2.168 J-1.593 E.05019
G1 X132.448 Y109.42 E.00213
G1 X131.978 Y108.95 E.02138
G1 X131.698 Y108.95 E.00902
G1 X128.596 Y112.052 E.14105
G1 X127.404 Y112.052 E.03833
G1 X124.302 Y108.95 E.14107
G1 X124.022 Y108.95 E.00902
G1 X120.917 Y112.055 E.14118
G1 X119.731 Y112.055 E.03815
G1 X116.626 Y108.95 E.1412
G1 X116.346 Y108.95 E.00902
G1 X111.514 Y113.782 E.21974
G1 X108.95 Y113.782 E.08243
G1 X108.95 Y110.112 E.11804
G2 X109.623 Y109.623 I-1.704 J-3.05 E.0268
G1 X112.773 Y112.773 E.14325
; WIPE_START
G1 X111.358 Y111.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.398 Y117.87 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.131 E.16916
G1 X108.602 Y123.131 E.12206
G1 X108.602 Y117.87 E.16916
G1 X112.338 Y117.87 E.12013
M204 S10000
G1 X112.79 Y117.543 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.458 E.17618
G1 X112.79 Y123.523 E.00194
M106 S255
G1 X108.21 Y123.523 E.13642
M106 S96.9
G1 X108.21 Y123.458 E.00194
G1 X108.21 Y117.543 E.17618
G1 X108.21 Y117.478 E.00193
M106 S255
G1 X112.79 Y117.478 E.13642
M106 S96.9
G1 X112.79 Y117.483 E.00015
; WIPE_START
M204 S6000
G1 X112.79 Y119.483 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y118.255 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X110.542 Y118.218 E.05121
G1 X112.05 Y119.726 E.06855
G1 X112.05 Y120.922 E.03849
G1 X110.19 Y122.782 E.08458
G1 X108.95 Y122.782 E.03985
G1 X108.95 Y122.393 E.01251
; WIPE_START
G1 X108.95 Y122.782 E-.14779
G1 X110.19 Y122.782 E-.47097
G1 X110.453 Y122.52 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.885 Y130.131 Z3.8 F42000
G1 X109.603 Y133.907 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.591 Y133.95 E.00144
G2 X109.653 Y134.552 I.898 J.212 E.01982
G2 X109.879 Y134.97 I2.344 J-1.001 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.791 I-1.512 J1.602 E.01715
G2 X108.602 Y134.834 I-.302 J.779 E.02315
G1 X108.602 Y126.87 E.25608
G1 X112.398 Y126.87 E.12206
G1 X112.398 Y133.246 E.20502
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.807 J.384 E.04504
G1 X110.041 Y133.356 E.03524
G2 X109.711 Y133.667 I.448 J.807 E.01474
G1 X109.628 Y133.853 E.00655
M204 S10000
G1 X109.973 Y134.041 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.515 J.122 E.01317
G1 X111.181 Y133.224 E.03158
G3 X111.408 Y133.176 I.222 J.486 E.00698
G3 X111.902 Y133.591 I-.03 J.537 E.0206
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.971 E.01776
G3 X110.868 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.353 J-1.939 E.01733
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.962 Y134.1 I.473 J-.238 E.00923
; WIPE_START
M204 S6000
G1 X110.038 Y133.876 E-.08986
G1 X110.094 Y133.803 E-.03483
G1 X110.232 Y133.699 E-.06581
G1 X111.181 Y133.224 E-.40288
G1 X111.259 Y133.194 E-.03215
G1 X111.408 Y133.176 E-.05688
G1 X111.539 Y133.193 E-.05028
G1 X111.604 Y133.225 E-.02731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.86 J-1.684 E.02197
G2 X111.264 Y135.328 I.006 J-.988 E.01353
G2 X111.946 Y134.973 I-1.578 J-3.862 E.02476
G2 X112.21 Y134.647 I-.601 J-.755 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01963
G2 X108.781 Y143.557 I105.514 J68.76 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.09313
G2 X109.35 Y140.503 I.278 J-.716 E.02542
G1 X109.681 Y140.167 E.01517
G1 X111.222 Y137.702 E.09347
G2 X111.302 Y137.415 I-.519 J-.299 E.00969
G1 X111.302 Y136.796 E.0199
G2 X111.059 Y136.209 I-.918 J.036 E.02087
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.6 Y135.368 E-.16568
G1 X110.856 Y135.414 E-.09856
G1 X111.004 Y135.406 E-.05648
G1 X111.264 Y135.328 E-.10325
G1 X111.946 Y134.973 E-.29216
G1 X112.031 Y134.895 E-.04386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.196 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.698 Y140.196 I-.203 J-.242 E.01311
G1 X108.466 Y139.965 E.00975
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.855 Y135.162 E.01612
G3 X109.19 Y135.183 I.15 J.273 E.01054
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.384 J.36 E.0113
G1 X110.91 Y137.387 E.01704
G3 X110.872 Y137.522 I-.281 J-.006 E.00421
G1 X109.372 Y139.923 E.08432
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.014 Y140.251 E-.06218
G1 X108.935 Y140.269 E-.03105
G1 X108.786 Y140.251 E-.05713
G1 X108.698 Y140.196 E-.03949
G1 X108.466 Y139.965 E-.12437
G1 X108.41 Y139.88 E-.03855
G1 X108.39 Y139.781 E-.03855
G1 X108.39 Y138.81 E-.36868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.552 Y146.441 Z3.8 F42000
G1 X108.569 Y147.27 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.669 Y147.297 I.132 J-.29 E.00308
G1 X112.79 Y147.309 E.12276
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.543 E.63288
G1 X108.21 Y126.478 E.00193
M106 S255
G1 X112.79 Y126.478 E.13642
M106 S96.9
G1 X112.79 Y126.543 E.00193
G1 X112.79 Y138.226 E.348
G2 X112.619 Y138.305 I.069 J.373 E.00567
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.0784
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.517 Y147.24 I.318 J-.018 E.00852
M204 S10000
G1 X108.406 Y147.422 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139923
G1 F15000
M204 S6000
G1 X108.475 Y147.524 E.00095
G2 X108.646 Y147.543 I.251 J-1.475 E.00132
G1 X112.594 Y147.549 E.03025
; WIPE_START
G1 X110.594 Y147.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54734
G1 F5352.682
M204 S6000
G1 X109.709 Y140.789 E.00717
G1 X109.38 Y141.023 E.01608
G1 X109.058 Y141.087 E.01308
G1 X109.058 Y142.216 E.04497
G1 X109.83 Y140.936 E.05955
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626251
G1 F4628.589
M204 S6000
G1 X111.516 Y138.177 E.12523
; WIPE_START
G1 X110.449 Y139.869 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.123027
G1 F15000
M204 S6000
G1 X110.779 Y135.675 E.00135
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114043
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148281
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516395
G1 F5702.518
M204 S6000
G1 X111.458 Y135.715 E.02073
G1 X111.471 Y135.934 E.00823
G1 X111.428 Y135.971 E.00209
G1 X111.529 Y136.116 E.00661
; LINE_WIDTH: 0.480724
G1 F6167.153
G1 X111.575 Y136.283 E.00599
; LINE_WIDTH: 0.44637
G1 F6692.279
G1 X111.621 Y136.45 E.00552
; LINE_WIDTH: 0.401367
G1 F7532.502
G1 X111.667 Y136.617 E.0049
G1 X111.659 Y137.613 E.02819
G1 X111.604 Y137.777 E.00491
G1 X111.876 Y137.949 E.00911
G1 X112.013 Y137.812 E.00548
G1 X112.018 Y136.621 E.03373
; LINE_WIDTH: 0.412025
G1 F7314.992
G1 X112.001 Y136.423 E.00577
; LINE_WIDTH: 0.446375
G1 F6692.196
G1 X111.984 Y136.226 E.00631
; LINE_WIDTH: 0.480725
G1 F6167.129
G1 X111.967 Y136.029 E.00685
; LINE_WIDTH: 0.507525
G1 F5811.388
G1 X111.958 Y135.533 E.01818
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.459 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.238 Y127.218 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X111.866 Y127.218 E.05236
G1 X112.05 Y127.402 E.00833
G1 X112.05 Y128.598 E.03849
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
G3 X111.283 Y132.436 I2.086 J3.038 E.04616
G1 X111.477 Y132.436 E.00625
; WIPE_START
G1 X111.283 Y132.436 E-.07391
G1 X110.88 Y132.547 E-.15866
G1 X109.973 Y133.001 E-.38552
G1 X109.709 Y132.737 E-.14192
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.413 Y140.258 Z3.8 F42000
G1 X108.406 Y140.299 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0982838
G1 F15000
M204 S6000
G2 X108.585 Y140.384 I1.222 J-2.345 E.00087
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.299 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/25
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S94.35
; OBJECT_ID: 75
M204 S10000
G17
G3 Z3.8 I.948 J.764 P1  F42000
G1 X133.178 Y109.554 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X133.676 Y109.09 I.51 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-1.939 J-.353 E.01733
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.176 Y109.614 I.463 J-.218 E.00634
M204 S10000
G1 X132.79 Y109.487 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.788 Y109.518 E.00099
G2 X132.866 Y109.978 I.917 J.082 E.01518
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.967 Y111.123 I-.992 J-2.327 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.79 Y111.701 I1.584 J1.496 E.01705
G2 X134.847 Y112.398 I.691 J.294 E.02338
G1 X114.487 Y112.398 E.65472
G2 X112.41 Y114.281 I.017 J2.105 E.09866
G1 X108.602 Y114.281 E.12245
G1 X108.602 Y109.911 E.14053
G2 X109.973 Y108.602 I-1.408 J-2.847 E.0619
G1 X133.246 Y108.602 E.74836
G1 X133.299 Y108.774 E.00578
G2 X132.818 Y109.354 I.406 J.826 E.02499
G1 X132.803 Y109.428 E.00244
; WIPE_START
G1 X132.788 Y109.518 E-.03444
G1 X132.785 Y109.685 E-.06335
G1 X132.816 Y109.849 E-.06347
G1 X132.866 Y109.978 E-.05285
G1 X133.356 Y110.959 E-.41652
G1 X133.427 Y111.074 E-.05132
G1 X133.536 Y111.194 E-.06167
G1 X133.57 Y111.221 E-.01639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.811 I.337 J.053 E.00403
G1 X136.243 Y110.46 E.05115
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.419 J.528 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.00431
G1 X139.928 Y111.633 E.08434
G1 X140.217 Y111.924 E.01221
G3 X140.226 Y112.267 I-.344 J.181 E.01058
G1 X139.964 Y112.533 E.01114
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.721 Y112.61 E.12089
G3 X135.56 Y112.554 I.012 J-.293 E.00515
G1 X135.206 Y112.203 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00667
; WIPE_START
M204 S6000
G1 X135.182 Y111.811 E-.07292
G1 X136.243 Y110.46 E-.65249
G1 X136.307 Y110.396 E-.03459
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.596 Y112.398 E.07628
G2 X140.541 Y111.694 I-.663 J-.303 E.02369
G1 X140.175 Y111.325 E.01674
G1 X137.72 Y109.79 E.09311
G2 X137.427 Y109.698 I-.306 J.464 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.679 J-.855 E.02181
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.865 J1.58 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01358
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
M73 P81 R2
G1 X137.516 Y108.67 E.00275
G1 X137.919 Y109.072 E.0183
G2 X142.966 Y112.189 I67.665 J-103.93 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.272 Y112.456 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.279 J-.152 E.00414
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.816 Y114.203 I.009 J1.715 E.07094
G1 X112.79 Y114.564 E.01077
M106 S255
G1 F3753.592
G1 X112.79 Y114.673 E.00327
M106 S94.35
M106 S255
G1 F2880
G1 X108.21 Y114.673 E.13642
M106 S94.35
M106 S255
G1 F3753.592
G1 X108.21 Y114.564 E.00327
M106 S94.35
G1 F7160.291
G1 X108.21 Y114.164 E.01191
G1 X108.21 Y109.653 E.13436
G2 X109.734 Y108.21 I-.967 J-2.548 E.06418
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.0004
G2 X137.811 Y108.41 I.338 J-.037 E.00615
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14003
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07455
G2 X147.238 Y112.506 I-.019 J-.317 E.0078
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07446
G1 X147.31 Y110.519 E-.68554
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.518 Y112.594 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132041
G1 F15000
M204 S6000
G1 X147.55 Y112.334 E.00184
G1 X147.55 Y108.406 E.02765
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.702 Y111.29 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.339207
G1 F9112.81
M204 S6000
G2 X139.999 Y110.806 I-3.922 J4.941 E.02
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330799
G1 F9378.968
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300133
G1 F10497.149
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168679
G1 F15000
M204 S6000
G1 X138.618 Y109.758 E.0097
M204 S10000
G1 X140.441 Y110.905 F42000
; LINE_WIDTH: 0.101248
G1 F15000
M204 S6000
G1 X140.748 Y111.599 E.00349
M204 S10000
G1 X141.014 Y112.026 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38008
G1 F8008.068
M204 S6000
G1 X141.975 Y112.026 E.02561
G1 X141.188 Y111.552 E.02446
G1 X141.219 Y111.779 E.00612
G1 X140.999 Y111.905 E.00674
G1 X141.007 Y111.966 E.00164
; WIPE_START
G1 X140.999 Y111.905 E-.02345
G1 X141.219 Y111.779 E-.09614
G1 X141.188 Y111.552 E-.08727
G1 X141.975 Y112.026 E-.34906
G1 X141.438 Y112.026 E-.20408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.628 Y110.247 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124596
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00065
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521665
G1 F5639.75
M204 S6000
G1 X135.906 Y109.521 E.00727
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508395
G1 F5800.526
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477305
G1 F6215.685
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443153
G1 F6746.079
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390024
G1 F7778.646
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01508
G1 X137.383 Y109.138 E.00523
G1 X137.427 Y109.112 E.0014
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405938
G1 F7437.659
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.443153
G1 F6746.079
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.47568
G1 F6239.024
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511682
G1 F5759.852
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.01829
; WIPE_START
G1 X135.474 Y109.043 E-.44563
G1 X135.822 Y109.029 E-.31437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.466 Y108.65 E.03904
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.153 Y111.003 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.115935
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.153959
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.387 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.111275
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.139987
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.521 Y112.584 Z4 F42000
G1 X112.766 Y112.766 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.623 Y109.623 E.14295
G3 X108.95 Y110.12 I-4.129 J-4.881 E.0269
G1 X108.95 Y113.933 E.12263
G1 X111.363 Y113.933 E.07758
G1 X116.346 Y108.95 E.2266
G1 X116.626 Y108.95 E.00902
G1 X119.731 Y112.055 E.1412
G1 X120.917 Y112.055 E.03815
G1 X124.022 Y108.95 E.14118
G1 X124.302 Y108.95 E.00902
G1 X127.404 Y112.052 E.14107
G1 X128.596 Y112.052 E.03833
G1 X131.698 Y108.95 E.14105
G1 X131.978 Y108.95 E.00902
G1 X132.448 Y109.42 E.02138
G2 X132.547 Y110.12 I1.908 J.086 E.02284
G1 X132.955 Y110.935 E.0293
; WIPE_START
G1 X132.547 Y110.12 E-.34628
G1 X132.437 Y109.717 E-.15854
G1 X132.448 Y109.42 E-.11293
G1 X132.184 Y109.156 E-.14225
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.179 Y112.187 Z4 F42000
G1 X112.398 Y117.719 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.281 E.17888
G1 X108.602 Y123.281 E.12206
G1 X108.602 Y117.719 E.17888
G1 X112.338 Y117.719 E.12013
M204 S10000
G1 X112.79 Y117.437 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.164 E.17058
G1 X112.79 Y123.564 E.01191
M106 S255
G1 F3753.592
G1 X112.79 Y123.673 E.00327
M106 S94.35
M106 S255
G1 F2880
G1 X108.21 Y123.673 E.13642
M106 S94.35
M106 S255
G1 F3753.592
G1 X108.21 Y123.564 E.00327
M106 S94.35
G1 F7160.291
G1 X108.21 Y123.164 E.01191
G1 X108.21 Y117.837 E.15867
G1 X108.21 Y117.437 E.01191
M106 S255
G1 F3759.961
G1 X108.21 Y117.327 E.00329
M106 S94.35
M106 S255
G1 F2880
G1 X112.79 Y117.327 E.13642
M106 S94.35
M106 S255
G1 F3267.449
G1 X112.79 Y117.377 E.0015
M106 S94.35
; WIPE_START
M204 S6000
G1 X112.79 Y119.377 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y122.393 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y122.933 E.01735
G1 X110.039 Y122.933 E.03501
G1 X112.05 Y120.922 E.09144
G1 X112.05 Y119.726 E.03849
G1 X110.391 Y118.067 E.07543
G1 X108.95 Y118.067 E.04632
G1 X108.95 Y118.255 E.00604
; WIPE_START
G1 X108.95 Y118.067 E-.07133
G1 X110.391 Y118.067 E-.54743
G1 X110.654 Y118.33 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.156 Y125.946 Z4 F42000
G1 X109.643 Y133.786 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.636 Y133.809 E.0008
G2 X109.653 Y134.552 I.85 J.352 E.0246
G2 X109.879 Y134.97 I2.342 J-1 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.511 J1.6 E.01713
G2 X108.602 Y134.833 I-.303 J.779 E.02316
G1 X108.602 Y126.719 E.26093
G1 X112.398 Y126.719 E.12206
G1 X112.398 Y133.246 E.20989
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.812 J.397 E.0449
G1 X110.041 Y133.356 E.03525
G2 X109.71 Y133.666 I.444 J.805 E.01475
G1 X109.673 Y133.733 E.00247
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.352 Y133.176 I.214 J.434 E.00534
G3 X111.902 Y133.591 I.027 J.537 E.02227
G3 X111.91 Y134.262 I-3.613 J.377 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01609
G1 X111.103 Y134.97 E.01776
G3 X110.868 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.353 J-1.939 E.01733
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01183
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09161
G1 X110.232 Y133.699 E-.06577
G1 X111.181 Y133.224 E-.40291
G1 X111.352 Y133.176 E-.06771
G1 X111.535 Y133.192 E-.06974
G1 X111.682 Y133.264 E-.06226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.862 J-1.691 E.02197
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.579 J-3.862 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01358
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01965
G2 X108.781 Y143.557 I105.49 J68.746 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.597 E.0936
G2 X109.35 Y140.503 I.306 J-.594 E.02577
G1 X109.681 Y140.167 E.01517
G1 X111.225 Y137.697 E.09365
G2 X111.302 Y137.401 I-.476 J-.282 E.00999
G2 X111.288 Y136.649 I-3.827 J-.302 E.02421
G2 X111.059 Y136.209 I-.965 J.222 E.01613
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.599 Y135.368 E-.16523
G1 X110.856 Y135.414 E-.09901
G1 X111.004 Y135.406 E-.05643
G1 X111.264 Y135.328 E-.10329
G1 X111.946 Y134.973 E-.29221
G1 X112.031 Y134.895 E-.04384
; WIPE_END
M73 P82 R2
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.196 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.744 Y140.231 I-.211 J-.298 E.01125
G3 X108.466 Y139.964 I1.05 J-1.372 E.01149
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.261 J0 E.00608
G1 X108.855 Y135.162 E.01614
G3 X109.189 Y135.183 I.15 J.272 E.01053
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.385 J.36 E.0113
G1 X110.91 Y137.382 E.01689
G3 X110.873 Y137.521 I-.258 J.005 E.00431
G1 X109.372 Y139.923 E.08438
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.015 Y140.251 E-.06214
G1 X108.935 Y140.269 E-.03111
G1 X108.853 Y140.269 E-.03101
G1 X108.744 Y140.231 E-.04401
G1 X108.466 Y139.964 E-.14633
G1 X108.41 Y139.88 E-.03854
G1 X108.39 Y139.781 E-.03856
G1 X108.39 Y138.811 E-.3683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.541 Y146.442 Z4 F42000
G1 X108.558 Y147.267 Z4
G1 Z3.6
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.681 Y147.297 I.132 J-.276 E.00381
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.837 E.62412
G1 X108.21 Y126.437 E.01191
M106 S255
G1 F3759.961
G1 X108.21 Y126.327 E.00329
M106 S94.35
M106 S255
G1 F2880
G1 X112.79 Y126.327 E.13642
M106 S94.35
M106 S255
G1 F3759.961
G1 X112.79 Y126.437 E.00329
M106 S94.35
G1 F7160.291
G1 X112.79 Y126.837 E.01191
G1 X112.79 Y138.226 E.33923
G2 X112.619 Y138.305 I.073 J.381 E.00568
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.028 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.506 Y147.236 I.306 J-.007 E.00826
M204 S10000
G1 X108.406 Y147.413 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134722
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00067
; LINE_WIDTH: 0.16905
G2 X108.56 Y147.537 I.075 J-.03 E.00127
; LINE_WIDTH: 0.138381
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54735
G1 F5352.576
M204 S6000
G1 X109.709 Y140.789 E.00717
G1 X109.38 Y141.023 E.01607
G1 X109.058 Y141.087 E.0131
G1 X109.058 Y142.216 E.04497
G1 X109.83 Y140.936 E.05955
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626304
G1 F4628.176
M204 S6000
G1 X111.517 Y138.175 E.12537
; WIPE_START
G1 X110.45 Y139.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.123124
G1 F15000
M204 S6000
G1 X110.778 Y135.674 E.00136
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114053
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148314
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517145
G1 F5693.499
M204 S6000
G1 X111.458 Y135.715 E.02077
G1 X111.471 Y135.936 E.0083
G1 X111.429 Y135.972 E.00207
G1 X111.524 Y136.093 E.00579
; LINE_WIDTH: 0.48895
G1 F6053.404
G1 X111.57 Y136.227 E.00499
; LINE_WIDTH: 0.45079
G1 F6619.756
G1 X111.615 Y136.361 E.00456
; LINE_WIDTH: 0.398742
G1 F7588.066
G1 X111.678 Y136.791 E.01219
G1 X111.668 Y137.575 E.02204
G1 X111.603 Y137.773 E.00587
G1 X111.878 Y137.947 E.00914
G1 X112.013 Y137.812 E.00536
G1 X112.022 Y136.793 E.02863
; LINE_WIDTH: 0.403373
G1 F7490.584
G1 X112.006 Y136.501 E.00834
; LINE_WIDTH: 0.435598
G1 F6875.872
G1 X111.99 Y136.209 E.00908
; LINE_WIDTH: 0.468018
G1 F6351.484
G1 X111.975 Y135.871 E.01135
; LINE_WIDTH: 0.500633
G1 F5898.899
G1 X111.96 Y135.533 E.01222
; WIPE_START
G1 X111.975 Y135.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.476 Y132.448 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.88 Y132.547 I-.119 J1.125 E.01967
G1 X109.973 Y133.001 E.03263
G1 X108.95 Y131.978 E.0465
G1 X108.95 Y131.698 E.00902
G1 X112.05 Y128.598 E.14095
G1 X112.05 Y127.402 E.03849
G1 X111.715 Y127.067 E.01522
G1 X110.087 Y127.067 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6632.609
G1 X111.715 Y127.067 E-.61876
G1 X111.978 Y127.33 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/25
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z4 I.78 J.934 P1  F42000
G1 X133.179 Y109.615 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X133.196 Y109.461 E.00462
G3 X133.676 Y109.09 I.492 J.14 E.01934
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.133 I-.513 J.233 E.00724
G3 X134.824 Y110.696 I-2.561 J-.581 E.01783
G3 X134.401 Y110.985 I-.734 J-.622 E.01544
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.182 Y109.675 I.463 J-.218 E.00451
M204 S10000
G1 X132.787 Y109.625 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.787 Y109.673 E.00154
G2 X132.866 Y109.978 I.901 J-.071 E.0102
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.988 J-2.318 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.702 I1.618 J1.522 E.01706
G2 X134.847 Y112.398 I.692 J.293 E.02337
G1 X114.487 Y112.398 E.65471
G2 X112.397 Y114.5 I.021 J2.11 E.10567
G1 X108.602 Y114.5 E.12204
G1 X108.602 Y109.911 E.14757
G2 X109.973 Y108.602 I-1.407 J-2.847 E.0619
G1 X133.246 Y108.602 E.74838
G1 X133.291 Y108.79 E.00622
G2 X132.819 Y109.354 I.397 J.812 E.02436
G1 X132.794 Y109.566 E.00683
; WIPE_START
G1 X132.787 Y109.673 E-.04092
G1 X132.816 Y109.849 E-.06774
G1 X132.866 Y109.978 E-.05282
G1 X133.356 Y110.959 E-.4165
G1 X133.427 Y111.074 E-.05134
G1 X133.536 Y111.194 E-.06166
G1 X133.664 Y111.293 E-.06162
G1 X133.681 Y111.302 E-.00738
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.336 J.052 E.00407
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.81 Y110.09 I.412 J.508 E.01109
G1 X137.383 Y110.09 E.01709
G3 X137.52 Y110.127 I-.001 J.271 E.00425
G1 X139.928 Y111.633 E.0846
G1 X140.186 Y111.889 E.01084
G3 X140.226 Y112.267 I-.232 J.216 E.01212
G1 X139.964 Y112.533 E.01115
G3 X139.779 Y112.61 I-.185 J-.185 E.0061
G1 X135.722 Y112.61 E.12085
G3 X135.563 Y112.557 I.016 J-.314 E.00507
G1 X135.206 Y112.203 E.01498
G3 X135.131 Y111.997 I.266 J-.213 E.00665
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07337
G1 X136.243 Y110.46 E-.65237
G1 X136.306 Y110.397 E-.03425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.596 Y112.398 E.07627
G2 X140.578 Y111.752 I-.687 J-.304 E.02146
G2 X140.173 Y111.324 I-2.001 J1.483 E.01902
G1 X137.698 Y109.776 E.09388
G2 X137.406 Y109.698 I-.29 J.501 E.00981
G1 X136.782 Y109.698 E.02006
G2 X136.207 Y109.941 I.044 J.906 E.0205
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.761 J-.879 E.0218
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.865 J1.58 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00275
G1 X137.918 Y109.072 E.0183
G2 X142.965 Y112.189 I67.675 J-103.948 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.273 Y112.443 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.3 J-.159 E.00375
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.844 Y114.056 I.02 J1.735 E.06647
G1 X112.796 Y114.351 E.00889
G1 F6615.392
G1 X112.79 Y114.714 E.01083
M106 S255
G1 F3152.745
G1 X112.79 Y114.892 E.0053
M106 S94.35
M106 S255
G1 F1920
G1 X108.21 Y114.892 E.13642
M106 S94.35
M106 S255
G1 F3152.745
G1 X108.21 Y114.714 E.0053
M106 S94.35
G1 F7032.856
G1 X108.21 Y114.314 E.01191
G1 F7160.291
G1 X108.21 Y113.914 E.01191
G1 X108.21 Y109.653 E.12694
G2 X109.734 Y108.21 I-.968 J-2.549 E.06418
G1 X137.73 Y108.21 E.83389
G1 X137.729 Y108.225 E.00046
G2 X137.811 Y108.41 I.336 J-.038 E.00609
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.07851
G1 X144.416 Y112.604 E.14002
G1 X144.509 Y112.621 E.0028
G1 X147.011 Y112.621 E.07455
G2 X147.241 Y112.492 I-.039 J-.337 E.00805
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.06939
G1 X147.31 Y110.506 E-.69061
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.501 Y112.548 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.128928
G1 F15000
M204 S6000
G1 X147.428 Y112.594 E.00059
M204 S10000
G1 X147.501 Y112.548 F42000
; LINE_WIDTH: 0.131791
G1 F15000
M204 S6000
G1 X147.529 Y112.529 E.00024
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02758
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.046 Y112.012 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.40701
G1 F7415.748
M204 S6000
G1 X141.927 Y112.012 E.02534
G1 X141.243 Y111.601 E.02295
G1 X141.001 Y111.794 E.0089
G1 X141.034 Y111.954 E.0047
M204 S10000
G1 X140.262 Y110.797 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.112226
G1 F15000
M204 S6000
G3 X140.693 Y111.534 I-12.486 J7.808 E.00468
M204 S10000
G1 X140.713 Y111.523 F42000
; LINE_WIDTH: 0.336212
G1 F9205.843
M204 S6000
G1 X140.39 Y111.046 E.01333
G3 X138.128 Y109.626 I74.129 J-120.602 E.06189
; LINE_WIDTH: 0.330763
G1 F9380.116
G1 X137.928 Y109.597 E.0046
; LINE_WIDTH: 0.300068
G1 F10499.804
G1 X137.727 Y109.569 E.00411
M204 S10000
G1 X137.655 Y109.516 F42000
; LINE_WIDTH: 0.121393
G1 F15000
M204 S6000
G1 X137.809 Y109.546 E.00097
; LINE_WIDTH: 0.14812
G1 X138.571 Y109.728 E.00651
; WIPE_START
G1 X137.809 Y109.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.225 Y112.594 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.14017
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00097
; LINE_WIDTH: 0.111339
G1 X135.081 Y112.386 E.00068
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.407 Y111.207 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.15395
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115932
G1 X135.153 Y111.003 E.00094
M204 S10000
G1 X135.628 Y110.248 F42000
; LINE_WIDTH: 0.124572
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00065
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.541 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521622
G1 F5640.261
M204 S6000
M73 P83 R2
G1 X135.906 Y109.521 E.00727
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508365
G1 F5800.901
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477295
G1 F6215.827
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443153
G1 F6746.079
G1 X136.527 Y109.361 E.00774
; LINE_WIDTH: 0.389933
G1 F7780.704
G1 X136.768 Y109.322 E.00671
G1 X137.31 Y109.322 E.01485
G1 X137.35 Y109.144 E.005
G1 X137.416 Y109.101 E.00217
G1 X137.293 Y108.978 E.00476
G1 X136.768 Y108.978 E.01438
; LINE_WIDTH: 0.405938
G1 F7437.659
G1 X136.469 Y108.996 E.00859
; LINE_WIDTH: 0.443153
G1 F6746.079
G1 X136.17 Y109.015 E.00947
; LINE_WIDTH: 0.475668
G1 F6239.204
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511637
G1 F5760.407
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.487 E.01828
; WIPE_START
G1 X135.474 Y109.043 E-.44561
G1 X135.822 Y109.029 E-.31439
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.959 Y110.942 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G3 X132.431 Y109.688 I2.538 J-1.806 E.0441
G1 X132.457 Y109.429 E.00837
G1 X131.978 Y108.95 E.02179
G1 X131.698 Y108.95 E.00902
G1 X128.596 Y112.052 E.14105
G1 X127.404 Y112.052 E.03833
G1 X124.302 Y108.95 E.14107
G1 X124.022 Y108.95 E.00902
G1 X120.917 Y112.055 E.14118
G1 X119.731 Y112.055 E.03815
G1 X116.626 Y108.95 E.14119
G1 X116.346 Y108.95 E.00902
G1 X111.144 Y114.152 E.23656
G1 X108.95 Y114.152 E.07054
G1 X108.95 Y110.12 E.12967
G2 X109.623 Y109.623 I-3.43 J-5.342 E.0269
G1 X112.772 Y112.772 E.14324
; WIPE_START
G1 X111.358 Y111.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I-1.2 J.203 P1  F42000
G1 X112.398 Y117.502 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.5 E.19289
G1 X108.602 Y123.5 E.12206
G1 X108.602 Y117.502 E.19289
G1 X112.338 Y117.502 E.12013
M204 S10000
G1 X112.79 Y117.286 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y122.914 E.16767
G1 X112.79 Y123.314 E.01191
G1 F7032.856
G1 X112.79 Y123.714 E.01191
M106 S255
G1 F3152.745
G1 X112.79 Y123.892 E.0053
M106 S94.35
M106 S255
G1 F1920
G1 X108.21 Y123.892 E.13642
M106 S94.35
M106 S255
G1 F3152.745
G1 X108.21 Y123.714 E.0053
M106 S94.35
G1 F7032.856
G1 X108.21 Y123.314 E.01191
G1 F7160.291
G1 X108.21 Y122.914 E.01191
G1 X108.21 Y118.086 E.14384
G1 X108.21 Y117.686 E.01191
G1 F7007.199
G1 X108.21 Y117.286 E.01191
M106 S255
G1 F3135.574
G1 X108.21 Y117.11 E.00524
M106 S94.35
M106 S255
G1 F1920
G1 X112.79 Y117.11 E.13642
M106 S94.35
M106 S255
G1 F2687.311
G1 X112.79 Y117.226 E.00345
M106 S94.35
; WIPE_START
M204 S6000
G1 X112.79 Y119.226 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.95 Y118.255 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X108.95 Y117.85 E.01301
G1 X110.174 Y117.85 E.03935
G1 X112.05 Y119.726 E.08529
G1 X112.05 Y120.922 E.03849
G1 X109.82 Y123.152 E.1014
G1 X108.95 Y123.152 E.02797
G1 X108.95 Y122.394 E.02439
; WIPE_START
G1 X108.95 Y123.152 E-.28827
G1 X109.82 Y123.152 E-.33049
G1 X110.083 Y122.889 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I-1.216 J-.051 P1  F42000
G1 X109.622 Y133.854 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.567 Y134.113 E.00851
G2 X109.653 Y134.552 I.918 J.048 E.01454
G2 X109.879 Y134.97 I2.339 J-.998 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.298 Y134.79 I-1.515 J1.605 E.01718
G1 X109.1 Y134.729 E.00666
G1 X108.832 Y134.745 E.00861
G1 X108.602 Y134.848 E.00812
G1 X108.602 Y126.502 E.26839
G1 X112.398 Y126.502 E.12206
G1 X112.398 Y133.246 E.21686
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.812 J.397 E.0449
G1 X110.041 Y133.356 E.03525
G2 X109.641 Y133.797 I.443 J.805 E.01952
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.485 J.203 E.01061
G1 X111.181 Y133.224 E.03158
G3 X111.352 Y133.176 I.214 J.434 E.00534
G3 X111.902 Y133.591 I.027 J.537 E.02227
G3 X111.91 Y134.262 I-3.613 J.377 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.971 E.01776
G3 X110.867 Y135.021 I-.233 J-.513 E.00724
G3 X110.319 Y134.834 I.798 J-3.247 E.01728
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.468 J-.24 E.01183
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09161
G1 X110.232 Y133.699 E-.06579
G1 X111.181 Y133.224 E-.40291
G1 X111.352 Y133.176 E-.0677
G1 X111.536 Y133.192 E-.06993
G1 X111.682 Y133.264 E-.06206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.855 Y135.414 I.865 J-1.701 E.02196
G2 X111.264 Y135.328 I.006 J-.988 E.01354
G2 X111.946 Y134.973 I-1.575 J-3.855 E.02476
G2 X112.21 Y134.647 I-.601 J-.755 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.538 J68.776 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.0931
G2 X109.351 Y140.503 I.276 J-.723 E.02544
G1 X109.681 Y140.167 E.01514
G1 X111.225 Y137.697 E.09365
G2 X111.302 Y137.401 I-.477 J-.282 E.00998
G2 X111.288 Y136.649 I-3.83 J-.302 E.02421
G2 X111.067 Y136.217 I-.974 J.225 E.01575
G1 X110.8 Y135.95 E.01215
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.598 Y135.367 E-.16477
G1 X110.855 Y135.414 E-.09938
G1 X111.004 Y135.406 E-.05654
G1 X111.264 Y135.328 E-.10326
G1 X111.946 Y134.973 E-.2922
G1 X112.031 Y134.895 E-.04386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.195 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.735 Y140.224 I-.204 J-.245 E.01175
G3 X108.466 Y139.965 I1.016 J-1.321 E.01114
G3 X108.39 Y139.781 I.185 J-.184 E.00607
G1 X108.39 Y135.722 E.1209
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.797 Y135.207 E.01394
G3 X108.927 Y135.132 I.212 J.217 E.00453
G3 X109.19 Y135.183 I.072 J.326 E.00819
G1 X110.54 Y136.244 E.05114
G1 X110.771 Y136.475 E.00975
G3 X110.91 Y136.815 I-.512 J.408 E.01109
G1 X110.91 Y137.383 E.01689
G3 X110.873 Y137.521 I-.258 J.005 E.00431
G1 X109.372 Y139.923 E.08438
G1 X109.145 Y140.153 E.00961
; WIPE_START
M204 S6000
G1 X109.015 Y140.251 E-.06213
G1 X108.935 Y140.269 E-.03132
G1 X108.798 Y140.254 E-.0521
G1 X108.735 Y140.224 E-.02681
G1 X108.466 Y139.965 E-.14186
G1 X108.41 Y139.881 E-.03829
G1 X108.39 Y139.781 E-.0387
G1 X108.39 Y138.811 E-.36878
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.552 Y146.441 Z4.2 F42000
G1 X108.569 Y147.271 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.669 Y147.297 I.128 J-.287 E.00308
G1 X112.79 Y147.309 E.12275
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y127.086 E.61671
G1 X108.21 Y126.686 E.01191
G1 F7007.199
G1 X108.21 Y126.286 E.01191
M106 S255
G1 F3135.574
G1 X108.21 Y126.11 E.00524
M106 S94.35
M106 S255
G1 F1920
G1 X112.79 Y126.11 E.13642
M106 S94.35
M106 S255
G1 F3135.574
G1 X112.79 Y126.286 E.00524
M106 S94.35
G1 F7007.199
G1 X112.79 Y126.686 E.01191
G1 F7160.291
G1 X112.79 Y127.086 E.01191
G1 X112.79 Y138.225 E.33182
G2 X112.618 Y138.305 I.078 J.392 E.00569
G1 X112.273 Y138.65 E.01453
G1 X110.86 Y140.87 E.07839
G1 X108.407 Y144.936 E.14145
G1 X108.389 Y145.028 E.00279
G1 X108.383 Y146.998 E.05867
G2 X108.517 Y147.241 I.314 J-.014 E.00857
M204 S10000
G1 X108.406 Y147.421 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139947
G1 F15000
M204 S6000
G1 X108.475 Y147.525 E.00096
G2 X108.646 Y147.543 I.253 J-1.516 E.00132
G1 X112.594 Y147.549 E.03026
; WIPE_START
G1 X110.594 Y147.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54734
G1 F5352.682
M204 S6000
G1 X109.709 Y140.789 E.00717
G1 X109.382 Y141.022 E.016
G1 X109.058 Y141.087 E.01316
G1 X109.058 Y142.216 E.04497
G1 X109.83 Y140.936 E.05954
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626285
G1 F4628.327
M204 S6000
G1 X111.517 Y138.175 E.12537
; WIPE_START
G1 X110.45 Y139.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.122996
G1 F15000
M204 S6000
G1 X110.78 Y135.675 E.00135
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114045
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148293
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.111135
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.13957
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.474 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518636
G1 F5675.657
M204 S6000
G1 X111.458 Y135.715 E.02083
G1 X111.48 Y135.907 E.00727
G1 X111.44 Y135.979 E.0031
; LINE_WIDTH: 0.50778
G1 F5808.2
G1 X111.52 Y136.134 E.0064
; LINE_WIDTH: 0.47636
G1 F6229.236
G1 X111.601 Y136.288 E.00597
; LINE_WIDTH: 0.442298
G1 F6760.521
G1 X111.639 Y136.538 E.00797
; LINE_WIDTH: 0.397684
G1 F7610.707
G1 X111.678 Y136.788 E.00708
G1 X111.668 Y137.575 E.02206
G1 X111.603 Y137.773 E.00585
G1 X111.878 Y137.947 E.00912
G1 X112.013 Y137.812 E.00535
G1 X112.022 Y136.794 E.02854
; LINE_WIDTH: 0.405608
G1 F7444.425
G1 X112.004 Y136.485 E.00887
; LINE_WIDTH: 0.442303
G1 F6760.436
G1 X111.986 Y136.176 E.00976
; LINE_WIDTH: 0.474813
G1 F6251.556
G1 X111.973 Y135.855 E.01096
; LINE_WIDTH: 0.503138
G1 F5866.791
G1 X111.96 Y135.534 E.01168
; WIPE_START
G1 X111.973 Y135.855 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.99 Y127.22 Z4.2 F42000
G1 X109.87 Y126.85 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X111.498 Y126.85 E.05236
G1 X112.05 Y127.402 E.02508
G1 X112.05 Y128.598 E.03849
G1 X108.95 Y131.698 E.14095
G1 X108.95 Y131.978 E.00902
G1 X109.973 Y133.001 E.0465
G3 X111.297 Y132.433 I2.079 J3.023 E.04663
G1 X111.476 Y132.448 E.00579
; WIPE_START
G1 X111.297 Y132.433 E-.06837
G1 X110.88 Y132.547 E-.16415
G1 X109.973 Y133.001 E-.38555
G1 X109.709 Y132.737 E-.14193
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.412 Y140.258 Z4.2 F42000
G1 X108.406 Y140.294 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111006
G1 F15000
M204 S6000
G2 X108.592 Y140.388 I1.706 J-3.161 E.00112
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.294 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/25
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M106 S86.7
; OBJECT_ID: 75
M204 S10000
G17
G3 Z4.2 I.947 J.765 P1  F42000
G1 X133.177 Y109.619 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X133.179 Y109.554 E.00194
G3 X133.676 Y109.09 I.511 J.049 E.02211
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.563 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.514 J.233 E.00724
G3 X134.826 Y110.694 I-2.849 J-.679 E.01774
G3 X134.401 Y110.985 I-.734 J-.616 E.01552
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.183 Y109.679 I.465 J-.217 E.0044
M204 S10000
G1 X132.791 Y109.716 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.818 Y109.848 E.00432
G2 X132.866 Y109.978 I.87 J-.246 E.00447
G1 X133.356 Y110.959 E.03524
G2 X134.553 Y111.347 I.805 J-.444 E.04455
G2 X134.966 Y111.123 I-.991 J-2.325 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.701 I1.6 J1.509 E.01704
G2 X134.847 Y112.398 I.691 J.294 E.02338
G1 X114.487 Y112.398 E.65471
G2 X112.398 Y114.487 I.032 J2.121 E.10508
G1 X112.398 Y114.863 E.01211
G1 X108.602 Y114.863 E.12206
G1 X108.602 Y109.91 E.15927
M73 P84 R2
G2 X109.973 Y108.602 I-1.399 J-2.839 E.06189
G1 X133.246 Y108.602 E.74838
G1 X133.291 Y108.79 E.00622
G2 X132.786 Y109.657 I.397 J.812 E.03418
; WIPE_START
G1 X132.818 Y109.848 E-.07376
G1 X132.866 Y109.978 E-.05282
G1 X133.356 Y110.959 E-.4165
G1 X133.432 Y111.082 E-.05504
G1 X133.553 Y111.208 E-.06616
G1 X133.664 Y111.294 E-.05343
G1 X133.763 Y111.345 E-.0423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.42 J.528 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.259 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.217 Y111.924 E.0122
G3 X140.217 Y112.276 I-.279 J.176 E.01105
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.721 Y112.61 E.12089
M73 P84 R1
G3 X135.56 Y112.554 I.012 J-.293 E.00515
G1 X135.206 Y112.203 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07307
G1 X136.243 Y110.46 E-.65245
G1 X136.307 Y110.396 E-.03449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.737 J-.284 E.02357
G1 X140.175 Y111.325 E.01674
G1 X137.72 Y109.79 E.09311
G2 X137.427 Y109.698 I-.306 J.463 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.697 J-.86 E.02181
G2 X135.329 Y109.736 I-.99 J-.006 E.01353
G2 X134.974 Y109.054 I-3.864 J1.58 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00277
G1 X137.919 Y109.072 E.01829
G2 X142.966 Y112.189 I67.655 J-103.915 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.28 Y112.433 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.335 I-.301 J-.144 E.00306
G1 X147.31 Y108.21 E.12287
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.818 Y114.204 I.02 J1.726 E.07079
G1 X112.79 Y114.495 E.00873
G1 F5902.688
G1 X112.79 Y114.933 E.01305
M106 S255
G1 F2160
G1 X112.79 Y115.255 E.00959
M106 S86.7
M106 S255
G1 F600
G1 X108.21 Y115.255 E.13642
M106 S86.7
M106 S255
G1 F2160
G1 X108.21 Y114.933 E.00959
M106 S86.7
G1 F5503.95
G1 X108.21 Y114.533 E.01191
G1 F7160.291
G1 X108.21 Y114.133 E.01191
G1 X108.21 Y109.653 E.13346
G2 X109.734 Y108.21 I-.968 J-2.549 E.06418
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.337 J-.037 E.00617
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07456
G2 X147.25 Y112.485 I-.033 J-.332 E.00841
; WIPE_START
M204 S6000
G1 X147.31 Y112.335 E-.06141
G1 X147.31 Y110.497 E-.69859
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.433 Y112.594 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.1324
G1 F15000
M204 S6000
G1 X147.531 Y112.531 E.00082
G1 X147.55 Y112.357 E.00124
G1 X147.55 Y108.406 E.02793
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.702 Y111.29 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.339204
G1 F9112.887
M204 S6000
G2 X139.999 Y110.806 I-3.92 J4.939 E.02
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330823
G1 F9378.155
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300208
G1 F10494.088
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168821
G1 F15000
M204 S6000
G1 X138.62 Y109.759 E.00973
M204 S10000
G1 X140.441 Y110.905 F42000
; LINE_WIDTH: 0.101117
G1 F15000
M204 S6000
G1 X140.748 Y111.598 E.00349
M204 S10000
G1 X141.014 Y112.026 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38003
G1 F8009.256
M204 S6000
G1 X141.975 Y112.026 E.02561
G1 X141.188 Y111.552 E.02446
G1 X141.219 Y111.779 E.00612
G1 X140.999 Y111.905 E.00674
G1 X141.007 Y111.966 E.00165
; WIPE_START
G1 X140.999 Y111.905 E-.02352
G1 X141.219 Y111.779 E-.09618
G1 X141.188 Y111.552 E-.08727
G1 X141.975 Y112.026 E-.34904
G1 X141.438 Y112.026 E-.20399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.628 Y110.248 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124515
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00064
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52186
G1 F5637.448
M204 S6000
G1 X135.906 Y109.521 E.00725
G1 X135.975 Y109.565 E.00311
; LINE_WIDTH: 0.508518
G1 F5799
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477353
G1 F6215.004
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390023
G1 F7778.679
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.137 E.00525
G1 X137.426 Y109.111 E.00137
G1 X137.293 Y108.978 E.00515
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.40594
G1 F7437.607
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.475753
G1 F6237.979
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511919
G1 F5756.947
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.0183
; WIPE_START
G1 X135.474 Y109.043 E-.44576
G1 X135.822 Y109.029 E-.31424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.153 Y111.003 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.115939
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.153974
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.11132
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140119
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.527 Y112.184 Z4.4 F42000
G1 X114.993 Y111.68 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X113.395 Y111.901 I-.347 J3.372 E.05238
G1 X115.969 Y109.328 E.11703
G1 X117.004 Y109.328 E.03328
G1 X119.354 Y111.678 E.10689
G1 X121.295 Y111.677 E.06241
G1 X123.645 Y109.328 E.10686
G1 X124.679 Y109.328 E.03328
G1 X127.027 Y111.675 E.10677
G1 X128.973 Y111.675 E.06258
G1 X131.321 Y109.327 E.10674
G1 X132.082 Y109.327 E.02448
G2 X132.165 Y110.178 I2.538 J.181 E.0276
M204 S10000
G1 X109.596 Y109.671 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382981
G1 F7939.762
M204 S6000
G2 X108.976 Y110.126 I3.879 J5.937 E.02065
G1 X108.965 Y114.341 E.11323
G1 X109.124 Y114.426 E.00484
G1 X111.883 Y114.426 E.07411
G1 X112.051 Y114.343 E.00503
G1 X112.122 Y113.848 E.01343
G1 X112.287 Y113.42 E.01235
G1 X112.603 Y112.935 E.01555
G3 X113.283 Y112.361 I1.948 J1.619 E.02401
G1 X113.843 Y112.127 E.0163
G1 X114.391 Y112.043 E.01489
G1 X133.598 Y112.036 E.51596
G1 X133.702 Y111.898 E.00462
G1 X133.665 Y111.701 E.00537
G3 X133.036 Y111.129 I.627 J-1.321 E.02318
G1 X132.538 Y110.132 E.02994
G1 X132.425 Y109.689 E.01228
G1 X132.49 Y109.181 E.01378
; LINE_WIDTH: 0.396995
G1 F7625.503
G1 X132.496 Y109.092 E.00248
; LINE_WIDTH: 0.416043
G1 F7236.234
G1 X132.501 Y109.004 E.00261
G1 X132.344 Y108.965 E.00478
; LINE_WIDTH: 0.38292
G1 F7941.176
G1 X110.26 Y108.965 E.59311
G1 X110.179 Y108.975 E.00221
G1 X109.634 Y109.625 E.02277
M204 S10000
G1 X109.53 Y114.138 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X111.158 Y114.138 E.05236
G1 X111.901 Y113.395 E.03378
G3 X112.506 Y112.506 I3.269 J1.573 E.0347
G1 X109.889 Y109.889 E.11899
G3 X109.327 Y110.329 I-2.803 J-3.007 E.02296
G1 X109.327 Y111.242 E.02936
; WIPE_START
G1 X109.327 Y110.329 E-.34692
G1 X109.889 Y109.889 E-.271
M73 P85 R1
G1 X110.154 Y110.154 E-.14208
; WIPE_END
G1 E-.03999 F1800
M204 S10000
G17
G3 Z4.4 I-1.159 J.372 P1  F42000
G1 X112.398 Y117.139 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X112.398 Y123.863 E.21623
G1 X108.602 Y123.863 E.12206
G1 X108.602 Y117.139 E.21623
G1 X112.338 Y117.139 E.12013
M204 S10000
G1 X112.79 Y117.069 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X112.79 Y123.133 E.18065
G1 X112.79 Y123.533 E.01191
G1 F5503.95
G1 X112.79 Y123.933 E.01191
M106 S255
G1 F2160
G1 X112.79 Y124.255 E.00959
M106 S86.7
M106 S255
G1 F600
G1 X108.21 Y124.255 E.13642
M106 S86.7
M106 S255
G1 F2160
G1 X108.21 Y123.933 E.00959
M106 S86.7
G1 F5503.95
G1 X108.21 Y123.533 E.01191
G1 F7160.291
G1 X108.21 Y123.133 E.01191
G1 X108.21 Y117.869 E.15682
G1 X108.21 Y117.469 E.01191
G1 F5503.95
G1 X108.21 Y117.069 E.01191
M106 S255
G1 F2160
G1 X108.21 Y116.747 E.00959
M106 S86.7
M106 S255
G1 F600
G1 X112.79 Y116.747 E.13642
M106 S86.7
M106 S255
G1 F1818.276
G1 X112.79 Y117.009 E.0078
M106 S86.7
; WIPE_START
M204 S6000
G1 X112.79 Y119.009 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.876 Y117.577 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F7941.176
M204 S6000
G1 X109.124 Y117.577 E.07391
G1 X108.965 Y117.661 E.00484
G1 X108.965 Y123.341 E.15256
G1 X109.124 Y123.426 E.00484
G1 X111.876 Y123.426 E.07391
G1 X112.035 Y123.341 E.00484
G1 X112.035 Y117.652 E.15281
G1 X111.93 Y117.602 E.00311
M204 S10000
G1 X109.327 Y122.016 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X109.327 Y123.138 E.03606
G1 X109.834 Y123.138 E.0163
G1 X111.672 Y121.3 E.08359
G1 X111.672 Y119.348 E.06274
G1 X110.188 Y117.864 E.06749
G1 X109.327 Y117.864 E.02768
G1 X109.327 Y118.632 E.02468
; WIPE_START
G1 X109.327 Y117.864 E-.2916
G1 X110.188 Y117.864 E-.32716
G1 X110.451 Y118.127 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I-1.215 J-.064 P1  F42000
G1 X109.624 Y133.832 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6632.609
M204 S6000
G1 X109.587 Y133.964 E.00442
G2 X109.653 Y134.552 I.898 J.197 E.01939
G2 X109.879 Y134.97 I2.346 J-1.002 E.0153
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.52 J1.613 E.01713
G2 X108.602 Y134.849 I-.294 J.69 E.02339
G1 X108.602 Y126.139 E.28007
G1 X112.398 Y126.139 E.12206
G1 X112.398 Y133.246 E.22853
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.65 Y133.777 I.444 J.805 E.01881
M204 S10000
G1 X109.998 Y133.958 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.352 Y133.176 I.214 J.433 E.00534
G3 X111.902 Y133.591 I.027 J.537 E.02227
G3 X111.91 Y134.262 I-3.611 J.378 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.97 E.01776
G3 X110.868 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.776 J-3.184 E.01729
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01183
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09164
G1 X110.232 Y133.699 E-.06574
G1 X111.181 Y133.224 E-.40291
G1 X111.352 Y133.176 E-.06771
G1 X111.536 Y133.192 E-.07009
G1 X111.682 Y133.264 E-.06193
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.205 Y135.219 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.867 J-1.71 E.02197
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.581 J-3.867 E.02476
G2 X112.21 Y134.647 I-.603 J-.756 E.01358
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01965
G2 X108.781 Y143.557 I105.484 J68.742 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.09313
G2 X109.374 Y140.479 I.278 J-.697 E.02651
G1 X109.681 Y140.167 E.01407
G1 X111.21 Y137.721 E.09275
G2 X111.302 Y137.429 I-.463 J-.306 E.00998
G1 X111.302 Y136.796 E.02035
G2 X111.059 Y136.209 I-.855 J.01 E.02095
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.597 Y135.367 E-.16427
G1 X110.856 Y135.414 E-.09999
G1 X111.004 Y135.406 E-.05644
G1 X111.264 Y135.328 E-.10328
G1 X111.946 Y134.973 E-.2922
G1 X112.031 Y134.895 E-.04383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.111 Y140.187 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X108.734 Y140.224 I-.216 J-.266 E.01196
G3 X108.466 Y139.965 I1.016 J-1.32 E.01113
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.2 J.205 E.0041
G3 X109.19 Y135.183 I.073 J.402 E.00845
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.528 J.419 E.0112
G1 X110.91 Y137.392 E.01718
G3 X110.868 Y137.529 I-.258 J-.005 E.00431
G1 X109.372 Y139.923 E.08409
G1 X109.154 Y140.144 E.00926
; WIPE_START
M204 S6000
G1 X109.003 Y140.254 E-.07082
G1 X108.935 Y140.269 E-.02648
G1 X108.797 Y140.254 E-.05264
G1 X108.734 Y140.224 E-.02653
G1 X108.466 Y139.965 E-.14169
G1 X108.41 Y139.88 E-.03855
G1 X108.39 Y139.781 E-.03854
G1 X108.39 Y138.821 E-.36475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.551 Y146.452 Z4.4 F42000
G1 X108.569 Y147.271 Z4.4
G1 Z4
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X108.669 Y147.297 I.128 J-.287 E.00309
G1 X112.79 Y147.309 E.12276
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.869 E.62317
G1 X108.21 Y126.469 E.01191
G1 F5503.95
G1 X108.21 Y126.069 E.01191
M106 S255
G1 F2160
G1 X108.21 Y125.747 E.00959
M106 S86.7
M106 S255
G1 F600
G1 X112.79 Y125.747 E.13642
M106 S86.7
M106 S255
G1 F2160
G1 X112.79 Y126.069 E.00959
M106 S86.7
G1 F5503.95
G1 X112.79 Y126.469 E.01191
G1 F7160.291
G1 X112.79 Y126.869 E.01191
G1 X112.79 Y138.226 E.3383
G2 X112.619 Y138.305 I.046 J.325 E.00569
G1 X112.273 Y138.65 E.01456
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.516 Y147.241 I.314 J-.014 E.00855
M204 S10000
G1 X108.406 Y147.422 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139931
G1 F15000
M204 S6000
G1 X108.475 Y147.525 E.00095
G2 X108.646 Y147.543 I.253 J-1.504 E.00132
G1 X112.594 Y147.549 E.03026
; WIPE_START
G1 X110.594 Y147.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.861 Y140.885 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54681
G1 F5358.313
M204 S6000
G1 X109.731 Y140.803 E.00615
G1 X109.255 Y141.066 E.02163
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05953
M204 S10000
G1 X110.066 Y140.476 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.626241
G1 F4628.67
M204 S6000
G1 X111.514 Y138.181 E.12503
; WIPE_START
G1 X110.447 Y139.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.989 Y135.634 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.123046
G1 F15000
M204 S6000
G1 X110.778 Y135.674 E.00136
M204 S10000
G1 X109.979 Y135.174 F42000
; LINE_WIDTH: 0.114035
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148262
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.111066
G1 F15000
M204 S6000
G1 X108.509 Y135.155 E.00068
; LINE_WIDTH: 0.139338
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.509 Y135.155 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.957 Y135.473 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516346
G1 F5703.114
M204 S6000
G1 X111.458 Y135.715 E.02074
G1 X111.471 Y135.935 E.00824
G1 X111.429 Y135.971 E.00209
G1 X111.529 Y136.116 E.0066
; LINE_WIDTH: 0.480662
G1 F6168.021
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.446345
G1 F6692.694
G1 X111.621 Y136.448 E.00548
; LINE_WIDTH: 0.399931
G1 F7562.793
G1 X111.667 Y136.614 E.00485
G1 X111.678 Y137.443 E.02338
G1 X111.642 Y137.805 E.01026
G1 X111.873 Y137.95 E.00768
G1 X112.012 Y137.811 E.00554
G1 X112.018 Y136.61 E.03387
; LINE_WIDTH: 0.412029
G1 F7314.926
G1 X112.001 Y136.417 E.00567
; LINE_WIDTH: 0.446345
G1 F6692.694
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480662
G1 F6168.021
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.507465
G1 F5812.139
G1 X111.958 Y135.533 E.01819
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.459 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.672 Y127.347 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X111.672 Y128.976 E.05236
G1 X109.327 Y131.321 E.10664
G1 X109.327 Y132.355 E.03327
G1 X109.692 Y132.72 E.01656
G3 X111.177 Y132.072 I2.491 J3.687 E.05241
M204 S10000
G1 X111.876 Y126.577 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F7941.176
M204 S6000
G1 X109.124 Y126.577 E.07391
G1 X108.965 Y126.661 E.00484
G1 X108.965 Y133.579 E.1858
G1 X109.11 Y133.701 E.00509
G1 X109.28 Y133.679 E.00461
G1 X109.56 Y133.271 E.01329
G1 X109.871 Y133.035 E.01049
G1 X110.868 Y132.537 E.02991
G1 X111.309 Y132.424 E.01224
G1 X111.817 Y132.495 E.01378
; LINE_WIDTH: 0.40358
G1 F7486.275
G1 X111.9 Y132.511 E.0024
; LINE_WIDTH: 0.430602
G1 F6964.471
G1 X111.983 Y132.526 E.00258
G1 X112.035 Y132.344 E.0058
; LINE_WIDTH: 0.38292
G1 F7941.176
G1 X112.035 Y126.652 E.15287
G1 X111.93 Y126.602 E.00311
; WIPE_START
G1 X112.035 Y126.652 E-.04405
G1 X112.035 Y128.536 E-.71595
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.784 Y135.829 Z4.4 F42000
G1 X108.406 Y140.293 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109853
G1 F15000
M204 S6000
G2 X108.59 Y140.386 I1.866 J-3.469 E.00109
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.406 Y140.293 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/25
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
M106 S71.4
; OBJECT_ID: 75
M204 S10000
G17
G3 Z4.4 I.896 J.824 P1  F42000
G1 X135.103 Y111.276 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X134.79 Y111.701 I1.597 J1.507 E.01704
G2 X134.847 Y112.398 I.691 J.294 E.02338
G1 X114.487 Y112.398 E.65471
G2 X112.398 Y114.483 I.032 J2.121 E.10495
G1 X112.398 Y114.883 E.01287
G1 F4919.51
G1 X112.398 Y115.283 E.01286
M106 S255
G1 F1800
G1 X112.398 Y115.665 E.0123
M106 S71.4
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X112.398 Y116.337 E.0216
M106 S71.4
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X112.398 Y116.719 E.0123
M106 S71.4
G1 F4919.51
G1 X112.398 Y117.119 E.01286
G1 F6632.609
G1 X112.398 Y117.519 E.01286
M73 P86 R1
G1 X112.398 Y123.483 E.19176
G1 X112.398 Y123.883 E.01286
G1 F4919.51
G1 X112.398 Y124.283 E.01286
M106 S255
G1 F1800
G1 X112.398 Y124.665 E.0123
M106 S71.4
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X112.398 Y125.337 E.0216
M106 S71.4
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X112.398 Y125.719 E.0123
M106 S71.4
G1 F4919.51
G1 X112.398 Y126.119 E.01286
G1 F6632.609
G1 X112.398 Y126.519 E.01286
G1 X112.398 Y133.246 E.21629
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.812 J.397 E.0449
G1 X110.041 Y133.356 E.03525
G2 X109.653 Y134.552 I.446 J.806 E.04452
G2 X109.879 Y134.97 I2.349 J-1.003 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.508 J1.596 E.01714
G2 X108.602 Y134.848 I-.294 J.692 E.02338
G1 X108.602 Y126.519 E.26783
G1 X108.602 Y126.119 E.01286
G1 F4919.51
G1 X108.602 Y125.719 E.01286
M106 S255
G1 F1800
G1 X108.602 Y125.337 E.0123
M106 S71.4
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X108.602 Y124.665 E.0216
M106 S71.4
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X108.602 Y124.283 E.0123
M106 S71.4
G1 F4919.51
G1 X108.602 Y123.883 E.01286
G1 F6632.609
G1 X108.602 Y123.483 E.01286
G1 X108.602 Y117.519 E.19176
G1 X108.602 Y117.119 E.01286
G1 F4919.51
G1 X108.602 Y116.719 E.01286
M106 S255
G1 F1800
G1 X108.602 Y116.337 E.0123
M106 S71.4
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X108.602 Y115.665 E.0216
M106 S71.4
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X108.602 Y115.283 E.0123
M106 S71.4
G1 F4919.51
G1 X108.602 Y114.883 E.01286
G1 F6632.609
G1 X108.602 Y114.483 E.01286
G1 X108.602 Y109.91 E.14703
G2 X109.973 Y108.602 I-1.4 J-2.84 E.06189
G1 X133.246 Y108.602 E.74838
G1 X133.291 Y108.79 E.00622
G2 X132.866 Y109.978 I.397 J.812 E.04491
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.992 J-2.328 E.01515
G1 X135.063 Y111.231 E.00466
; WIPE_START
G1 X134.859 Y111.587 E-.15589
G1 X134.79 Y111.701 E-.05088
G1 X134.739 Y111.864 E-.06484
G1 X134.728 Y112.034 E-.06478
G1 X134.759 Y112.202 E-.06473
G1 X134.847 Y112.398 E-.08168
G1 X134.118 Y112.398 E-.2772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.596 Y117.667 Z4.6 F42000
G1 X110.205 Y135.219 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.87 J-1.719 E.02197
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.58 J-3.865 E.02477
G2 X112.21 Y134.647 I-.602 J-.756 E.01358
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.512 J68.76 E.19484
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.09313
G2 X109.374 Y140.479 I.278 J-.697 E.02651
G1 X109.682 Y140.167 E.01407
G1 X111.21 Y137.721 E.09276
G2 X111.302 Y137.429 I-.464 J-.306 E.00997
G1 X111.302 Y136.796 E.02035
G2 X111.065 Y136.215 I-.893 J.025 E.02061
G1 X110.8 Y135.95 E.01205
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.596 Y135.366 E-.16375
G1 X110.856 Y135.414 E-.10049
G1 X111.004 Y135.406 E-.05647
G1 X111.264 Y135.328 E-.1032
G1 X111.946 Y134.973 E-.29226
G1 X112.031 Y134.895 E-.04383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.972 Y134.042 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.514 J.119 E.01323
G1 X111.181 Y133.224 E.03158
G3 X111.352 Y133.176 I.215 J.435 E.00534
G3 X111.902 Y133.591 I.027 J.537 E.02227
G3 X111.91 Y134.262 I-3.61 J.377 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01609
G1 X111.103 Y134.971 E.01777
G3 X110.868 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.754 J-3.12 E.01729
G3 X110.015 Y134.4 I.59 J-.736 E.01599
G3 X109.962 Y134.101 I.471 J-.239 E.00918
; WIPE_START
M204 S6000
G1 X110.038 Y133.876 E-.09058
G1 X110.094 Y133.803 E-.03483
G1 X110.232 Y133.699 E-.06576
G1 X111.181 Y133.224 E-.40292
G1 X111.352 Y133.176 E-.0677
G1 X111.537 Y133.192 E-.07031
G1 X111.602 Y133.225 E-.0279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.111 Y140.187 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X108.734 Y140.224 I-.216 J-.266 E.01196
G3 X108.466 Y139.965 I1.021 J-1.325 E.01113
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.199 J.203 E.00411
G3 X109.189 Y135.183 I.074 J.402 E.00844
G1 X110.54 Y136.244 E.05114
G1 X110.77 Y136.475 E.00971
G3 X110.91 Y136.815 I-.517 J.411 E.01112
G1 X110.91 Y137.392 E.01719
G3 X110.868 Y137.529 I-.259 J-.005 E.0043
G1 X109.372 Y139.923 E.08409
G1 X109.154 Y140.144 E.00927
; WIPE_START
M204 S6000
G1 X109.003 Y140.254 E-.07081
G1 X108.935 Y140.269 E-.02648
G1 X108.797 Y140.254 E-.05264
G1 X108.734 Y140.224 E-.02655
G1 X108.466 Y139.965 E-.14167
G1 X108.41 Y139.88 E-.03853
G1 X108.39 Y139.781 E-.03857
G1 X108.39 Y138.821 E-.36474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.331 Y133.003 Z4.6 F42000
G1 X133.177 Y109.636 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F7160.291
M204 S5000
G1 X133.178 Y109.554 E.00244
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.513 J.233 E.00724
G3 X134.835 Y110.681 I-3.123 J-.755 E.01729
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.185 Y109.695 I.463 J-.218 E.0039
; WIPE_START
M204 S6000
G1 X133.178 Y109.554 E-.05379
G1 X133.228 Y109.373 E-.0713
G1 X133.279 Y109.29 E-.03701
G1 X133.416 Y109.166 E-.07028
G1 X133.501 Y109.124 E-.03585
G1 X133.676 Y109.09 E-.0677
G1 X134.262 Y109.09 E-.22289
G1 X134.437 Y109.123 E-.06755
G1 X134.521 Y109.165 E-.03578
G1 X134.596 Y109.222 E-.03578
G1 X134.696 Y109.352 E-.06208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.419 J.528 E.0112
G1 X137.381 Y110.09 E.01689
G3 X137.519 Y110.127 I.005 J.259 E.00431
G1 X139.929 Y111.633 E.08464
G1 X140.217 Y111.924 E.01221
G3 X140.217 Y112.276 I-.28 J.176 E.01105
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.721 Y112.61 E.12089
G3 X135.56 Y112.554 I.012 J-.294 E.00515
G1 X135.205 Y112.203 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07308
G1 X136.243 Y110.46 E-.65243
G1 X136.307 Y110.396 E-.0345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.737 J-.284 E.02356
G1 X140.175 Y111.325 E.01675
G1 X137.696 Y109.775 E.09401
G2 X137.399 Y109.698 I-.282 J.479 E.00998
G2 X136.648 Y109.712 I-.302 J3.828 E.02422
G2 X136.207 Y109.941 I.222 J.965 E.01613
G1 X135.949 Y110.2 E.01176
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.707 J-.863 E.02181
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.855 J1.575 E.02476
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00275
G1 X137.919 Y109.072 E.01831
G2 X142.965 Y112.189 I67.657 J-103.918 E.19075
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.284 Y112.435 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.335 I-.287 J-.127 E.00309
G1 X147.31 Y108.21 E.12287
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.494 I.02 J1.726 E.0795
G1 X112.79 Y114.896 E.01199
G1 F4919.51
G1 X112.79 Y115.296 E.01191
M106 S255
G1 F1800
G1 X112.79 Y115.665 E.01099
M106 S71.4
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X112.79 Y116.337 E.0216
M106 S71.4
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X112.79 Y116.706 E.01099
M106 S71.4
G1 F4919.51
G1 X112.79 Y117.106 E.01191
G1 F7160.291
G1 X112.79 Y117.506 E.01191
G1 X112.79 Y123.496 E.17843
G1 X112.79 Y123.896 E.01191
G1 F4919.51
G1 X112.79 Y124.296 E.01191
M106 S255
G1 F1800
G1 X112.79 Y124.665 E.01099
M106 S71.4
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X112.79 Y125.337 E.0216
M106 S71.4
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X112.79 Y125.706 E.01099
M106 S71.4
G1 F4919.51
G1 X112.79 Y126.106 E.01191
G1 F7160.291
G1 X112.79 Y126.506 E.01191
G1 X112.79 Y138.226 E.34911
G2 X112.619 Y138.305 I.046 J.325 E.00569
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.669 Y147.297 I.314 J-.014 E.01344
G1 X112.79 Y147.309 E.12276
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y126.506 E.63398
G1 X108.21 Y126.106 E.01191
G1 F4919.51
G1 X108.21 Y125.706 E.01191
M106 S255
G1 F1800
G1 X108.21 Y125.337 E.01099
M106 S71.4
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X108.21 Y124.665 E.0216
M106 S71.4
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X108.21 Y124.296 E.01099
M106 S71.4
G1 F4919.51
G1 X108.21 Y123.896 E.01191
G1 F7160.291
G1 X108.21 Y123.496 E.01191
G1 X108.21 Y117.506 E.17843
G1 X108.21 Y117.106 E.01191
G1 F4919.51
G1 X108.21 Y116.706 E.01191
M106 S255
G1 F1800
G1 X108.21 Y116.337 E.01099
M106 S71.4
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X108.21 Y115.665 E.0216
M106 S71.4
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X108.21 Y115.296 E.01099
M106 S71.4
G1 F4919.51
G1 X108.21 Y114.896 E.01191
G1 F7160.291
G1 X108.21 Y114.496 E.01191
G1 X108.21 Y109.653 E.14426
G2 X109.734 Y108.21 I-.968 J-2.549 E.06418
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.338 J-.037 E.00616
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07455
G2 X147.255 Y112.487 I-.015 J-.314 E.00855
; WIPE_START
M204 S6000
G1 X147.31 Y112.335 E-.06161
G1 X147.31 Y110.497 E-.69839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.433 Y112.594 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132403
G1 F15000
M204 S6000
G1 X147.531 Y112.531 E.00082
G1 X147.55 Y112.357 E.00124
G1 X147.55 Y108.406 E.02793
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.702 Y111.29 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.339187
G1 F9113.409
M204 S6000
G2 X139.999 Y110.806 I-3.92 J4.94 E.01999
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330819
G1 F9378.299
G1 X137.928 Y109.597 E.0046
; LINE_WIDTH: 0.300207
G1 F10494.148
G1 X137.727 Y109.569 E.00411
M204 S10000
G1 X137.806 Y109.545 F42000
; LINE_WIDTH: 0.120518
G1 F15000
M204 S6000
G1 X137.654 Y109.516 E.00095
M204 S10000
G1 X137.806 Y109.545 F42000
; LINE_WIDTH: 0.1464
G1 F15000
M204 S6000
G1 X138.568 Y109.727 E.00641
M204 S10000
G1 X140.441 Y110.905 F42000
; LINE_WIDTH: 0.100796
G1 F15000
M204 S6000
G1 X140.748 Y111.598 E.00346
M204 S10000
G1 X141.014 Y112.026 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38024
G1 F8004.269
M204 S6000
G1 X141.975 Y112.026 E.02562
G1 X141.189 Y111.552 E.02446
G1 X141.219 Y111.779 E.0061
G1 X140.999 Y111.904 E.00673
G1 X141.007 Y111.966 E.00167
; WIPE_START
G1 X140.999 Y111.904 E-.02385
G1 X141.219 Y111.779 E-.09594
G1 X141.189 Y111.552 E-.08693
G1 X141.975 Y112.026 E-.34883
G1 X141.437 Y112.026 E-.20446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.628 Y110.248 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124596
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00065
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521668
G1 F5639.71
M204 S6000
G1 X135.906 Y109.521 E.00727
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508398
G1 F5800.495
G1 X136.13 Y109.482 E.00644
; LINE_WIDTH: 0.477313
G1 F6215.577
G1 X136.285 Y109.4 E.00601
; LINE_WIDTH: 0.443138
G1 F6746.332
G1 X136.536 Y109.361 E.00802
; LINE_WIDTH: 0.391722
G1 F7740.789
G1 X136.786 Y109.322 E.00699
G1 X137.306 Y109.329 E.01431
G1 X137.347 Y109.143 E.00526
M73 P87 R1
G1 X137.413 Y109.1 E.00216
G1 X137.292 Y108.979 E.0047
G1 X136.792 Y108.978 E.01378
; LINE_WIDTH: 0.405895
G1 F7438.529
G1 X136.481 Y108.996 E.00893
; LINE_WIDTH: 0.443145
G1 F6746.206
G1 X136.17 Y109.015 E.00984
; LINE_WIDTH: 0.47569
G1 F6238.88
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511693
G1 F5759.727
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.01829
; WIPE_START
G1 X135.474 Y109.043 E-.44564
G1 X135.822 Y109.029 E-.31436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.153 Y111.003 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.115948
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.153993
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.111305
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.14007
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.078 Y111.916 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60068
G1 F4840.792
M204 S6000
G1 X134.199 Y111.914 E.00531
M204 S10000
G1 X132.759 Y112.231 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40829
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X133.419 Y111.57 E.04829
G1 X133.317 Y111.477 E.00715
G3 X133.098 Y111.244 I.301 J-.503 E.01678
G1 X132.313 Y112.028 E.05737
G1 X131.665 Y112.028 E.03352
G1 X132.874 Y110.82 E.08837
G1 X132.658 Y110.388 E.02498
G1 X131.017 Y112.028 E.11996
G1 X130.369 Y112.028 E.03352
G1 X132.457 Y109.941 E.15268
G1 X132.443 Y109.866 E.0039
G3 X132.449 Y109.3 I1.287 J-.269 E.02951
G1 X129.721 Y112.028 E.1995
G1 X129.073 Y112.028 E.03352
G1 X132.129 Y108.972 E.22353
G1 X131.481 Y108.972 E.03352
G1 X128.425 Y112.028 E.22353
G1 X127.777 Y112.028 E.03352
G1 X130.833 Y108.972 E.22353
G1 X130.185 Y108.972 E.03352
G1 X127.128 Y112.028 E.22353
G1 X126.48 Y112.028 E.03352
G1 X129.537 Y108.972 E.22353
G1 X128.889 Y108.972 E.03352
G1 X125.832 Y112.028 E.22353
G1 X125.184 Y112.028 E.03352
G1 X128.241 Y108.972 E.22353
G1 X127.593 Y108.972 E.03352
G1 X124.536 Y112.028 E.22353
G1 X123.888 Y112.028 E.03352
G1 X126.944 Y108.972 E.22353
G1 X126.296 Y108.972 E.03352
G1 X123.24 Y112.028 E.22353
G1 X122.592 Y112.028 E.03352
G1 X125.648 Y108.972 E.22353
G1 X125 Y108.972 E.03352
G1 X121.943 Y112.028 E.22353
G1 X121.295 Y112.028 E.03352
G1 X124.352 Y108.972 E.22353
G1 X123.704 Y108.972 E.03352
G1 X120.647 Y112.028 E.22353
G1 X119.999 Y112.028 E.03352
G1 X123.056 Y108.972 E.22353
G1 X122.408 Y108.972 E.03352
G1 X119.351 Y112.028 E.22353
G1 X118.703 Y112.028 E.03352
G1 X121.759 Y108.972 E.22353
G1 X121.111 Y108.972 E.03352
G1 X118.055 Y112.028 E.22353
G1 X117.407 Y112.028 E.03352
G1 X120.463 Y108.972 E.22353
G1 X119.815 Y108.972 E.03352
G1 X116.758 Y112.028 E.22353
G1 X116.11 Y112.028 E.03352
G1 X119.167 Y108.972 E.22353
G1 X118.519 Y108.972 E.03352
G1 X115.462 Y112.028 E.22353
G1 X114.814 Y112.028 E.03352
G1 X117.871 Y108.972 E.22353
G1 X117.223 Y108.972 E.03352
G1 X113.873 Y112.321 E.24496
M106 S71.4
; WIPE_START
G1 X115.287 Y110.907 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.321 Y113.873 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X111.707 Y114.487 E.04491
M106 S71.4
M204 S10000
G1 X111.059 Y114.487 F42000
M106 S255
G1 F3000
M204 S6000
G1 X116.575 Y108.972 E.40335
G1 X115.926 Y108.972 E.03352
G1 X110.613 Y114.285 E.38854
G1 X109.965 Y114.285 E.03352
G1 X115.278 Y108.972 E.38854
G1 X114.63 Y108.972 E.03352
G1 X109.317 Y114.285 E.38854
G1 X108.972 Y114.285 E.01787
G1 X108.972 Y113.982 E.01565
G1 X113.982 Y108.972 E.36641
G1 X113.334 Y108.972 E.03352
G1 X108.972 Y113.334 E.31901
G1 X108.972 Y112.686 E.03352
G1 X112.686 Y108.972 E.27161
G1 X112.038 Y108.972 E.03352
G1 X108.972 Y112.038 E.22422
G1 X108.972 Y111.39 E.03352
G1 X111.39 Y108.972 E.17682
G1 X110.741 Y108.972 E.03352
G1 X108.769 Y110.944 E.14423
M106 S71.4
M204 S10000
G1 X108.942 Y114.528 F42000
; LINE_WIDTH: 0.43252
; LAYER_HEIGHT: 0.2
M106 S255
G1 F3000
M204 S6000
G1 X108.942 Y117.304 E.08542
G1 X109.331 Y117.304 E.01199
G1 X109.331 Y114.698 E.0802
G1 X109.721 Y114.698 E.01199
G1 X109.721 Y117.304 E.0802
G1 X110.11 Y117.304 E.01199
G1 X110.11 Y114.698 E.0802
G1 X110.5 Y114.698 E.01199
G1 X110.5 Y117.304 E.0802
G1 X110.89 Y117.304 E.01199
G1 X110.89 Y114.698 E.0802
G1 X111.279 Y114.698 E.01199
G1 X111.279 Y117.304 E.0802
G1 X111.669 Y117.304 E.01199
G1 X111.669 Y114.698 E.0802
G1 X112.058 Y114.698 E.01199
G1 X112.058 Y117.474 E.08542
M106 S71.4
M204 S10000
G1 X108.769 Y118.491 F42000
; LINE_WIDTH: 0.43101
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X109.542 Y117.718 E.06299
G1 X110.222 Y117.718 E.0392
G1 X108.972 Y118.968 E.10193
G1 X108.972 Y119.649 E.0392
G1 X110.903 Y117.718 E.15736
G1 X111.583 Y117.718 E.0392
G1 X108.972 Y120.329 E.2128
G1 X108.972 Y121.009 E.0392
G1 X112.028 Y117.952 E.2491
G1 X112.028 Y118.633 E.0392
G1 X108.972 Y121.689 E.2491
G1 X108.972 Y122.37 E.0392
G1 X112.028 Y119.313 E.2491
G1 X112.028 Y119.993 E.0392
G1 X108.972 Y123.05 E.2491
G1 X108.972 Y123.285 E.01353
G1 X109.417 Y123.285 E.02567
G1 X112.028 Y120.673 E.2128
G1 X112.028 Y121.354 E.0392
G1 X110.097 Y123.285 E.15736
G1 X110.778 Y123.285 E.0392
G1 X112.028 Y122.034 E.10193
G1 X112.028 Y122.714 E.0392
G1 X111.255 Y123.487 E.06299
M106 S71.4
M204 S10000
G1 X108.942 Y123.528 F42000
; LINE_WIDTH: 0.43252
; LAYER_HEIGHT: 0.2
M106 S255
G1 F3000
M204 S6000
G1 X108.942 Y126.304 E.08542
G1 X109.331 Y126.304 E.01199
G1 X109.331 Y123.698 E.0802
G1 X109.721 Y123.698 E.01199
G1 X109.721 Y126.304 E.0802
G1 X110.11 Y126.304 E.01199
G1 X110.11 Y123.698 E.0802
G1 X110.5 Y123.698 E.01199
G1 X110.5 Y126.304 E.0802
G1 X110.89 Y126.304 E.01199
G1 X110.89 Y123.698 E.0802
G1 X111.279 Y123.698 E.01199
G1 X111.279 Y126.304 E.0802
G1 X111.669 Y126.304 E.01199
G1 X111.669 Y123.698 E.0802
G1 X112.058 Y123.698 E.01199
G1 X112.058 Y126.474 E.08542
M106 S71.4
M204 S10000
G1 X109.715 Y126.515 F42000
; LINE_WIDTH: 0.41704
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X108.972 Y127.258 E.05672
G1 X108.972 Y127.919 E.03563
G1 X110.173 Y126.718 E.09166
G1 X110.834 Y126.718 E.03563
G1 X108.972 Y128.579 E.14206
M73 P88 R1
G1 X108.972 Y129.24 E.03563
G1 X111.494 Y126.718 E.19245
G1 X112.028 Y126.718 E.02883
G1 X112.028 Y126.844 E.00681
G1 X108.972 Y129.9 E.23322
G1 X108.972 Y130.561 E.03563
G1 X112.028 Y127.504 E.23321
G1 X112.028 Y128.165 E.03563
G1 X108.972 Y131.221 E.23322
G1 X108.972 Y131.882 E.03563
G1 X112.028 Y128.825 E.23321
G1 X112.028 Y129.486 E.03563
G1 X108.972 Y132.542 E.23322
G1 X108.972 Y133.203 E.03563
G1 X112.028 Y130.146 E.23321
G1 X112.028 Y130.807 E.03563
G1 X109.074 Y133.761 E.22538
M106 S71.4
M204 S10000
G1 X109.084 Y134.082 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60012
; LAYER_HEIGHT: 0.2
G1 F4845.657
M204 S6000
G1 X109.086 Y134.2 E.00518
; WIPE_START
G1 X109.084 Y134.082 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111157
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139615
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.792 Y135.407 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.148299
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00124
; LINE_WIDTH: 0.114048
G1 X109.979 Y135.174 E.00084
M204 S10000
G1 X110.779 Y135.675 F42000
; LINE_WIDTH: 0.122974
G1 F15000
M204 S6000
G1 X110.989 Y135.634 E.00135
M204 S10000
G1 X111.957 Y135.474 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515595
G1 F5712.174
M204 S6000
G1 X111.458 Y135.715 E.0207
G1 X111.476 Y135.918 E.00763
G1 X111.421 Y135.969 E.0028
G1 X111.54 Y136.145 E.00795
; LINE_WIDTH: 0.466098
G1 F6380.302
G1 X111.603 Y136.38 E.00811
; LINE_WIDTH: 0.418613
G1 F7186.729
G1 X111.667 Y136.614 E.0072
; LINE_WIDTH: 0.399207
G1 F7578.163
G1 X111.678 Y137.443 E.02334
G1 X111.642 Y137.805 E.01024
G1 X111.873 Y137.95 E.00766
G1 X112.012 Y137.811 E.00553
G1 X112.018 Y136.61 E.0338
; LINE_WIDTH: 0.418613
G1 F7186.729
G1 X111.995 Y136.336 E.00818
; LINE_WIDTH: 0.466098
G1 F6380.302
G1 X111.971 Y136.061 E.00921
; LINE_WIDTH: 0.503555
G1 F5861.474
G1 X111.959 Y135.534 E.01921
; WIPE_START
G1 X111.971 Y136.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.531 Y132.625 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41704
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X112.028 Y132.128 E.03796
G1 X112.028 Y131.467 E.03563
G1 X110.612 Y132.883 E.10805
M106 S71.4
; WIPE_START
G1 X112.026 Y131.469 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.514 Y138.181 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.626265
; LAYER_HEIGHT: 0.2
G1 F4628.479
M204 S6000
G1 X110.066 Y140.475 E.12503
M204 S10000
G1 X109.861 Y140.885 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54682
G1 F5358.206
M204 S6000
G1 X109.731 Y140.802 E.00615
G1 X109.255 Y141.066 E.02163
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05954
; WIPE_START
G1 X109.058 Y142.217 E-.56838
G1 X109.058 Y141.713 E-.19162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.59 Y140.386 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109901
G1 F15000
M204 S6000
G3 X108.406 Y140.293 I1.563 J-3.313 E.00109
; WIPE_START
G1 X108.59 Y140.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.406 Y147.421 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.139933
G1 F15000
M204 S6000
G1 X108.475 Y147.525 E.00095
G2 X108.646 Y147.543 I.252 J-1.497 E.00132
G1 X112.594 Y147.549 E.03025
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X110.594 Y147.546 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/25
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
M106 S86.7
; OBJECT_ID: 75
M204 S10000
G17
G3 Z4.6 I1.216 J-.038 P1  F42000
G1 X110.205 Y135.219 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.855 Y135.414 I.886 J-1.773 E.02196
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.58 J-3.865 E.02476
G2 X112.21 Y134.647 I-.602 J-.756 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.1055
G1 X111.948 Y138.431 E.02068
G2 X108.781 Y143.557 I104.901 J68.351 E.19377
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.612 E.09312
G2 X109.374 Y140.479 I.278 J-.698 E.02651
G1 X109.682 Y140.167 E.01408
G1 X111.21 Y137.721 E.09276
G2 X111.302 Y137.43 I-.466 J-.307 E.00993
G1 X111.302 Y136.796 E.02039
G2 X111.059 Y136.209 I-.855 J.01 E.02094
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.589 Y135.363 E-.16095
G1 X110.855 Y135.414 E-.10321
G1 X111.004 Y135.406 E-.05659
G1 X111.264 Y135.328 E-.10313
G1 X111.946 Y134.973 E-.29222
G1 X112.031 Y134.895 E-.04389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.998 Y133.958 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.352 Y133.176 I.214 J.433 E.00534
G3 X111.902 Y133.591 I.027 J.537 E.02227
G3 X111.91 Y134.262 I-3.618 J.378 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01609
G1 X111.103 Y134.971 E.01776
G3 X110.867 Y135.021 I-.233 J-.513 E.00724
G3 X110.319 Y134.834 I.668 J-2.867 E.01729
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01183
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09161
G1 X110.232 Y133.699 E-.06576
G1 X111.181 Y133.224 E-.4029
G1 X111.352 Y133.176 E-.0677
G1 X111.537 Y133.193 E-.07055
G1 X111.682 Y133.264 E-.0615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.111 Y140.187 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X108.698 Y140.196 I-.213 J-.258 E.01329
G1 X108.466 Y139.965 E.00976
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.1209
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.199 J.204 E.0041
G3 X109.189 Y135.183 I.074 J.402 E.00844
G1 X110.54 Y136.244 E.05115
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.393 E.01721
G3 X110.868 Y137.529 I-.26 J-.006 E.00428
G1 X109.372 Y139.923 E.08409
G1 X109.154 Y140.144 E.00927
; WIPE_START
M204 S6000
G1 X109.003 Y140.254 E-.07083
G1 X108.935 Y140.269 E-.02651
G1 X108.786 Y140.251 E-.05708
G1 X108.698 Y140.196 E-.03939
G1 X108.466 Y139.965 E-.12446
G1 X108.41 Y139.88 E-.03852
G1 X108.39 Y139.781 E-.03858
G1 X108.39 Y138.821 E-.36463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.294 Y132.972 Z4.8 F42000
G1 X132.791 Y109.717 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.818 Y109.848 E.00433
G2 X132.866 Y109.978 I.869 J-.246 E.00446
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.967 Y111.123 I-.994 J-2.33 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.702 I1.587 J1.499 E.01705
G2 X134.847 Y112.398 I.693 J.293 E.02337
G1 X114.487 Y112.398 E.65471
G2 X112.398 Y114.487 I.032 J2.121 E.10508
G1 X112.398 Y133.246 E.60322
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.653 Y134.552 I.444 J.805 E.04454
G2 X109.879 Y134.97 I2.336 J-.996 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.506 J1.594 E.01714
G2 X108.602 Y134.848 I-.294 J.692 E.02338
G1 X108.602 Y109.911 E.80191
G2 X109.973 Y108.602 I-1.401 J-2.841 E.06189
G1 X133.246 Y108.602 E.74838
G1 X133.291 Y108.79 E.00622
G2 X132.786 Y109.657 I.397 J.812 E.03419
M204 S10000
G1 X133.177 Y109.622 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X133.178 Y109.554 E.00204
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01608
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-2.865 J-.668 E.01729
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.183 Y109.682 I.463 J-.218 E.0043
; WIPE_START
M204 S6000
G1 X133.178 Y109.554 E-.04871
G1 X133.228 Y109.373 E-.07129
G1 X133.341 Y109.223 E-.07138
G1 X133.416 Y109.166 E-.03588
G1 X133.501 Y109.124 E-.03585
G1 X133.676 Y109.09 E-.06768
G1 X134.262 Y109.09 E-.2229
G1 X134.437 Y109.124 E-.06756
G1 X134.521 Y109.165 E-.03575
G1 X134.596 Y109.222 E-.03575
G1 X134.704 Y109.363 E-.06723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.811 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.42 J.528 E.0112
G1 X137.381 Y110.09 E.01689
G3 X137.519 Y110.127 I.005 J.259 E.00431
G1 X139.928 Y111.633 E.08464
G1 X140.217 Y111.924 E.01221
G3 X140.217 Y112.276 I-.272 J.176 E.01108
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.731 Y112.61 E.12058
G3 X135.567 Y112.561 I-.002 J-.294 E.00517
G1 X135.206 Y112.203 E.01518
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.811 E-.07303
G1 X136.243 Y110.46 E-.65248
G1 X136.307 Y110.396 E-.0345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.629 Y112.398 E.0752
G1 X140.668 Y112.055 E.01111
G2 X140.542 Y111.694 I-.849 J.095 E.01237
G1 X140.175 Y111.325 E.01675
G1 X137.696 Y109.775 E.09402
G2 X137.399 Y109.698 I-.282 J.478 E.00998
G2 X136.648 Y109.712 I-.302 J3.818 E.0242
G2 X136.207 Y109.941 I.221 J.964 E.01614
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.761 J-.879 E.0218
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.849 J1.572 E.02477
G2 X134.648 Y108.79 I-.755 J.602 E.01358
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.669 E.00273
G1 X137.919 Y109.072 E.01833
G2 X142.966 Y112.189 I67.648 J-103.904 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.279 Y112.446 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.281 J-.137 E.00379
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
M73 P89 R1
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.495 I.02 J1.726 E.07954
G1 X112.79 Y138.226 E.70686
G2 X112.619 Y138.305 I.045 J.324 E.00567
G2 X112.267 Y138.66 I1.37 J1.711 E.01495
G1 X110.86 Y140.87 E.07804
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.028 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.681 Y147.297 I.312 J-.013 E.01379
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y109.653 E1.13597
G2 X109.734 Y108.21 I-.968 J-2.549 E.06418
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.81 Y108.409 I.338 J-.037 E.00614
G1 X138.165 Y108.765 E.01496
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14003
G1 X144.508 Y112.621 E.00278
G1 X147.012 Y112.621 E.07457
G2 X147.247 Y112.497 I-.014 J-.312 E.0082
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.0702
G1 X147.31 Y110.508 E-.6898
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131755
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.548 J-.952 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02757
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.063 Y112.026 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38022
G1 F8004.743
M204 S6000
G1 X141.975 Y112.026 E.02429
G1 X141.189 Y111.552 E.02446
G1 X141.219 Y111.779 E.0061
G1 X141.014 Y111.899 E.00632
G1 X141.042 Y111.97 E.00203
M204 S10000
G1 X140.748 Y111.597 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100787
G1 F15000
M204 S6000
G1 X140.441 Y110.905 E.00346
M204 S10000
G1 X140.702 Y111.29 F42000
; LINE_WIDTH: 0.339175
G1 F9113.794
M204 S6000
G2 X139.999 Y110.806 I-3.921 J4.94 E.01999
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330781
G1 F9379.553
G1 X137.928 Y109.597 E.0046
; LINE_WIDTH: 0.300114
G1 F10497.938
G1 X137.728 Y109.569 E.00411
M204 S10000
G1 X137.806 Y109.545 F42000
; LINE_WIDTH: 0.146264
G1 F15000
M204 S6000
G1 X138.567 Y109.726 E.00639
M204 S10000
G1 X137.806 Y109.545 F42000
; LINE_WIDTH: 0.120444
G1 F15000
M204 S6000
G1 X137.654 Y109.516 E.00094
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521726
G1 F5639.037
M204 S6000
G1 X135.906 Y109.521 E.00726
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.50842
G1 F5800.215
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.47728
G1 F6216.042
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443093
G1 F6747.09
G1 X136.536 Y109.361 E.00801
; LINE_WIDTH: 0.3917
G1 F7741.27
G1 X136.786 Y109.322 E.00699
G1 X137.306 Y109.329 E.01431
G1 X137.347 Y109.143 E.00526
G1 X137.413 Y109.1 E.00217
G1 X137.292 Y108.979 E.00471
G1 X136.792 Y108.978 E.01379
; LINE_WIDTH: 0.405873
G1 F7438.99
G1 X136.481 Y108.996 E.00892
; LINE_WIDTH: 0.443098
G1 F6747.007
G1 X136.171 Y109.015 E.00984
; LINE_WIDTH: 0.475663
G1 F6239.277
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511749
G1 F5759.034
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.01829
M204 S10000
G1 X135.634 Y110.011 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124535
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00095
G1 X135.629 Y110.248 E.00064
M204 S10000
G1 X135.153 Y111.003 F42000
; LINE_WIDTH: 0.115951
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.154009
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.111373
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140282
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.06 Y111.914 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60479
G1 F4805.382
M204 S6000
G1 X134.199 Y111.913 E.00614
M204 S10000
G1 X113.597 Y110.553 F42000
; LINE_WIDTH: 0.497855
G1 F5934.913
M204 S6000
G1 X113.922 Y110.53 E.01173
; LINE_WIDTH: 0.453085
G1 F6582.717
G1 X114.248 Y110.508 E.01058
; LINE_WIDTH: 0.415277
G1 F7251.112
G1 X130.973 Y110.5 E.49193
M204 S10000
G1 X110.932 Y111.881 F42000
; LINE_WIDTH: 0.52521
G1 F5598.297
M204 S6000
G1 X111.346 Y111.385 E.02459
G1 X111.879 Y110.932 E.02667
G1 X111.107 Y110.932 E.02943
G1 X110.932 Y111.111 E.00953
G1 X110.932 Y111.821 E.02704
M204 S10000
G1 X110.546 Y113.673 F42000
; LINE_WIDTH: 0.485803
G1 F6096.425
M204 S6000
G1 X110.681 Y113.309 E.01357
; LINE_WIDTH: 0.424159
G1 F7082.179
G1 X110.815 Y112.945 E.01168
G1 X111.141 Y112.328 E.021
G1 X111.569 Y111.778 E.02099
G1 X112.086 Y111.31 E.02101
G1 X112.676 Y110.94 E.02098
G1 X113.315 Y110.668 E.02089
; LINE_WIDTH: 0.461538
G1 F6449.803
G1 X113.456 Y110.61 E.00505
; LINE_WIDTH: 0.500673
G1 F5898.384
G1 X113.597 Y110.553 E.00552
; LINE_WIDTH: 0.503532
G1 F5861.77
G1 X113.361 Y110.536 E.0086
; LINE_WIDTH: 0.470115
G1 F6320.298
G1 X113.125 Y110.519 E.00798
; LINE_WIDTH: 0.42082
G1 F7144.753
G1 X112.889 Y110.502 E.00706
G1 X110.913 Y110.502 E.05901
G1 X110.536 Y110.891 E.01617
G1 X110.502 Y110.961 E.00232
G1 X110.502 Y112.89 E.05756
; LINE_WIDTH: 0.441928
G1 F6766.79
G1 X110.523 Y113.251 E.01142
; LINE_WIDTH: 0.485803
G1 F6096.425
G1 X110.543 Y113.613 E.01267
M204 S10000
G1 X110.5 Y131.032 F42000
; LINE_WIDTH: 0.41518
G1 F7252.995
M204 S6000
G1 X110.5 Y114.482 E.48666
; LINE_WIDTH: 0.43832
G1 F6828.529
G1 X110.521 Y114.107 E.01173
; LINE_WIDTH: 0.4846
G1 F6113.023
G1 X110.543 Y113.733 E.0131
M204 S10000
G1 X110.875 Y131.326 F42000
; LINE_WIDTH: 0.41999
G1 F7160.475
M204 S6000
G1 X110.875 Y114.482 E.50171
G1 X110.964 Y113.728 E.02262
G1 X111.169 Y113.074 E.02044
G1 X111.467 Y112.517 E.01881
G1 X111.858 Y112.021 E.01881
G1 X112.329 Y111.599 E.01882
G1 X112.865 Y111.266 E.0188
G1 X113.447 Y111.033 E.01869
G1 X114.3 Y110.887 E.02576
G1 X131.611 Y110.875 E.51564
G1 X131.389 Y110.384 E.01603
G1 X131.327 Y110.125 E.00793
G1 X110.743 Y110.125 E.61314
G1 X110.3 Y110.597 E.01926
G1 X110.125 Y110.737 E.00668
G1 X110.125 Y131.611 E.62173
G1 X110.616 Y131.389 E.01604
G1 X110.816 Y131.34 E.00614
M204 S10000
G1 X111.252 Y131.656 F42000
G1 F7160.475
M204 S6000
G1 X111.252 Y114.482 E.51153
G1 X111.337 Y113.778 E.02113
G1 X111.523 Y113.203 E.01802
G1 X111.794 Y112.705 E.01686
G1 X112.147 Y112.263 E.01686
G1 X112.571 Y111.888 E.01687
G1 X113.053 Y111.593 E.01685
G1 X113.576 Y111.387 E.01673
G1 X114.478 Y111.252 E.02715
G1 X132.221 Y111.252 E.52851
G1 X131.837 Y110.483 E.02561
G1 X131.681 Y109.994 E.01528
G1 X131.658 Y109.748 E.00735
G1 X110.572 Y109.748 E.62804
G3 X109.748 Y110.556 I-3.122 J-2.361 E.0345
G1 X109.748 Y132.221 E.6453
G1 X110.517 Y131.836 E.02561
G1 X111.003 Y131.68 E.0152
G1 X111.192 Y131.662 E.00565
M204 S10000
G1 X111.629 Y132.034 F42000
; LINE_WIDTH: 0.41999
G1 F7160.474
M204 S6000
G1 X111.629 Y114.482 E.5228
G1 X111.711 Y113.828 E.01964
G1 X111.878 Y113.332 E.0156
G3 X113.801 Y111.716 I2.693 J1.253 E.07724
G3 X114.478 Y111.629 I.976 J4.896 E.02034
G1 X132.903 Y111.629 E.5488
G1 X132.672 Y111.311 E.01169
G1 X132.174 Y110.314 E.0332
G1 X132.056 Y109.959 E.01115
G1 X132.034 Y109.371 E.01751
G1 X110.395 Y109.371 E.64456
G1 X109.899 Y109.941 E.02249
G1 X109.501 Y110.271 E.0154
G1 X109.371 Y110.354 E.00459
G1 X109.371 Y132.902 E.67162
G1 X109.689 Y132.672 E.01169
G1 X110.686 Y132.174 E.03319
G1 X111.04 Y132.056 E.01111
G1 X111.569 Y132.037 E.01577
M204 S10000
G1 X112.006 Y132.54 F42000
G1 F7160.474
M204 S6000
G1 X112.006 Y114.482 E.53787
G1 X112.085 Y113.878 E.01816
G3 X113.873 Y112.086 I2.41 J.617 E.0791
G3 X114.478 Y112.006 I.896 J4.415 E.01818
G1 X133.545 Y112.006 E.56794
; LINE_WIDTH: 0.442972
G1 F6749.136
G1 X133.674 Y111.983 E.00414
; LINE_WIDTH: 0.488934
G1 F6053.625
G1 X133.803 Y111.96 E.00461
; LINE_WIDTH: 0.534897
G1 F5488.07
G1 X133.931 Y111.937 E.00509
; LINE_WIDTH: 0.580859
G1 F5019.159
G1 X134.06 Y111.914 E.00556
G1 X133.953 Y111.865 E.00503
; LINE_WIDTH: 0.534897
G1 F5488.07
G1 X133.845 Y111.815 E.0046
; LINE_WIDTH: 0.488934
G1 F6053.625
G1 X133.737 Y111.766 E.00417
; LINE_WIDTH: 0.420044
G1 F7159.455
G1 X133.629 Y111.716 E.00353
G1 X133.247 Y111.459 E.01373
G1 X133.01 Y111.142 E.01178
G1 X132.511 Y110.145 E.03321
G1 X132.432 Y109.923 E.00703
G1 X132.4 Y109.448 E.0142
G1 X132.541 Y108.994 E.01414
G1 X110.189 Y108.994 E.66587
G1 X110.068 Y109.18 E.00661
G1 X109.614 Y109.695 E.02045
M73 P90 R1
G3 X108.994 Y110.136 I-1.771 J-1.83 E.02275
G1 X108.994 Y133.544 E.69731
; LINE_WIDTH: 0.442979
G1 F6749.009
G1 X109.017 Y133.673 E.00414
; LINE_WIDTH: 0.488957
G1 F6053.319
G1 X109.04 Y133.802 E.00462
; LINE_WIDTH: 0.534934
G1 F5487.652
G1 X109.063 Y133.931 E.0051
; LINE_WIDTH: 0.580912
G1 F5018.669
G1 X109.086 Y134.06 E.00557
G1 X109.136 Y133.952 E.00504
; LINE_WIDTH: 0.534934
G1 F5487.652
G1 X109.185 Y133.844 E.00461
; LINE_WIDTH: 0.488957
G1 F6053.319
G1 X109.234 Y133.737 E.00418
; LINE_WIDTH: 0.420839
G1 F7144.401
G1 X109.284 Y133.629 E.00354
G1 X109.542 Y133.246 E.01376
G1 X109.858 Y133.009 E.0118
G1 X110.854 Y132.511 E.03326
G1 X111.077 Y132.431 E.00705
G1 X111.534 Y132.399 E.01368
G1 X111.948 Y132.523 E.01292
; WIPE_START
G1 X111.534 Y132.399 E-.16449
G1 X111.077 Y132.431 E-.17414
G1 X110.854 Y132.511 E-.0897
G1 X110.074 Y132.901 E-.33168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.087 Y134.26 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.60489
G1 F4804.527
M204 S6000
G1 X109.086 Y134.12 E.0062
; WIPE_START
G1 X109.087 Y134.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111104
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139512
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.792 Y135.407 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.14826
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00124
; LINE_WIDTH: 0.114035
G1 X109.979 Y135.174 E.00084
M204 S10000
G1 X110.778 Y135.674 F42000
; LINE_WIDTH: 0.123008
G1 F15000
M204 S6000
G1 X110.989 Y135.634 E.00136
M204 S10000
G1 X111.957 Y135.474 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516483
G1 F5701.466
M204 S6000
G1 X111.458 Y135.715 E.02075
G1 X111.471 Y135.935 E.00824
G1 X111.429 Y135.971 E.00208
G1 X111.529 Y136.116 E.00661
; LINE_WIDTH: 0.480654
G1 F6168.139
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.44634
G1 F6692.776
G1 X111.621 Y136.448 E.00548
; LINE_WIDTH: 0.399733
G1 F7566.993
G1 X111.667 Y136.614 E.00485
G1 X111.678 Y137.444 E.02341
G1 X111.639 Y137.796 E.00997
G1 X111.881 Y137.948 E.00806
G1 X112.012 Y137.815 E.00528
G1 X112.018 Y136.61 E.03394
; LINE_WIDTH: 0.412027
G1 F7314.958
G1 X112.001 Y136.417 E.00567
; LINE_WIDTH: 0.44634
G1 F6692.776
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480654
G1 F6168.139
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.50755
G1 F5811.075
G1 X111.958 Y135.534 E.01819
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.517 Y138.175 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.626278
G1 F4628.378
M204 S6000
G1 X110.066 Y140.476 E.12533
M204 S10000
G1 X109.861 Y140.885 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54681
G1 F5358.313
M204 S6000
G1 X109.731 Y140.803 E.00614
G1 X109.255 Y141.066 E.02163
G1 X109.058 Y141.09 E.00792
G1 X109.058 Y142.217 E.04487
G1 X109.83 Y140.936 E.05954
; WIPE_START
G1 X109.058 Y142.217 E-.56839
G1 X109.058 Y141.713 E-.19162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.594 Y140.362 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0980368
G1 F15000
M204 S6000
G1 X108.56 Y140.373 E.00015
G1 X108.406 Y140.299 E.00075
; WIPE_START
G1 X108.56 Y140.373 E-.6302
G1 X108.594 Y140.362 E-.1298
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.406 Y147.413 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.134513
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00067
; LINE_WIDTH: 0.169062
G2 X108.56 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138384
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.462 Y140.963 Z4.8 F42000
G1 X133.459 Y108.65 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X134.479 Y108.65 E.03932
; WIPE_START
G1 X133.459 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.187 Y112.255 Z4.8 F42000
G1 X140.414 Y112.377 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.0992543
G1 F15000
M204 S6000
G1 X140.33 Y112.594 E.00104
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X140.414 Y112.377 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/25
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z4.8 I-.734 J-.971 P1  F42000
G1 X110.205 Y135.219 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.855 Y135.414 I.886 J-1.773 E.02195
G2 X111.264 Y135.328 I.006 J-.988 E.01354
G2 X111.946 Y134.973 I-1.578 J-3.861 E.02475
G2 X112.21 Y134.647 I-.601 J-.756 E.0136
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01964
G2 X108.781 Y143.557 I105.494 J68.748 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.597 E.0936
G1 X108.82 Y140.673 E.00741
G1 X109.137 Y140.637 E.01027
G1 X109.35 Y140.503 E.00811
G1 X109.682 Y140.167 E.01517
G1 X111.21 Y137.721 E.09274
G2 X111.302 Y137.429 I-.461 J-.306 E.00999
G1 X111.302 Y136.796 E.02035
G2 X111.059 Y136.209 I-.855 J.01 E.02094
G1 X110.8 Y135.95 E.01176
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.588 Y135.363 E-.16089
G1 X110.855 Y135.414 E-.10321
G1 X111.004 Y135.407 E-.0565
G1 X111.264 Y135.328 E-.10338
G1 X111.946 Y134.973 E-.29203
G1 X112.031 Y134.895 E-.04399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.998 Y133.958 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.485 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.352 Y133.176 I.214 J.433 E.00533
G3 X111.902 Y133.591 I.027 J.537 E.02227
G3 X111.91 Y134.262 I-3.618 J.378 E.02001
G3 X111.637 Y134.704 I-.563 J-.043 E.01609
G1 X111.103 Y134.971 E.01776
G3 X110.867 Y135.021 I-.233 J-.513 E.00725
G3 X110.319 Y134.835 I.668 J-2.866 E.01727
G3 X110.015 Y134.4 I.589 J-.735 E.01601
G3 X109.978 Y134.014 I.469 J-.24 E.01183
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09153
G1 X110.232 Y133.699 E-.06575
G1 X111.181 Y133.224 E-.40288
G1 X111.352 Y133.176 E-.06765
G1 X111.537 Y133.193 E-.07077
G1 X111.682 Y133.264 E-.06141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.195 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X108.744 Y140.231 I-.207 J-.261 E.01137
G3 X108.466 Y139.965 I1.04 J-1.362 E.01149
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00609
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.199 J.204 E.00411
G3 X109.19 Y135.183 I.074 J.402 E.00845
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.528 J.42 E.0112
G1 X110.91 Y137.392 E.01719
G3 X110.868 Y137.529 I-.258 J-.005 E.00431
G1 X109.372 Y139.923 E.08408
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.004 Y140.258 E-.06683
G1 X108.865 Y140.273 E-.05336
G1 X108.744 Y140.231 E-.04863
G1 X108.466 Y139.965 E-.14627
G1 X108.41 Y139.88 E-.03855
G1 X108.39 Y139.781 E-.03855
G1 X108.39 Y138.813 E-.36782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.294 Y132.965 Z5 F42000
G1 X132.791 Y109.716 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.818 Y109.848 E.00433
G2 X132.866 Y109.978 I.87 J-.246 E.00447
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.967 Y111.123 I-.998 J-2.339 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.702 I1.597 J1.506 E.01705
G2 X134.847 Y112.398 I.691 J.293 E.02337
G1 X114.487 Y112.398 E.65472
G2 X112.398 Y114.487 I.032 J2.121 E.10508
G1 X112.398 Y133.246 E.60322
G1 X112.21 Y133.29 E.00622
G2 X111.021 Y132.866 I-.812 J.397 E.04491
G1 X110.041 Y133.356 E.03524
G2 X109.653 Y134.552 I.444 J.805 E.04454
G2 X109.879 Y134.97 I2.341 J-.999 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.521 J1.614 E.01714
G2 X108.602 Y134.848 I-.294 J.692 E.02338
G1 X108.602 Y109.911 E.8019
G2 X109.973 Y108.602 I-1.402 J-2.841 E.0619
G1 X133.246 Y108.602 E.74838
G1 X133.291 Y108.79 E.00622
G2 X132.786 Y109.657 I.397 J.812 E.03418
M204 S10000
G1 X133.177 Y109.624 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X133.179 Y109.554 E.00209
G3 X133.676 Y109.09 I.51 J.048 E.02213
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.563 E.01609
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.133 I-.512 J.233 E.00725
G3 X134.835 Y110.681 I-2.865 J-.668 E.01729
G3 X134.401 Y110.985 I-.736 J-.592 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.183 Y109.683 I.464 J-.217 E.00426
; WIPE_START
M204 S6000
G1 X133.179 Y109.554 E-.04922
G1 X133.229 Y109.371 E-.07197
G1 X133.341 Y109.223 E-.07073
G1 X133.416 Y109.166 E-.03584
G1 X133.501 Y109.124 E-.03594
G1 X133.676 Y109.09 E-.06762
G1 X134.262 Y109.09 E-.22289
G1 X134.437 Y109.123 E-.06756
G1 X134.521 Y109.165 E-.03578
G1 X134.596 Y109.222 E-.03579
G1 X134.703 Y109.361 E-.06667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.419 J.527 E.0112
G1 X137.391 Y110.09 E.01719
G3 X137.527 Y110.132 I-.005 J.258 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.217 Y111.924 E.0122
G3 X140.217 Y112.276 I-.279 J.176 E.01105
G1 X139.964 Y112.533 E.01077
G3 X139.779 Y112.61 I-.185 J-.184 E.00611
G1 X135.731 Y112.61 E.12059
G3 X135.567 Y112.561 I-.002 J-.294 E.00516
G1 X135.206 Y112.203 E.01518
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.0731
G1 X136.243 Y110.46 E-.65243
G1 X136.307 Y110.396 E-.03446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.61 Y112.398 E.07581
G2 X140.542 Y111.694 I-.737 J-.283 E.02357
G1 X140.175 Y111.325 E.01674
G1 X137.72 Y109.79 E.0931
G2 X137.427 Y109.698 I-.306 J.461 E.01
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.145 I-1.761 J-.879 E.02179
G2 X135.329 Y109.736 I-.988 J-.006 E.01354
G2 X134.974 Y109.054 I-3.865 J1.58 E.02475
G2 X134.648 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.464 Y108.602 E.08913
G1 X137.516 Y108.67 E.00276
G1 X137.919 Y109.072 E.0183
G2 X142.966 Y112.189 I67.658 J-103.921 E.19076
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.284 Y112.435 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.335 I-.289 J-.128 E.00309
G1 X147.31 Y108.21 E.12287
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.495 I.02 J1.726 E.07954
G1 X112.79 Y138.226 E.70686
G2 X112.619 Y138.305 I.046 J.325 E.00569
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.028 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.669 Y147.297 I.314 J-.014 E.01344
G1 X112.79 Y147.309 E.12276
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y109.653 E1.13597
G2 X109.734 Y108.21 I-.969 J-2.55 E.06418
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.811 Y108.41 I.337 J-.037 E.00616
G1 X138.165 Y108.765 E.01495
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.024 Y112.621 E.07491
G2 X147.254 Y112.487 I-.028 J-.315 E.00821
; WIPE_START
M204 S6000
M73 P91 R1
G1 X147.31 Y112.335 E-.06164
G1 X147.31 Y110.497 E-.69836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.433 Y112.594 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132404
G1 F15000
M204 S6000
G1 X147.531 Y112.531 E.00082
G1 X147.55 Y112.357 E.00124
G1 X147.55 Y108.406 E.02793
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.702 Y111.29 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.339181
G1 F9113.584
M204 S6000
G2 X139.999 Y110.806 I-3.917 J4.934 E.02
G1 X138.128 Y109.626 E.05177
; LINE_WIDTH: 0.330797
G1 F9379.019
G1 X137.932 Y109.598 E.00451
; LINE_WIDTH: 0.300133
G1 F10497.169
G1 X137.735 Y109.57 E.00403
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.16911
G1 F15000
M204 S6000
G1 X138.618 Y109.758 E.00973
M204 S10000
G1 X140.441 Y110.905 F42000
; LINE_WIDTH: 0.101092
G1 F15000
M204 S6000
G1 X140.748 Y111.598 E.00348
M204 S10000
G1 X141.014 Y112.026 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38006
G1 F8008.542
M204 S6000
G1 X141.975 Y112.026 E.02561
G1 X141.188 Y111.552 E.02446
G1 X141.219 Y111.779 E.00612
G1 X140.999 Y111.905 E.00674
G1 X141.007 Y111.966 E.00165
; WIPE_START
G1 X140.999 Y111.905 E-.02353
G1 X141.219 Y111.779 E-.09613
G1 X141.188 Y111.552 E-.08727
G1 X141.975 Y112.026 E-.34905
G1 X141.438 Y112.026 E-.20401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.629 Y110.248 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124555
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00065
G1 X135.634 Y110.011 E.00095
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521786
G1 F5638.324
M204 S6000
G1 X135.906 Y109.521 E.00726
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508455
G1 F5799.779
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477285
G1 F6215.971
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.443108
G1 F6746.838
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390021
G1 F7778.73
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.383 Y109.137 E.00524
G1 X137.427 Y109.112 E.00138
G1 X137.293 Y108.978 E.0052
G1 X136.785 Y108.978 E.01394
; LINE_WIDTH: 0.405923
G1 F7437.966
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.443108
G1 F6746.838
G1 X136.171 Y109.015 E.00972
; LINE_WIDTH: 0.475675
G1 F6239.096
G1 X135.823 Y109.029 E.01192
; LINE_WIDTH: 0.511819
G1 F5758.175
G1 X135.474 Y109.043 E.01291
G1 X135.689 Y109.488 E.0183
; WIPE_START
G1 X135.474 Y109.043 E-.44559
G1 X135.823 Y109.029 E-.31441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03931
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.153 Y111.003 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.115961
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.154035
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.111308
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140055
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.061 Y111.914 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60478
G1 F4805.468
M204 S6000
G1 X134.199 Y111.913 E.00612
M204 S10000
G1 X113.597 Y110.552 F42000
; LINE_WIDTH: 0.497825
G1 F5935.305
M204 S6000
G1 X113.923 Y110.53 E.01173
; LINE_WIDTH: 0.453075
G1 F6582.877
G1 X114.248 Y110.508 E.01058
; LINE_WIDTH: 0.415277
G1 F7251.113
G1 X130.973 Y110.5 E.49192
M204 S10000
G1 X110.932 Y111.881 F42000
; LINE_WIDTH: 0.525224
G1 F5598.133
M204 S6000
G1 X111.346 Y111.385 E.02459
G1 X111.879 Y110.932 E.02667
G1 X111.107 Y110.932 E.02943
G1 X110.932 Y111.111 E.00953
G1 X110.932 Y111.821 E.02704
M204 S10000
G1 X110.52 Y113.951 F42000
; LINE_WIDTH: 0.42546
G1 F7058.088
M204 S6000
G1 X110.79 Y113.017 E.02939
G1 X111.141 Y112.328 E.02336
G1 X111.569 Y111.778 E.02106
G1 X112.086 Y111.31 E.02108
G1 X112.677 Y110.94 E.02107
G1 X113.315 Y110.668 E.02095
; LINE_WIDTH: 0.461513
G1 F6450.187
G1 X113.456 Y110.61 E.00505
; LINE_WIDTH: 0.500638
G1 F5898.835
G1 X113.597 Y110.552 E.00552
; LINE_WIDTH: 0.503499
G1 F5862.195
G1 X113.361 Y110.536 E.0086
; LINE_WIDTH: 0.470095
G1 F6320.595
G1 X113.125 Y110.519 E.00798
; LINE_WIDTH: 0.421817
G1 F7125.958
G1 X112.89 Y110.502 E.00707
G1 X110.913 Y110.502 E.05916
G1 X110.535 Y110.892 E.01624
G1 X110.502 Y110.961 E.00228
G2 X110.517 Y113.891 I63.196 J1.142 E.08772
M204 S10000
G1 X110.5 Y131.032 F42000
; LINE_WIDTH: 0.415731
G1 F7242.292
M204 S6000
G1 X110.5 Y114.478 E.48752
G1 X110.518 Y114.011 E.01375
M204 S10000
G1 X110.875 Y131.327 F42000
; LINE_WIDTH: 0.41999
G1 F7160.474
M204 S6000
G1 X110.875 Y114.478 E.50186
G1 X110.969 Y113.708 E.02308
G1 X111.15 Y113.13 E.01806
G1 X111.467 Y112.517 E.02056
G1 X111.858 Y112.021 E.0188
G1 X112.329 Y111.599 E.01882
G1 X112.865 Y111.266 E.01881
G1 X113.447 Y111.033 E.01868
G1 X114.3 Y110.887 E.02576
G1 X131.611 Y110.875 E.51563
G1 X131.389 Y110.383 E.01606
G1 X131.327 Y110.125 E.00791
G1 X110.743 Y110.125 E.61312
G1 X110.3 Y110.598 E.0193
G1 X110.125 Y110.737 E.00665
G1 X110.125 Y131.611 E.62173
G1 X110.615 Y131.389 E.01602
G1 X110.816 Y131.341 E.00616
M204 S10000
G1 X111.252 Y131.656 F42000
G1 F7160.474
M204 S6000
G1 X111.252 Y114.478 E.51168
G1 X111.328 Y113.821 E.01968
G1 X111.51 Y113.243 E.01806
G1 X111.794 Y112.705 E.01811
G1 X112.147 Y112.263 E.01685
G1 X112.571 Y111.888 E.01687
G1 X113.054 Y111.593 E.01686
G1 X113.576 Y111.387 E.01672
G1 X114.478 Y111.252 E.02715
G1 X132.221 Y111.252 E.52851
G1 X131.837 Y110.483 E.02561
G1 X131.681 Y109.993 E.01531
G1 X131.658 Y109.748 E.00732
G1 X110.573 Y109.748 E.62801
G3 X109.748 Y110.556 I-3.143 J-2.384 E.03452
G1 X109.748 Y132.221 E.64529
G1 X110.517 Y131.836 E.0256
G1 X111.004 Y131.68 E.01521
G1 X111.192 Y131.662 E.00564
M204 S10000
G1 X111.629 Y132.034 F42000
G1 F7160.474
M204 S6000
G1 X111.629 Y114.478 E.52294
G1 X111.688 Y113.934 E.01628
G1 X111.87 Y113.356 E.01806
G1 X112.12 Y112.894 E.01565
G3 X113.242 Y111.919 I2.616 J1.878 E.04467
G1 X113.801 Y111.716 E.01771
G3 X114.478 Y111.629 I.976 J4.902 E.02034
G1 X132.906 Y111.629 E.54889
G1 X132.672 Y111.311 E.01174
G1 X132.174 Y110.314 E.0332
G1 X132.056 Y109.958 E.01118
G1 X132.035 Y109.371 E.01748
G1 X110.395 Y109.371 E.64455
G1 X109.898 Y109.942 E.02254
G1 X109.502 Y110.27 E.01532
G1 X109.371 Y110.354 E.00462
G1 X109.371 Y132.902 E.67163
G1 X109.689 Y132.672 E.0117
G1 X110.686 Y132.174 E.03319
G1 X111.04 Y132.056 E.01112
G1 X111.569 Y132.036 E.01576
M204 S10000
G1 X112.006 Y132.54 F42000
G1 F7160.474
M204 S6000
G1 X112.006 Y114.478 E.53801
G1 X112.048 Y114.047 E.01289
G1 X112.229 Y113.468 E.01806
G3 X113.873 Y112.086 I2.328 J1.101 E.06599
G3 X114.478 Y112.006 I.896 J4.421 E.01817
G1 X133.546 Y112.006 E.56796
; LINE_WIDTH: 0.442972
G1 F6749.136
G1 X133.675 Y111.983 E.00413
; LINE_WIDTH: 0.488934
G1 F6053.625
G1 X133.803 Y111.96 E.00461
; LINE_WIDTH: 0.534897
G1 F5488.07
G1 X133.932 Y111.937 E.00508
; LINE_WIDTH: 0.580859
G1 F5019.159
G1 X134.061 Y111.914 E.00556
G1 X133.953 Y111.865 E.00503
; LINE_WIDTH: 0.534897
G1 F5488.07
G1 X133.845 Y111.815 E.0046
; LINE_WIDTH: 0.488934
G1 F6053.625
G1 X133.738 Y111.766 E.00417
; LINE_WIDTH: 0.420044
G1 F7159.455
G1 X133.63 Y111.717 E.00353
G1 X133.257 Y111.467 E.01336
G1 X133.01 Y111.142 E.01216
G1 X132.511 Y110.145 E.03321
G1 X132.431 Y109.923 E.00705
M73 P92 R1
G1 X132.4 Y109.447 E.01419
G1 X132.54 Y108.994 E.01414
G1 X110.188 Y108.994 E.66586
G1 X110.064 Y109.186 E.00682
G1 X109.613 Y109.696 E.02026
G3 X108.994 Y110.137 I-1.772 J-1.833 E.02273
G1 X108.994 Y133.544 E.6973
; LINE_WIDTH: 0.442979
G1 F6749.009
G1 X109.017 Y133.673 E.00415
; LINE_WIDTH: 0.488957
G1 F6053.319
G1 X109.04 Y133.802 E.00462
; LINE_WIDTH: 0.534934
G1 F5487.652
G1 X109.063 Y133.931 E.0051
; LINE_WIDTH: 0.580912
M73 P92 R0
G1 F5018.669
G1 X109.086 Y134.06 E.00558
G1 X109.136 Y133.952 E.00505
; LINE_WIDTH: 0.534934
G1 F5487.652
G1 X109.185 Y133.844 E.00462
; LINE_WIDTH: 0.488957
G1 F6053.319
G1 X109.235 Y133.736 E.00418
; LINE_WIDTH: 0.420839
G1 F7144.39
G1 X109.284 Y133.628 E.00355
G1 X109.542 Y133.247 E.01375
G1 X109.858 Y133.009 E.01181
G1 X110.854 Y132.511 E.03326
G1 X111.076 Y132.431 E.00704
G1 X111.538 Y132.399 E.01383
G1 X111.948 Y132.523 E.01279
; WIPE_START
G1 X111.538 Y132.399 E-.16274
G1 X111.076 Y132.431 E-.17605
G1 X110.854 Y132.511 E-.08962
G1 X110.074 Y132.901 E-.33159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.087 Y134.26 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.60489
G1 F4804.527
M204 S6000
G1 X109.086 Y134.12 E.0062
; WIPE_START
G1 X109.087 Y134.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111147
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139584
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.792 Y135.407 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.14824
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00124
; LINE_WIDTH: 0.11403
G1 X109.979 Y135.174 E.00084
M204 S10000
G1 X110.75 Y135.625 F42000
; LINE_WIDTH: 0.125223
G1 F15000
M204 S6000
G1 X110.844 Y135.665 E.00066
G1 X110.989 Y135.634 E.00097
M204 S10000
G1 X111.957 Y135.474 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516645
G1 F5699.518
M204 S6000
G1 X111.458 Y135.715 E.02073
G1 X111.471 Y135.932 E.00813
G1 X111.427 Y135.969 E.00214
G1 X111.529 Y136.116 E.00667
; LINE_WIDTH: 0.480735
G1 F6166.988
G1 X111.575 Y136.282 E.00596
; LINE_WIDTH: 0.446385
G1 F6692.03
G1 X111.621 Y136.448 E.00549
; LINE_WIDTH: 0.399923
G1 F7562.973
G1 X111.667 Y136.614 E.00486
G1 X111.678 Y137.443 E.02338
G1 X111.642 Y137.804 E.01025
G1 X111.873 Y137.95 E.00771
G1 X112.012 Y137.811 E.00554
G1 X112.018 Y136.611 E.03386
; LINE_WIDTH: 0.412035
G1 F7314.794
G1 X112.001 Y136.417 E.00568
; LINE_WIDTH: 0.446385
G1 F6692.03
G1 X111.984 Y136.223 E.00621
; LINE_WIDTH: 0.480735
G1 F6166.988
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.507655
G1 F5809.762
G1 X111.958 Y135.534 E.01818
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.514 Y138.18 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.626267
G1 F4628.468
M204 S6000
G1 X110.066 Y140.475 E.12504
M204 S10000
G1 X109.864 Y140.884 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5432
G1 F5396.978
M204 S6000
G1 X109.708 Y140.786 E.00726
G1 X109.339 Y141.046 E.01784
G1 X109.056 Y141.103 E.01142
G1 X109.056 Y142.223 E.04428
G1 X109.833 Y140.936 E.05944
; WIPE_START
G1 X109.056 Y142.223 E-.57153
G1 X109.056 Y141.727 E-.18847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.406 Y147.422 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13993
G1 F15000
M204 S6000
G1 X108.475 Y147.525 E.00095
G2 X108.646 Y147.543 I.251 J-1.491 E.00132
G1 X112.594 Y147.549 E.03025
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X110.594 Y147.546 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/25
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 75
M204 S10000
G17
G3 Z5 I1.216 J-.038 P1  F42000
G1 X110.205 Y135.219 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G2 X110.856 Y135.414 I.885 J-1.77 E.02196
G2 X111.264 Y135.328 I.006 J-.989 E.01353
G2 X111.946 Y134.973 I-1.575 J-3.855 E.02476
G2 X112.21 Y134.647 I-.601 J-.755 E.01359
G1 X112.398 Y134.691 E.00622
G1 X112.398 Y137.972 E.10548
G1 X111.966 Y138.403 E.01963
G2 X108.781 Y143.557 I105.481 J68.741 E.19485
G1 X108.602 Y143.508 E.00597
G1 X108.602 Y140.597 E.0936
G1 X108.82 Y140.673 E.00741
G1 X109.137 Y140.637 E.01027
G1 X109.351 Y140.503 E.00811
G1 X109.682 Y140.167 E.01517
G1 X111.21 Y137.721 E.09275
G2 X111.302 Y137.429 I-.462 J-.306 E.00998
G1 X111.302 Y136.796 E.02035
G2 X111.059 Y136.209 I-.855 J.01 E.02095
G1 X110.8 Y135.95 E.01175
G1 X110.102 Y135.401 E.02856
G1 X110.175 Y135.271 E.00481
; WIPE_START
G1 X110.589 Y135.364 E-.161
G1 X110.856 Y135.414 E-.10318
G1 X111.004 Y135.406 E-.05645
G1 X111.264 Y135.328 E-.10327
G1 X111.946 Y134.973 E-.29217
G1 X112.031 Y134.895 E-.04393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.998 Y133.958 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.352 Y133.176 I.214 J.434 E.00534
G3 X111.902 Y133.591 I.027 J.537 E.02227
G3 X111.91 Y134.262 I-3.614 J.378 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01608
G1 X111.103 Y134.971 E.01777
G3 X110.868 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.666 J-2.86 E.01729
G3 X110.015 Y134.4 I.59 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01183
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09161
G1 X110.232 Y133.699 E-.06576
G1 X111.181 Y133.224 E-.40291
G1 X111.352 Y133.176 E-.06767
G1 X111.539 Y133.193 E-.07144
G1 X111.682 Y133.264 E-.0606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.195 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X108.744 Y140.231 I-.207 J-.261 E.01137
G3 X108.466 Y139.964 I1.043 J-1.364 E.01149
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.199 J.204 E.00411
G3 X109.189 Y135.183 I.074 J.402 E.00845
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.392 E.01719
G3 X110.868 Y137.529 I-.258 J-.005 E.00431
G1 X109.372 Y139.923 E.08408
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.004 Y140.258 E-.06685
G1 X108.865 Y140.273 E-.05336
G1 X108.744 Y140.231 E-.04865
G1 X108.466 Y139.964 E-.1463
G1 X108.41 Y139.88 E-.03849
G1 X108.39 Y139.781 E-.03855
G1 X108.39 Y138.813 E-.36781
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.294 Y132.965 Z5.2 F42000
G1 X132.791 Y109.716 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X132.818 Y109.848 E.00433
G2 X132.866 Y109.978 I.87 J-.246 E.00447
G1 X133.356 Y110.959 E.03525
G2 X134.553 Y111.347 I.805 J-.444 E.04454
G2 X134.966 Y111.123 I-.991 J-2.325 E.01515
G1 X135.103 Y111.276 E.00659
G2 X134.789 Y111.702 I1.59 J1.501 E.01705
G2 X134.847 Y112.398 I.692 J.293 E.02337
G1 X114.487 Y112.398 E.65471
G2 X112.398 Y114.487 I.032 J2.121 E.10508
G1 X112.398 Y133.246 E.60322
G1 X112.21 Y133.29 E.00622
G2 X111.022 Y132.866 I-.812 J.397 E.0449
G1 X110.041 Y133.356 E.03525
G2 X109.653 Y134.552 I.444 J.805 E.04454
G2 X109.879 Y134.97 I2.347 J-1.002 E.01529
G1 X109.727 Y135.107 E.00659
G2 X109.299 Y134.791 I-1.511 J1.601 E.01714
G2 X108.602 Y134.848 I-.294 J.691 E.02338
G1 X108.602 Y109.911 E.8019
G2 X109.973 Y108.602 I-1.403 J-2.842 E.0619
G1 X133.246 Y108.602 E.74839
G1 X133.291 Y108.79 E.00622
G2 X132.786 Y109.657 I.397 J.812 E.03418
M204 S10000
G1 X133.177 Y109.625 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G1 X133.179 Y109.554 E.00213
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01609
G1 X134.971 Y109.897 E.01777
G3 X135.021 Y110.132 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-2.862 J-.666 E.01729
G3 X134.401 Y110.985 I-.736 J-.59 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.183 Y109.685 I.463 J-.218 E.00422
; WIPE_START
M204 S6000
G1 X133.179 Y109.554 E-.04983
G1 X133.228 Y109.373 E-.07126
G1 X133.341 Y109.223 E-.07142
G1 X133.416 Y109.166 E-.03585
G1 X133.501 Y109.124 E-.03585
G1 X133.676 Y109.09 E-.06771
G1 X134.262 Y109.09 E-.22285
G1 X134.437 Y109.124 E-.06761
G1 X134.521 Y109.165 E-.03576
G1 X134.596 Y109.222 E-.03573
G1 X134.702 Y109.36 E-.06614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.811 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.42 J.528 E.0112
G1 X137.391 Y110.09 E.01718
G3 X137.527 Y110.132 I-.005 J.258 E.00431
G1 X139.929 Y111.633 E.08435
G1 X140.217 Y111.924 E.01221
G3 X140.226 Y112.267 I-.303 J.179 E.01067
G1 X139.964 Y112.533 E.01113
G3 X139.779 Y112.61 I-.185 J-.185 E.00611
G1 X135.731 Y112.61 E.12058
G3 X135.567 Y112.561 I-.002 J-.294 E.00516
G1 X135.205 Y112.203 E.01518
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.811 E-.07304
G1 X136.243 Y110.46 E-.65247
G1 X136.307 Y110.396 E-.03449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.017 Y112.219 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6632.609
M204 S6000
G1 X142.968 Y112.398 E.00597
G1 X140.595 Y112.398 E.07628
G1 X140.672 Y112.181 E.00741
G1 X140.64 Y111.898 E.00914
G1 X140.542 Y111.695 E.00726
G1 X140.175 Y111.325 E.01676
G1 X137.72 Y109.79 E.09311
G2 X137.427 Y109.698 I-.306 J.463 E.00998
G1 X136.795 Y109.698 E.02035
G2 X136.207 Y109.941 I.01 J.855 E.02095
G1 X135.949 Y110.2 E.01175
G1 X135.404 Y110.893 E.02837
G1 X135.221 Y110.791 E.00674
G2 X135.415 Y110.144 I-1.758 J-.878 E.0218
G2 X135.329 Y109.736 I-.989 J-.006 E.01353
G2 X134.974 Y109.054 I-3.862 J1.578 E.02477
G2 X134.647 Y108.79 I-.756 J.602 E.01359
G1 X134.692 Y108.602 E.00622
G1 X137.46 Y108.602 E.08901
G1 X137.548 Y108.702 E.00429
G1 X137.919 Y109.072 E.01685
G2 X142.966 Y112.189 I67.64 J-103.892 E.19075
; WIPE_START
G1 X142.968 Y112.398 E-.07947
G1 X141.177 Y112.398 E-.68053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.279 Y112.446 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.281 J-.137 E.00379
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.495 I.02 J1.726 E.07954
G1 X112.79 Y138.226 E.70686
G2 X112.619 Y138.305 I.046 J.324 E.00569
G1 X112.273 Y138.65 E.01454
G1 X110.86 Y140.87 E.0784
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.681 Y147.297 I.306 J-.007 E.01385
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.21 Y109.653 E1.13596
G2 X109.734 Y108.21 I-.969 J-2.55 E.06418
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.834 Y108.433 I.334 J-.036 E.00715
G1 X138.166 Y108.765 E.01396
G1 X140.39 Y110.179 E.0785
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07455
G2 X147.248 Y112.497 I-.014 J-.312 E.00821
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07012
G1 X147.31 Y110.508 E-.68988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131753
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.564 J-.975 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02756
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.916 Y111.458 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.431453
G1 F6949.231
M204 S6000
G1 X140.747 Y111.325 E.0066
; LINE_WIDTH: 0.395361
G1 F7660.854
G1 X140.578 Y111.192 E.00599
; LINE_WIDTH: 0.338616
G1 F9131.017
G2 X139.999 Y110.806 I-3.958 J5.299 E.01626
G1 X138.128 Y109.626 E.05166
; LINE_WIDTH: 0.330851
G1 F9377.254
G1 X137.932 Y109.598 E.00452
; LINE_WIDTH: 0.300324
G1 F10489.364
G1 X137.735 Y109.57 E.00404
M204 S10000
G1 X137.674 Y109.511 F42000
; LINE_WIDTH: 0.168779
G1 F15000
M204 S6000
M73 P93 R0
G1 X138.621 Y109.76 E.00973
M204 S10000
G1 X135.715 Y109.542 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.521769
G1 F5638.523
M204 S6000
G1 X135.906 Y109.521 E.00726
G1 X135.976 Y109.565 E.00311
; LINE_WIDTH: 0.508465
G1 F5799.654
G1 X136.13 Y109.482 E.00645
; LINE_WIDTH: 0.477335
G1 F6215.255
G1 X136.285 Y109.4 E.00602
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.535 Y109.361 E.00799
; LINE_WIDTH: 0.390021
G1 F7778.714
G1 X136.785 Y109.322 E.00693
G1 X137.335 Y109.322 E.01509
G1 X137.384 Y109.137 E.00525
G1 X137.428 Y109.111 E.00141
G1 X137.296 Y108.978 E.00514
G1 X136.785 Y108.978 E.01403
; LINE_WIDTH: 0.40594
G1 F7437.607
G1 X136.478 Y108.996 E.00882
; LINE_WIDTH: 0.44316
G1 F6745.952
G1 X136.17 Y109.015 E.00973
; LINE_WIDTH: 0.47572
G1 F6238.448
G1 X135.822 Y109.029 E.01191
; LINE_WIDTH: 0.511801
G1 F5758.39
G1 X135.474 Y109.043 E.0129
G1 X135.689 Y109.488 E.0183
M204 S10000
G1 X135.634 Y110.011 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.124543
G1 F15000
M204 S6000
G1 X135.666 Y110.155 E.00095
G1 X135.628 Y110.247 E.00064
M204 S10000
G1 X135.153 Y111.003 F42000
; LINE_WIDTH: 0.115944
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00094
; LINE_WIDTH: 0.153984
G1 X135.407 Y111.207 E.00143
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.111325
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140138
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.06 Y111.914 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60477
G1 F4805.553
M204 S6000
G1 X134.199 Y111.913 E.00614
M204 S10000
G1 X113.597 Y110.553 F42000
; LINE_WIDTH: 0.49787
G1 F5934.719
M204 S6000
G1 X113.922 Y110.53 E.01173
; LINE_WIDTH: 0.45309
G1 F6582.637
G1 X114.248 Y110.508 E.01058
; LINE_WIDTH: 0.415277
G1 F7251.112
G1 X130.973 Y110.5 E.49193
M204 S10000
G1 X110.932 Y111.881 F42000
; LINE_WIDTH: 0.525244
G1 F5597.901
M204 S6000
G1 X111.346 Y111.385 E.02459
G1 X111.879 Y110.932 E.02667
G1 X111.107 Y110.932 E.02943
G1 X110.932 Y111.111 E.00953
G1 X110.932 Y111.821 E.02704
M204 S10000
G1 X110.52 Y113.951 F42000
; LINE_WIDTH: 0.425467
G1 F7057.958
M204 S6000
G1 X110.791 Y113.016 E.02944
G1 X111.141 Y112.327 E.02333
G1 X111.569 Y111.778 E.02104
G1 X112.086 Y111.31 E.02107
G1 X112.677 Y110.94 E.02107
G1 X113.315 Y110.668 E.02095
; LINE_WIDTH: 0.46155
G1 F6449.61
G1 X113.456 Y110.61 E.00504
; LINE_WIDTH: 0.50069
G1 F5898.159
G1 X113.597 Y110.553 E.00552
; LINE_WIDTH: 0.503549
G1 F5861.559
G1 X113.361 Y110.536 E.0086
; LINE_WIDTH: 0.470125
G1 F6320.151
G1 X113.125 Y110.519 E.00797
; LINE_WIDTH: 0.421815
G1 F7125.986
G1 X112.89 Y110.502 E.00707
G1 X110.914 Y110.502 E.05915
G1 X110.535 Y110.892 E.01626
G1 X110.502 Y110.96 E.00226
G2 X110.517 Y113.891 I63.294 J1.142 E.08773
M204 S10000
G1 X110.5 Y131.032 F42000
; LINE_WIDTH: 0.41573
G1 F7242.301
M204 S6000
G1 X110.5 Y114.478 E.48752
G1 X110.518 Y114.011 E.01374
M204 S10000
G1 X110.875 Y131.327 F42000
; LINE_WIDTH: 0.41999
G1 F7160.478
M204 S6000
G1 X110.875 Y114.478 E.50187
G1 X110.969 Y113.708 E.02308
G1 X111.151 Y113.128 E.01811
G1 X111.468 Y112.516 E.02054
G1 X111.858 Y112.02 E.01879
G1 X112.328 Y111.599 E.01881
G1 X112.865 Y111.266 E.01881
G1 X113.447 Y111.033 E.01868
G1 X114.3 Y110.887 E.02576
G1 X131.611 Y110.875 E.51563
G1 X131.389 Y110.383 E.01606
G1 X131.327 Y110.125 E.0079
G1 X110.744 Y110.125 E.6131
G1 X110.299 Y110.598 E.01933
G1 X110.125 Y110.737 E.00664
G1 X110.125 Y131.611 E.62173
G1 X110.616 Y131.389 E.01604
G1 X110.816 Y131.341 E.00613
M204 S10000
G1 X111.252 Y131.657 F42000
G1 F7160.478
M204 S6000
G1 X111.252 Y114.478 E.5117
G1 X111.328 Y113.821 E.01968
G1 X111.51 Y113.241 E.01811
G1 X111.794 Y112.705 E.01808
G1 X112.147 Y112.263 E.01684
G1 X112.571 Y111.888 E.01686
G1 X113.054 Y111.593 E.01686
G1 X113.576 Y111.387 E.01672
G1 X114.478 Y111.252 E.02715
G1 X132.221 Y111.252 E.52851
G1 X131.837 Y110.483 E.02561
G1 X131.681 Y109.993 E.0153
G1 X131.658 Y109.748 E.00733
G1 X110.574 Y109.748 E.62798
G3 X109.748 Y110.556 I-3.163 J-2.407 E.03454
G1 X109.748 Y132.221 E.64529
G1 X110.517 Y131.836 E.02561
G1 X111.007 Y131.68 E.01529
G1 X111.192 Y131.663 E.00555
M204 S10000
G1 X111.629 Y132.034 F42000
; LINE_WIDTH: 0.41999
G1 F7160.475
M204 S6000
G1 X111.629 Y114.478 E.52293
G1 X111.688 Y113.934 E.01628
G1 X111.87 Y113.354 E.01811
G1 X112.121 Y112.894 E.01562
G1 X112.464 Y112.474 E.01614
G1 X112.894 Y112.12 E.01659
G1 X113.332 Y111.878 E.01491
G1 X113.822 Y111.713 E.01542
G3 X114.478 Y111.629 I.947 J4.788 E.01969
G1 X132.903 Y111.629 E.5488
G1 X132.672 Y111.311 E.01169
G1 X132.174 Y110.314 E.0332
G1 X132.056 Y109.958 E.01117
G1 X132.034 Y109.371 E.01749
G1 X110.395 Y109.371 E.64454
G1 X109.897 Y109.943 E.02259
G1 X109.502 Y110.27 E.01527
G1 X109.371 Y110.354 E.00463
G1 X109.371 Y132.902 E.67162
G1 X109.689 Y132.672 E.01169
G1 X110.686 Y132.173 E.0332
G1 X111.042 Y132.056 E.01117
G1 X111.569 Y132.036 E.01571
M204 S10000
G1 X112.006 Y132.54 F42000
; LINE_WIDTH: 0.41999
G1 F7160.477
M204 S6000
G1 X112.006 Y114.478 E.53801
G1 X112.048 Y114.047 E.01288
G1 X112.23 Y113.467 E.01811
G3 X113.873 Y112.086 I2.328 J1.102 E.06594
G3 X114.478 Y112.006 I.896 J4.414 E.01818
G1 X133.545 Y112.006 E.56793
; LINE_WIDTH: 0.442969
G1 F6749.178
G1 X133.674 Y111.983 E.00414
; LINE_WIDTH: 0.488927
G1 F6053.727
G1 X133.803 Y111.96 E.00461
; LINE_WIDTH: 0.534884
G1 F5488.209
G1 X133.931 Y111.937 E.00509
; LINE_WIDTH: 0.580842
G1 F5019.322
G1 X134.06 Y111.914 E.00556
G1 X133.953 Y111.865 E.00504
; LINE_WIDTH: 0.534884
G1 F5488.209
G1 X133.845 Y111.815 E.00461
; LINE_WIDTH: 0.488927
G1 F6053.727
G1 X133.737 Y111.766 E.00418
; LINE_WIDTH: 0.420044
G1 F7159.455
G1 X133.629 Y111.716 E.00353
G1 X133.247 Y111.459 E.01374
G1 X133.01 Y111.142 E.01178
G1 X132.511 Y110.145 E.0332
G1 X132.431 Y109.923 E.00705
G1 X132.4 Y109.447 E.01419
G1 X132.541 Y108.994 E.01414
G1 X110.188 Y108.994 E.66588
G1 X110.06 Y109.192 E.00702
G1 X109.613 Y109.696 E.02007
G3 X108.994 Y110.137 I-1.777 J-1.839 E.02272
G1 X108.994 Y133.544 E.69732
; LINE_WIDTH: 0.442972
G1 F6749.136
G1 X109.017 Y133.673 E.00414
; LINE_WIDTH: 0.488934
G1 F6053.625
G1 X109.04 Y133.802 E.00461
; LINE_WIDTH: 0.534897
G1 F5488.07
G1 X109.063 Y133.931 E.00509
; LINE_WIDTH: 0.580859
G1 F5019.159
G1 X109.086 Y134.06 E.00556
G1 X109.135 Y133.952 E.00504
; LINE_WIDTH: 0.534897
G1 F5488.07
G1 X109.185 Y133.844 E.00461
; LINE_WIDTH: 0.488934
G1 F6053.625
G1 X109.234 Y133.737 E.00418
; LINE_WIDTH: 0.420837
G1 F7144.433
M73 P94 R0
G1 X109.284 Y133.629 E.00354
G1 X109.542 Y133.246 E.01377
G1 X109.858 Y133.009 E.0118
G1 X110.855 Y132.511 E.03328
G1 X111.077 Y132.431 E.00706
G1 X111.552 Y132.399 E.01421
G1 X111.949 Y132.522 E.01239
; WIPE_START
G1 X111.552 Y132.399 E-.1577
G1 X111.077 Y132.431 E-.18092
G1 X110.855 Y132.511 E-.08983
G1 X110.074 Y132.901 E-.33155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.087 Y134.26 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.60486
G1 F4804.783
M204 S6000
G1 X109.086 Y134.12 E.00622
; WIPE_START
G1 X109.087 Y134.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111106
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139487
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.792 Y135.407 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.148318
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00124
; LINE_WIDTH: 0.114056
G1 X109.979 Y135.174 E.00084
M204 S10000
G1 X110.779 Y135.675 F42000
; LINE_WIDTH: 0.123005
G1 F15000
M204 S6000
G1 X110.989 Y135.634 E.00135
M204 S10000
G1 X111.957 Y135.474 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516429
G1 F5702.108
M204 S6000
G1 X111.458 Y135.715 E.02074
G1 X111.471 Y135.934 E.00823
G1 X111.428 Y135.971 E.00209
G1 X111.529 Y136.116 E.00661
; LINE_WIDTH: 0.480697
G1 F6167.528
G1 X111.575 Y136.282 E.00595
; LINE_WIDTH: 0.44637
G1 F6692.279
G1 X111.621 Y136.448 E.00549
; LINE_WIDTH: 0.399928
G1 F7562.864
G1 X111.666 Y136.614 E.00485
G1 X111.678 Y137.443 E.02338
G1 X111.642 Y137.804 E.01025
G1 X111.873 Y137.95 E.0077
G1 X112.012 Y137.811 E.00554
G1 X112.018 Y136.61 E.03387
; LINE_WIDTH: 0.412044
G1 F7314.628
G1 X112.001 Y136.417 E.00567
; LINE_WIDTH: 0.44637
G1 F6692.279
G1 X111.984 Y136.223 E.0062
; LINE_WIDTH: 0.480697
G1 F6167.528
G1 X111.967 Y136.029 E.00673
; LINE_WIDTH: 0.50753
G1 F5811.326
G1 X111.958 Y135.534 E.01818
; WIPE_START
G1 X111.967 Y136.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.35 Y134.479 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X112.35 Y133.458 E.03932
; WIPE_START
G1 X112.35 Y134.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.514 Y138.18 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.626253
G1 F4628.573
M204 S6000
G1 X110.066 Y140.476 E.12504
M204 S10000
G1 X109.864 Y140.884 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5432
G1 F5396.978
M204 S6000
G1 X109.708 Y140.786 E.00726
G1 X109.339 Y141.046 E.01784
G1 X109.056 Y141.103 E.01142
G1 X109.056 Y142.223 E.04428
G1 X109.833 Y140.936 E.05944
; WIPE_START
G1 X109.056 Y142.223 E-.57152
G1 X109.056 Y141.727 E-.18848
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.406 Y147.413 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13453
G1 F15000
M204 S6000
G1 X108.455 Y147.491 E.00067
; LINE_WIDTH: 0.169066
G2 X108.56 Y147.537 I.075 J-.029 E.00126
; LINE_WIDTH: 0.138384
G1 X112.594 Y147.549 E.03042
; WIPE_START
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.462 Y140.963 Z5.2 F42000
G1 X133.459 Y108.65 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X134.479 Y108.65 E.03931
; WIPE_START
G1 X133.459 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.433 Y111.751 Z5.2 F42000
G1 X141.035 Y112.019 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39394
G1 F7691.871
M204 S6000
G1 X141.95 Y112.019 E.02538
G1 X141.276 Y111.613 E.02181
G1 X141.029 Y111.959 E.01181
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7691.871
G1 X141.276 Y111.613 E-.16184
G1 X141.95 Y112.019 E-.29891
G1 X141.163 Y112.019 E-.29925
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/25
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
M106 S81.6
; OBJECT_ID: 75
M204 S10000
G17
G3 Z5.2 I-.701 J-.995 P1  F42000
G1 X109.998 Y133.958 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S5000
G3 X110.232 Y133.699 I.486 J.203 E.0106
G1 X111.181 Y133.224 E.03158
G3 X111.352 Y133.176 I.215 J.435 E.00534
G3 X111.902 Y133.591 I.027 J.537 E.02227
G3 X111.91 Y134.262 I-3.612 J.377 E.02001
G3 X111.637 Y134.704 I-.564 J-.043 E.01609
G1 X111.103 Y134.971 E.01777
G3 X110.868 Y135.021 I-.233 J-.514 E.00724
G3 X110.319 Y134.834 I.666 J-2.861 E.01729
G3 X110.015 Y134.4 I.591 J-.736 E.01599
G3 X109.978 Y134.014 I.469 J-.24 E.01183
; WIPE_START
M204 S6000
G1 X110.094 Y133.803 E-.09159
G1 X110.232 Y133.699 E-.06575
G1 X111.181 Y133.224 E-.40292
G1 X111.352 Y133.176 E-.06768
G1 X111.539 Y133.193 E-.07146
G1 X111.682 Y133.264 E-.0606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.103 Y140.196 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X108.744 Y140.231 I-.211 J-.298 E.01125
G3 X108.466 Y139.964 I1.049 J-1.37 E.01149
G3 X108.39 Y139.781 I.184 J-.184 E.00608
G1 X108.39 Y135.722 E.12089
G3 X108.466 Y135.538 I.26 J0 E.00608
G1 X108.798 Y135.207 E.01397
G3 X108.915 Y135.137 I.199 J.203 E.00411
G3 X109.19 Y135.183 I.074 J.401 E.00845
G1 X110.54 Y136.244 E.05114
G1 X110.768 Y136.472 E.00962
G3 X110.91 Y136.815 I-.527 J.419 E.0112
G1 X110.91 Y137.392 E.01719
G3 X110.868 Y137.529 I-.259 J-.005 E.00431
G1 X109.372 Y139.923 E.08409
G1 X109.145 Y140.153 E.00962
; WIPE_START
M204 S6000
G1 X109.014 Y140.251 E-.06215
G1 X108.935 Y140.269 E-.03104
G1 X108.853 Y140.269 E-.03107
G1 X108.744 Y140.231 E-.04404
G1 X108.466 Y139.964 E-.14627
G1 X108.41 Y139.88 E-.03851
G1 X108.39 Y139.781 E-.03853
G1 X108.39 Y138.811 E-.3684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.331 Y132.994 Z5.4 F42000
G1 X133.177 Y109.626 Z5.4
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S5000
G1 X133.178 Y109.554 E.00217
G3 X133.676 Y109.09 I.509 J.048 E.02215
G1 X134.262 Y109.09 E.01747
G3 X134.704 Y109.363 I-.043 J.564 E.01608
G1 X134.971 Y109.897 E.01776
G3 X135.021 Y110.132 I-.514 J.233 E.00724
G3 X134.835 Y110.681 I-2.864 J-.667 E.01729
G3 X134.401 Y110.985 I-.736 J-.591 E.01599
G3 X133.699 Y110.768 I-.24 J-.469 E.02422
G1 X133.225 Y109.819 E.03158
G3 X133.183 Y109.686 I.463 J-.218 E.00418
; WIPE_START
M204 S6000
G1 X133.178 Y109.554 E-.05029
G1 X133.228 Y109.373 E-.07132
G1 X133.341 Y109.223 E-.07139
G1 X133.416 Y109.166 E-.03587
G1 X133.501 Y109.124 E-.03583
G1 X133.676 Y109.09 E-.0677
G1 X134.262 Y109.09 E-.22289
G1 X134.437 Y109.124 E-.06754
G1 X134.521 Y109.165 E-.0358
G1 X134.596 Y109.222 E-.03575
G1 X134.701 Y109.359 E-.06561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.135 Y111.937 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S5000
G3 X135.182 Y111.81 I.337 J.053 E.00404
G1 X136.243 Y110.46 E.05114
G1 X136.471 Y110.232 E.00962
G3 X136.814 Y110.09 I.42 J.528 E.0112
G1 X137.381 Y110.09 E.01689
G3 X137.519 Y110.127 I.005 J.258 E.00431
G1 X139.929 Y111.633 E.08465
G1 X140.217 Y111.924 E.0122
G3 X140.226 Y112.267 I-.344 J.18 E.01059
G1 X139.964 Y112.533 E.01113
G3 X139.779 Y112.61 I-.185 J-.185 E.0061
G1 X135.721 Y112.61 E.12089
G3 X135.56 Y112.554 I.012 J-.294 E.00515
G1 X135.205 Y112.203 E.01486
G3 X135.131 Y111.996 I.266 J-.213 E.00666
; WIPE_START
M204 S6000
G1 X135.182 Y111.81 E-.07311
G1 X136.243 Y110.46 E-.65243
G1 X136.307 Y110.396 E-.03447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.809 Y111.798 Z5.4 F42000
G1 X147.281 Y112.446 Z5.4
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S5000
G2 X147.31 Y112.323 I-.277 J-.131 E.0038
G1 X147.31 Y108.21 E.12252
G1 X147.79 Y108.21 E.0143
G1 X147.79 Y112.79 E.13642
G1 X114.495 Y112.79 E.99173
G2 X112.79 Y114.495 I.02 J1.726 E.07953
G1 X112.79 Y138.226 E.70687
G2 X112.619 Y138.305 I.046 J.325 E.00569
G1 X112.273 Y138.65 E.01455
G1 X110.86 Y140.87 E.07839
G1 X108.406 Y144.937 E.14147
G1 X108.389 Y145.029 E.00278
G1 X108.383 Y146.998 E.05866
G2 X108.681 Y147.297 I.306 J-.007 E.01385
G1 X112.79 Y147.309 E.1224
G1 X112.79 Y147.79 E.01432
G1 X108.21 Y147.79 E.13642
G1 X108.212 Y109.653 E1.13598
G2 X109.734 Y108.21 I-.971 J-2.55 E.06413
G1 X137.729 Y108.21 E.83388
G1 X137.729 Y108.223 E.00039
G2 X137.819 Y108.418 I.333 J-.036 E.00652
G1 X138.165 Y108.765 E.01458
G1 X140.39 Y110.179 E.07851
G1 X144.417 Y112.604 E.14004
G1 X144.509 Y112.621 E.00279
G1 X147.012 Y112.621 E.07456
G2 X147.25 Y112.498 I-.008 J-.306 E.00826
; WIPE_START
M204 S6000
G1 X147.31 Y112.323 E-.07027
G1 X147.31 Y110.508 E-.68973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X147.428 Y112.594 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131759
G1 F15000
M204 S6000
G2 X147.529 Y112.529 I-.56 J-.968 E.00084
G1 X147.55 Y112.334 E.00137
G1 X147.55 Y108.406 E.02757
; WIPE_START
G1 X147.55 Y110.406 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.934 Y110.908 Z5.4 F42000
G1 X135.407 Y111.207 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.153961
G1 F15000
M204 S6000
G1 X135.28 Y111.105 E.00143
; LINE_WIDTH: 0.115934
G1 X135.153 Y111.003 E.00094
; WIPE_START
G1 X135.28 Y111.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.081 Y112.386 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.111308
G1 F15000
M204 S6000
G1 X135.153 Y112.49 E.00068
; LINE_WIDTH: 0.140055
G1 X135.225 Y112.594 E.00097
; WIPE_START
G1 X135.153 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.479 Y108.65 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.53086
G1 F5533.467
M204 S6000
G1 X133.459 Y108.65 E.03932
; WIPE_START
G1 X134.479 Y108.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.398 Y114.346 Z5.4 F42000
G1 X112.35 Y133.458 Z5.4
G1 Z5
G1 E.8 F1800
G1 F5533.467
M204 S6000
G1 X112.35 Y134.479 E.03932
M204 S10000
G1 X112.583 Y135.246 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7160.291
M204 S2000
G1 X112.023 Y134.686 E.02359
G1 X111.705 Y134.902
G1 X112.583 Y135.779 E.03698
G1 X112.583 Y136.313
G1 X111.349 Y135.079 E.05195
G1 X110.96 Y135.224
G1 X112.583 Y136.846 E.06833
G1 X112.583 Y137.379
G1 X110.223 Y135.02 E.0994
G1 X110.119 Y135.449
G1 X112.583 Y137.912 E.10377
G1 X112.384 Y138.247
G1 X111.112 Y136.975 E.05358
G1 X111.096 Y137.492
G1 X112.117 Y138.513 E.043
G1 X111.908 Y138.838
G1 X110.915 Y137.845 E.04183
G1 X110.71 Y138.173
G1 X111.701 Y139.163 E.04173
G1 X111.493 Y139.489
G1 X110.505 Y138.501 E.04163
G1 X110.3 Y138.829
G1 X111.286 Y139.815 E.04153
G1 X111.078 Y140.141
G1 X110.095 Y139.157 E.04143
G1 X109.89 Y139.485
G1 X110.871 Y140.467 E.04133
M73 P95 R0
G1 X110.664 Y140.793
G1 X109.685 Y139.814 E.04126
G1 X109.463 Y140.126
G1 X110.463 Y141.126 E.04214
G1 X110.263 Y141.458
G1 X109.19 Y140.386 E.04518
G1 X108.71 Y140.439
G1 X110.062 Y141.791 E.05695
G1 X109.861 Y142.124
G1 X108.417 Y140.68 E.06083
G1 X108.417 Y141.213
G1 X109.661 Y142.456 E.05238
G1 X109.46 Y142.789
G1 X108.417 Y141.746 E.04393
G1 X108.417 Y142.279
G1 X109.259 Y143.121 E.03547
G1 X109.059 Y143.454
G1 X108.417 Y142.813 E.02702
G1 X108.417 Y143.346
G1 X108.858 Y143.787 E.01857
; WIPE_START
M204 S6000
G1 X108.417 Y143.346 E-.23689
G1 X108.417 Y142.813 E-.20264
G1 X109.014 Y143.409 E-.32048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.408 Y137.168 Z5.4 F42000
G1 X133.252 Y108.988 Z5.4
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S2000
G1 X132.681 Y108.417 E.02406
G1 X132.147 Y108.417
G1 X133.038 Y109.308 E.03753
G1 X132.991 Y109.794
G1 X131.614 Y108.417 E.058
G1 X131.081 Y108.417
G1 X133.504 Y110.84 E.10206
G1 X134.398 Y111.202
G1 X134.963 Y111.766 E.02377
G1 X134.914 Y112.25
G1 X133.831 Y111.167 E.04562
; WIPE_START
M204 S6000
G1 X134.914 Y112.25 E-.58201
G1 X134.961 Y111.784 E-.17799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.713 Y112.583 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S2000
G1 X130.547 Y108.417 E.17546
G1 X130.014 Y108.417
G1 X134.179 Y112.583 E.17546
G1 X133.646 Y112.583
G1 X129.481 Y108.417 E.17546
G1 X128.948 Y108.417
G1 X133.113 Y112.583 E.17546
G1 X132.58 Y112.583
G1 X128.414 Y108.417 E.17546
G1 X127.881 Y108.417
G1 X132.046 Y112.583 E.17546
G1 X131.513 Y112.583
G1 X127.348 Y108.417 E.17546
G1 X126.815 Y108.417
G1 X130.98 Y112.583 E.17546
G1 X130.447 Y112.583
G1 X126.281 Y108.417 E.17546
G1 X125.748 Y108.417
G1 X129.913 Y112.583 E.17546
G1 X129.38 Y112.583
G1 X125.215 Y108.417 E.17546
G1 X124.682 Y108.417
G1 X128.847 Y112.583 E.17546
G1 X128.314 Y112.583
G1 X124.148 Y108.417 E.17546
G1 X123.615 Y108.417
G1 X127.78 Y112.583 E.17546
G1 X127.247 Y112.583
G1 X123.082 Y108.417 E.17546
G1 X122.549 Y108.417
G1 X126.714 Y112.583 E.17546
G1 X126.181 Y112.583
G1 X122.015 Y108.417 E.17546
G1 X121.482 Y108.417
G1 X125.647 Y112.583 E.17546
G1 X125.114 Y112.583
G1 X120.949 Y108.417 E.17546
G1 X120.416 Y108.417
G1 X124.581 Y112.583 E.17546
G1 X124.048 Y112.583
G1 X119.882 Y108.417 E.17546
G1 X119.349 Y108.417
G1 X123.514 Y112.583 E.17546
G1 X122.981 Y112.583
G1 X118.816 Y108.417 E.17546
G1 X118.283 Y108.417
G1 X122.448 Y112.583 E.17546
G1 X121.915 Y112.583
G1 X117.749 Y108.417 E.17546
G1 X117.216 Y108.417
G1 X121.381 Y112.583 E.17546
G1 X120.848 Y112.583
G1 X116.683 Y108.417 E.17546
G1 X116.15 Y108.417
G1 X120.315 Y112.583 E.17546
G1 X119.782 Y112.583
G1 X115.616 Y108.417 E.17546
G1 X115.083 Y108.417
G1 X119.248 Y112.583 E.17546
G1 X118.715 Y112.583
G1 X114.55 Y108.417 E.17546
G1 X114.017 Y108.417
G1 X118.182 Y112.583 E.17546
G1 X117.648 Y112.583
G1 X113.483 Y108.417 E.17546
G1 X112.95 Y108.417
G1 X117.115 Y112.583 E.17546
G1 X116.582 Y112.583
G1 X112.417 Y108.417 E.17546
G1 X111.883 Y108.417
G1 X116.049 Y112.583 E.17546
G1 X115.515 Y112.583
G1 X111.35 Y108.417 E.17546
G1 X110.817 Y108.417
G1 X114.982 Y112.583 E.17546
G1 X114.452 Y112.586
G1 X110.284 Y108.417 E.17559
G1 X109.824 Y108.491
G1 X113.986 Y112.653 E.17534
G1 X113.605 Y112.806
G1 X109.617 Y108.818 E.168
G1 X109.376 Y109.11
G1 X113.285 Y113.018 E.16464
G1 X113.022 Y113.288
G1 X109.1 Y109.366 E.16522
G1 X108.795 Y109.595
G1 X112.808 Y113.608 E.16906
G1 X112.658 Y113.991
G1 X108.439 Y109.772 E.17771
G1 X108.417 Y110.284
G1 X112.586 Y114.452 E.17559
G1 X112.583 Y114.982
G1 X108.417 Y110.817 E.17546
G1 X108.417 Y111.35
G1 X112.583 Y115.516 E.17546
G1 X112.583 Y116.049
G1 X108.417 Y111.884 E.17546
G1 X108.417 Y112.417
G1 X112.583 Y116.582 E.17546
G1 X112.583 Y117.115
G1 X108.417 Y112.95 E.17546
G1 X108.417 Y113.483
G1 X112.583 Y117.649 E.17546
G1 X112.583 Y118.182
G1 X108.417 Y114.017 E.17546
G1 X108.417 Y114.55
G1 X112.583 Y118.715 E.17546
G1 X112.583 Y119.248
G1 X108.417 Y115.083 E.17546
G1 X108.417 Y115.616
G1 X112.583 Y119.782 E.17546
G1 X112.583 Y120.315
G1 X108.417 Y116.15 E.17546
M73 P96 R0
G1 X108.417 Y116.683
G1 X112.583 Y120.848 E.17546
G1 X112.583 Y121.381
G1 X108.417 Y117.216 E.17546
G1 X108.417 Y117.749
G1 X112.583 Y121.915 E.17546
G1 X112.583 Y122.448
G1 X108.417 Y118.283 E.17546
G1 X108.417 Y118.816
G1 X112.583 Y122.981 E.17546
G1 X112.583 Y123.514
G1 X108.417 Y119.349 E.17546
G1 X108.417 Y119.882
G1 X112.583 Y124.048 E.17546
G1 X112.583 Y124.581
G1 X108.417 Y120.416 E.17546
G1 X108.417 Y120.949
G1 X112.583 Y125.114 E.17546
G1 X112.583 Y125.647
G1 X108.417 Y121.482 E.17546
G1 X108.417 Y122.015
G1 X112.583 Y126.181 E.17546
G1 X112.583 Y126.714
G1 X108.417 Y122.549 E.17546
G1 X108.417 Y123.082
G1 X112.583 Y127.247 E.17546
G1 X112.583 Y127.781
G1 X108.417 Y123.615 E.17546
G1 X108.417 Y124.149
G1 X112.583 Y128.314 E.17546
G1 X112.583 Y128.847
G1 X108.417 Y124.682 E.17546
G1 X108.417 Y125.215
G1 X112.583 Y129.38 E.17546
G1 X112.583 Y129.914
G1 X108.417 Y125.748 E.17546
G1 X108.417 Y126.282
G1 X112.583 Y130.447 E.17546
G1 X112.583 Y130.98
G1 X108.417 Y126.815 E.17546
G1 X108.417 Y127.348
G1 X112.583 Y131.513 E.17546
G1 X112.583 Y132.047
G1 X108.417 Y127.881 E.17546
G1 X108.417 Y128.415
G1 X112.583 Y132.58 E.17546
G1 X112.583 Y133.113
G1 X108.417 Y128.948 E.17546
G1 X108.417 Y129.481
G1 X112.187 Y133.251 E.15881
G1 X111.372 Y132.969
G1 X108.417 Y130.014 E.12446
G1 X108.417 Y130.548
G1 X110.968 Y133.099 E.10746
G1 X110.613 Y133.276
G1 X108.417 Y131.081 E.09249
G1 X108.417 Y131.614
G1 X110.257 Y133.454 E.07751
G1 X109.937 Y133.667
G1 X108.417 Y132.147 E.06402
G1 X108.417 Y132.681
G1 X109.762 Y134.026 E.05666
G1 X109.979 Y134.776
G1 X108.417 Y133.214 E.0658
G1 X108.417 Y133.747
G1 X109.719 Y135.048 E.05482
G1 X109.058 Y134.921
G1 X108.417 Y134.28 E.02699
; WIPE_START
M204 S6000
G1 X109.058 Y134.921 E-.34431
G1 X109.719 Y135.048 E-.25564
G1 X109.421 Y134.751 E-.16006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.804 Y130.567 Z5.4 F42000
G1 X143.245 Y112.583 Z5.4
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S2000
G1 X142.133 Y111.471 E.04683
; WIPE_START
M204 S6000
G1 X143.245 Y112.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.792 Y110.663 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S2000
G1 X142.712 Y112.583 E.08085
G1 X142.178 Y112.583
G1 X139.375 Y109.779 E.11808
; WIPE_START
M204 S6000
G1 X140.789 Y111.194 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.48 Y108.417 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S2000
G1 X141.645 Y112.583 E.17546
G1 X141.112 Y112.583
G1 X140.442 Y111.913 E.02822
G1 X139.9 Y111.37
G1 X136.947 Y108.417 E.1244
G1 X136.413 Y108.417
G1 X138.477 Y110.481 E.08693
; WIPE_START
M204 S6000
G1 X137.063 Y109.067 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.345 Y109.883 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F7160.291
M204 S2000
G1 X135.88 Y108.417 E.06172
G1 X135.347 Y108.417
G1 X136.812 Y109.883 E.06172
G1 X136.409 Y110.013
G1 X134.814 Y108.417 E.06723
G1 X134.686 Y108.823
G1 X136.137 Y110.274 E.06111
G1 X135.897 Y110.567
G1 X135.166 Y109.837 E.03076
G1 X135.173 Y110.376
G1 X135.663 Y110.867 E.02066
; WIPE_START
M204 S6000
G1 X135.173 Y110.376 E-.26351
G1 X135.166 Y109.837 E-.2051
G1 X135.709 Y110.379 E-.29138
; WIPE_END
M73 P97 R0
G1 E-.04 F1800
M204 S10000
G1 X128.117 Y111.171 Z5.4 F42000
G1 X114.221 Y112.622 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0913656
G1 F15000
M204 S6000
G1 X114.068 Y112.572 E.00062
; WIPE_START
G1 X114.221 Y112.622 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.092 Y120.17 Z5.4 F42000
G1 X111.167 Y133.031 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.104759
G1 F15000
M204 S6000
G1 X111.102 Y133.015 E.00033
G1 X111.023 Y133.071 E.00048
; WIPE_START
G1 X111.102 Y133.015 E-.4485
G1 X111.167 Y133.031 E-.3115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.545 Y140.489 Z5.4 F42000
G1 X108.812 Y143.861 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0981044
G1 F15000
M204 S6000
G1 X108.748 Y143.943 E.00046
; LINE_WIDTH: 0.125341
G1 X108.631 Y143.995 E.00083
; LINE_WIDTH: 0.159938
G1 X108.515 Y144.046 E.00118
; LINE_WIDTH: 0.194535
G1 X108.399 Y144.098 E.00153
; WIPE_START
G1 X108.515 Y144.046 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.919 Y137.813 Z5.4 F42000
G1 X133.27 Y109.007 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.091743
G1 F15000
M204 S6000
G1 X133.134 Y109.138 E.00073
; WIPE_START
G1 X133.27 Y109.007 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.22 Y110.263 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.109419
G1 F15000
M204 S6000
G1 X133.123 Y110.127 E.00088
; LINE_WIDTH: 0.151905
G1 X133.026 Y109.992 E.00143
; LINE_WIDTH: 0.194392
G1 X132.929 Y109.856 E.00199
; WIPE_START
G1 X133.026 Y109.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.869 Y111.046 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.117568
G1 F15000
M204 S6000
G1 X134.834 Y111.051 E.00021
; LINE_WIDTH: 0.148215
G1 X134.799 Y111.055 E.00029
; LINE_WIDTH: 0.182044
G1 X134.787 Y111.083 E.00032
; LINE_WIDTH: 0.219046
G1 X134.776 Y111.11 E.00041
; LINE_WIDTH: 0.264096
G1 F12207.508
G1 X134.764 Y111.137 E.00052
G1 X134.781 Y111.154 E.00042
; LINE_WIDTH: 0.283718
G1 F11212.758
G1 X135.173 Y111.527 E.01029
; WIPE_START
G1 X134.781 Y111.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.228 Y109.775 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.195092
G1 F15000
M204 S6000
G1 X135.131 Y109.639 E.002
; LINE_WIDTH: 0.152325
G1 X135.034 Y109.504 E.00144
; LINE_WIDTH: 0.109559
G1 X134.938 Y109.368 E.00088
; WIPE_START
G1 X135.034 Y109.504 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.549 Y109.82 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.113019
G1 F15000
M204 S6000
G1 X137.336 Y109.892 E.00125
M204 S10000
G1 X137.686 Y109.985 F42000
; LINE_WIDTH: 0.103401
G1 F15000
M204 S6000
G2 X137.427 Y109.801 I-1.347 J1.617 E.00152
; WIPE_START
G1 X137.686 Y109.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.108 Y110.874 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.111318
G1 F15000
M204 S6000
G1 X138.918 Y110.723 E.00131
; LINE_WIDTH: 0.15761
G1 X138.728 Y110.572 E.0022
; LINE_WIDTH: 0.203903
G1 X138.538 Y110.42 E.00309
M204 S10000
G1 X139.315 Y109.84 F42000
; LINE_WIDTH: 0.204539
G1 F15000
M204 S6000
G1 X139.118 Y109.683 E.00321
; LINE_WIDTH: 0.157992
G1 X138.922 Y109.526 E.00229
; LINE_WIDTH: 0.111444
G1 X138.726 Y109.368 E.00136
; WIPE_START
G1 X138.922 Y109.526 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.731 Y110.724 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.205576
G1 F15000
M204 S6000
G1 X140.579 Y110.605 E.00249
; LINE_WIDTH: 0.166019
G1 X140.426 Y110.486 E.00188
; LINE_WIDTH: 0.126383
G1 X140.273 Y110.366 E.00128
; LINE_WIDTH: 0.097336
G1 X140.19 Y110.299 E.00046
; WIPE_START
G1 X140.273 Y110.366 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.072 Y111.532 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.202503
G1 F15000
M204 S6000
G1 X141.894 Y111.392 E.00286
; LINE_WIDTH: 0.156768
G1 X141.715 Y111.253 E.00204
; LINE_WIDTH: 0.111033
G1 X141.537 Y111.113 E.00122
; WIPE_START
G1 X141.715 Y111.253 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.194 Y112.601 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.326401
G1 F9524.462
M204 S6000
G1 X140.509 Y112.455 E.00779
; LINE_WIDTH: 0.322794
G1 F9647.214
G1 X140.491 Y112.332 E.00273
; LINE_WIDTH: 0.295034
G1 F10709.451
G1 X140.472 Y112.21 E.00246
; WIPE_START
G1 X140.491 Y112.332 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.311 Y112.601 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.240002
G1 F13699.876
M204 S6000
G1 X143.382 Y112.553 E.00134
; LINE_WIDTH: 0.277474
G1 F11511.246
G1 X143.453 Y112.505 E.00159
; LINE_WIDTH: 0.305014
G1 F10301.647
G1 X143.523 Y112.456 E.00178
G1 X143.455 Y112.372 E.00224
; LINE_WIDTH: 0.239018
G1 F13768.685
G1 X143.311 Y112.259 E.00284
; LINE_WIDTH: 0.195917
G1 F15000
G1 X143.166 Y112.146 E.00221
; LINE_WIDTH: 0.152816
G1 X143.022 Y112.034 E.00159
; LINE_WIDTH: 0.109716
G1 X142.878 Y111.921 E.00097
; WIPE_START
G1 X143.022 Y112.034 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.77 Y116.412 Z5.4 F42000
G1 X109.979 Y135.174 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.114055
G1 F15000
M204 S6000
G1 X109.885 Y135.291 E.00084
; LINE_WIDTH: 0.148318
G1 X109.792 Y135.407 E.00124
; WIPE_START
G1 X109.885 Y135.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.613 Y135.083 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.111147
G1 F15000
M204 S6000
G1 X108.51 Y135.154 E.00068
; LINE_WIDTH: 0.139583
G1 X108.406 Y135.226 E.00096
; WIPE_START
G1 X108.51 Y135.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.446 Y142.786 Z5.4 F42000
G1 X108.406 Y147.51 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.171704
G1 F15000
M204 S6000
G1 X108.56 Y147.537 E.00159
; LINE_WIDTH: 0.138384
G1 X112.594 Y147.549 E.03042
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X110.594 Y147.543 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z5.5 F900 ; lower z a little
G1 X0 Y128 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z105 F600
    G1 Z103

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

