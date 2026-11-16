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
 .Xrange "-27", "27"
 .Yrange "-27", "27"
 .Zrange "-0.035", "0"
 .Create
End With
With Brick
 .Reset
 .Name "substrate_base"
 .Component "RF_geometry"
 .Material "Generic_substrate_NOT_VENDOR_VALIDATED"
 .Xrange "-27", "27"
 .Yrange "-27", "27"
 .Zrange "0", "1.5"
 .Create
End With
With Brick
 .Reset
 .Name "interlayer_fill"
 .Component "RF_geometry"
 .Material "Generic_fill_NOT_VENDOR_VALIDATED"
 .Xrange "-27", "27"
 .Yrange "-27", "27"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "substrate_spacer_with_windows"
 .Component "RF_geometry"
 .Material "Generic_substrate_NOT_VENDOR_VALIDATED"
 .Xrange "-27", "27"
 .Yrange "-27", "27"
 .Zrange "1.535", "2.335"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "tmp_fill_metal_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_0"
With Brick
 .Reset
 .Name "tmp_fill_metal_1"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_1"
With Brick
 .Reset
 .Name "tmp_fill_metal_2"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_2"
With Brick
 .Reset
 .Name "tmp_fill_metal_3"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_3"
With Brick
 .Reset
 .Name "tmp_fill_metal_4"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_4"
With Brick
 .Reset
 .Name "tmp_fill_metal_5"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_5"
With Brick
 .Reset
 .Name "tmp_fill_metal_6"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_6"
With Brick
 .Reset
 .Name "tmp_fill_metal_7"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_7"
With Brick
 .Reset
 .Name "tmp_fill_metal_8"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_8"
With Brick
 .Reset
 .Name "tmp_fill_metal_9"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_9"
With Brick
 .Reset
 .Name "tmp_fill_metal_10"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_10"
With Brick
 .Reset
 .Name "tmp_fill_metal_11"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_11"
With Brick
 .Reset
 .Name "tmp_fill_metal_12"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_12"
With Brick
 .Reset
 .Name "tmp_fill_metal_13"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_13"
With Brick
 .Reset
 .Name "tmp_fill_metal_14"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_14"
With Brick
 .Reset
 .Name "tmp_fill_metal_15"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_15"
With Brick
 .Reset
 .Name "tmp_fill_metal_16"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_16"
With Brick
 .Reset
 .Name "tmp_fill_metal_17"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_17"
With Brick
 .Reset
 .Name "tmp_fill_metal_18"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_18"
With Brick
 .Reset
 .Name "tmp_fill_metal_19"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_19"
With Brick
 .Reset
 .Name "tmp_fill_metal_20"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_20"
With Brick
 .Reset
 .Name "tmp_fill_metal_21"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_21"
With Brick
 .Reset
 .Name "tmp_fill_metal_22"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_22"
With Brick
 .Reset
 .Name "tmp_fill_metal_23"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_23"
With Brick
 .Reset
 .Name "tmp_fill_metal_24"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_24"
With Brick
 .Reset
 .Name "tmp_fill_metal_25"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_25"
With Brick
 .Reset
 .Name "tmp_fill_metal_26"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_26"
With Brick
 .Reset
 .Name "tmp_fill_metal_27"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_27"
With Brick
 .Reset
 .Name "tmp_fill_metal_28"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_28"
With Brick
 .Reset
 .Name "tmp_fill_metal_29"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_29"
With Brick
 .Reset
 .Name "tmp_fill_metal_30"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_30"
With Brick
 .Reset
 .Name "tmp_fill_metal_31"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_31"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_0"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_0"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_1"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_1"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_1"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_1"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_2"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_2"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_2"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_2"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_3"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_3"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_3"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_3"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_4"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_4"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_4"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_4"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_5"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_5"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_5"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_5"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_6"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_6"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_6"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_6"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_7"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_7"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_7"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_7"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_8"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_8"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_8"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_8"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_9"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_9"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_9"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_9"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_10"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_10"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_10"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_10"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_11"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_11"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_11"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_11"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_12"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_12"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_12"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_12"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_13"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_13"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_13"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_13"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_14"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_14"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_14"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_14"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_15"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_15"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_15"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_15"
With Solver
 .FrequencyRange "fmin_GHz", "fmax_GHz"
End With
MsgBox "Geometry created. Loads and excitation remain to be configured."
End Sub
