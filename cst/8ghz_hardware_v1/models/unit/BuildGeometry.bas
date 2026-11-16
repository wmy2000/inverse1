Sub Main()
' RF GEOMETRY ONLY. NO LOADS, EXCITATION, SOLVER RUN OR PERFORMANCE CLAIM.
' Start in a NEW empty CST 3D project; units mm/GHz.
StoreParameter "period_mm", "12.0"
StoreParameter "h_base_mm", "1.5"
StoreParameter "h_spacer_mm", "0.8"
StoreParameter "copper_mm", "0.035"
StoreParameter "length_phase_mm", "9.0"
StoreParameter "length_amplitude_mm", "10.5"
StoreParameter "width_phase_mm", "1.2"
StoreParameter "width_amplitude_mm", "1.2"
StoreParameter "gap_mm", "0.4"
StoreParameter "offset_y_mm", "2.5"
StoreParameter "cavity_x_mm", "2.4"
StoreParameter "cavity_y_mm", "2.8"
StoreParameter "board_margin_mm", "3.0"
StoreParameter "epsilon_r", "3.55"
StoreParameter "tan_delta", "0.0027"
StoreParameter "target_GHz", "8.0"
StoreParameter "fmin_GHz", "6.0"
StoreParameter "fmax_GHz", "10.0"
With Units
 .Geometry "mm"
 .Frequency "GHz"
End With
With Material
 .Reset
 .Name "Generic_substrate_NOT_VENDOR_VALIDATED"
 .Type "Normal"
 .Epsilon "epsilon_r"
 .Mue "1"
 .TanD "tan_delta"
 .TanDGiven "True"
 .Create
End With
With Material
 .Reset
 .Name "Generic_fill_NOT_VENDOR_VALIDATED"
 .Type "Normal"
 .Epsilon "epsilon_r"
 .Mue "1"
 .TanD "tan_delta"
 .TanDGiven "True"
 .Create
End With
With Material
 .Reset
 .Name "Copper_v1"
 .Type "Normal"
 .Kappa "5.8e7"
 .Create
End With
With Brick
 .Reset
 .Name "ground"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-6", "6"
 .Yrange "-6", "6"
 .Zrange "-0.035", "0"
 .Create
End With
With Brick
 .Reset
 .Name "substrate_base"
 .Component "RF_geometry"
 .Material "Generic_substrate_NOT_VENDOR_VALIDATED"
 .Xrange "-6", "6"
 .Yrange "-6", "6"
 .Zrange "0", "1.5"
 .Create
End With
With Brick
 .Reset
 .Name "interlayer_fill"
 .Component "RF_geometry"
 .Material "Generic_fill_NOT_VENDOR_VALIDATED"
 .Xrange "-6", "6"
 .Yrange "-6", "6"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "substrate_spacer_with_windows"
 .Component "RF_geometry"
 .Material "Generic_substrate_NOT_VENDOR_VALIDATED"
 .Xrange "-6", "6"
 .Yrange "-6", "6"
 .Zrange "1.535", "2.335"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.25", "-0.2"
 .Yrange "1.9", "3.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.2", "5.25"
 .Yrange "1.9", "3.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-4.5", "-0.2"
 .Yrange "-0.6", "0.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.2", "4.5"
 .Yrange "-0.6", "0.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "tmp_fill_metal_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.25", "-0.2"
 .Yrange "1.9", "3.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_0"
With Brick
 .Reset
 .Name "tmp_fill_metal_1"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.2", "5.25"
 .Yrange "1.9", "3.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_1"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-1.2", "1.2"
 .Yrange "1.1", "3.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_0"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-1.2", "1.2"
 .Yrange "1.1", "3.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_0"
With Solver
 .FrequencyRange "fmin_GHz", "fmax_GHz"
End With
MsgBox "Geometry created. Loads and excitation remain to be configured."
End Sub
