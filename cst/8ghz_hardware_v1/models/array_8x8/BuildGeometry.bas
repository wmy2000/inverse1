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
 .Xrange "-51", "51"
 .Yrange "-51", "51"
 .Zrange "-0.035", "0"
 .Create
End With
With Brick
 .Reset
 .Name "substrate_base"
 .Component "RF_geometry"
 .Material "Generic_substrate_NOT_VENDOR_VALIDATED"
 .Xrange "-51", "51"
 .Yrange "-51", "51"
 .Zrange "0", "1.5"
 .Create
End With
With Brick
 .Reset
 .Name "interlayer_fill"
 .Component "RF_geometry"
 .Material "Generic_fill_NOT_VENDOR_VALIDATED"
 .Xrange "-51", "51"
 .Yrange "-51", "51"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "substrate_spacer_with_windows"
 .Component "RF_geometry"
 .Material "Generic_substrate_NOT_VENDOR_VALIDATED"
 .Xrange "-51", "51"
 .Yrange "-51", "51"
 .Zrange "1.535", "2.335"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-47.25", "-42.2"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-36.75"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-46.5", "-42.2"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-37.5"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-35.25", "-30.2"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-24.75"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-34.5", "-30.2"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-25.5"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c04_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c04_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c04_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c04_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c05_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c05_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c05_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c05_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c06_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "24.75", "29.8"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c06_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "35.25"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c06_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "25.5", "29.8"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c06_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "34.5"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c07_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "36.75", "41.8"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c07_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "47.25"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c07_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "37.5", "41.8"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r00_c07_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "46.5"
 .Yrange "-42.6", "-41.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-47.25", "-42.2"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-36.75"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-46.5", "-42.2"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-37.5"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-35.25", "-30.2"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-24.75"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-34.5", "-30.2"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-25.5"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c04_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c04_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c04_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c04_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c05_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c05_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c05_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c05_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c06_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "24.75", "29.8"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c06_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "35.25"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c06_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "25.5", "29.8"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c06_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "34.5"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c07_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "36.75", "41.8"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c07_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "47.25"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c07_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "37.5", "41.8"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r01_c07_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "46.5"
 .Yrange "-30.6", "-29.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-47.25", "-42.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-36.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-46.5", "-42.2"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-37.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-35.25", "-30.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-24.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-34.5", "-30.2"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-25.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c04_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c04_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c04_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c04_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c05_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c05_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c05_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c05_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c06_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "24.75", "29.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c06_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "35.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c06_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "25.5", "29.8"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c06_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "34.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c07_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "36.75", "41.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c07_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "47.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c07_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "37.5", "41.8"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r02_c07_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "46.5"
 .Yrange "-18.6", "-17.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-47.25", "-42.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-36.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-46.5", "-42.2"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-37.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-35.25", "-30.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-24.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-34.5", "-30.2"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-25.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c04_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c04_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c04_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c04_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c05_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c05_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c05_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c05_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c06_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "24.75", "29.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c06_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "35.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c06_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "25.5", "29.8"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c06_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "34.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c07_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "36.75", "41.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c07_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "47.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c07_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "37.5", "41.8"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r03_c07_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "46.5"
 .Yrange "-6.6", "-5.4"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-47.25", "-42.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-36.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-46.5", "-42.2"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-37.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-35.25", "-30.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-24.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-34.5", "-30.2"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-25.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c04_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c04_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c04_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c04_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c05_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c05_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c05_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c05_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c06_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "24.75", "29.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c06_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "35.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c06_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "25.5", "29.8"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c06_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "34.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c07_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "36.75", "41.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c07_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "47.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c07_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "37.5", "41.8"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r04_c07_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "46.5"
 .Yrange "5.4", "6.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-47.25", "-42.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-36.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-46.5", "-42.2"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-37.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-35.25", "-30.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-24.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-34.5", "-30.2"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-25.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c04_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c04_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c04_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c04_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c05_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c05_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c05_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c05_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c06_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "24.75", "29.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c06_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "35.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c06_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "25.5", "29.8"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c06_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "34.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c07_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "36.75", "41.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c07_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "47.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c07_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "37.5", "41.8"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r05_c07_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "46.5"
 .Yrange "17.4", "18.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-47.25", "-42.2"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-36.75"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-46.5", "-42.2"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-37.5"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-35.25", "-30.2"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-24.75"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-34.5", "-30.2"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-25.5"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c04_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c04_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c04_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c04_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c05_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c05_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c05_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c05_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c06_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "24.75", "29.8"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c06_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "35.25"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c06_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "25.5", "29.8"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c06_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "34.5"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c07_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "36.75", "41.8"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c07_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "47.25"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c07_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "37.5", "41.8"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r06_c07_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "46.5"
 .Yrange "29.4", "30.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c00_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-47.25", "-42.2"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c00_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-36.75"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c00_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-46.5", "-42.2"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c00_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-41.8", "-37.5"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c01_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-35.25", "-30.2"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c01_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-24.75"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c01_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-34.5", "-30.2"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c01_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-29.8", "-25.5"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c02_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-23.25", "-18.2"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c02_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-12.75"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c02_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-22.5", "-18.2"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c02_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-17.8", "-13.5"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c03_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-11.25", "-6.2"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c03_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-0.75"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c03_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-10.5", "-6.2"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c03_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "-5.8", "-1.5"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c04_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "0.75", "5.8"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c04_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "11.25"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c04_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "1.5", "5.8"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c04_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "6.2", "10.5"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c05_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "12.75", "17.8"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c05_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "23.25"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c05_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "13.5", "17.8"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c05_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "18.2", "22.5"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c06_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "24.75", "29.8"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c06_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "35.25"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c06_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "25.5", "29.8"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c06_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "30.2", "34.5"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c07_amplitude_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "36.75", "41.8"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c07_amplitude_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "47.25"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c07_phase_left"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "37.5", "41.8"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "r07_c07_phase_right"
 .Component "RF_geometry"
 .Material "Copper_v1"
 .Xrange "42.2", "46.5"
 .Yrange "41.4", "42.6"
 .Zrange "2.335", "2.37"
 .Create
End With
With Brick
 .Reset
 .Name "tmp_fill_metal_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-47.25", "-42.2"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_0"
With Brick
 .Reset
 .Name "tmp_fill_metal_1"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-41.8", "-36.75"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_1"
With Brick
 .Reset
 .Name "tmp_fill_metal_2"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-35.25", "-30.2"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_2"
With Brick
 .Reset
 .Name "tmp_fill_metal_3"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-29.8", "-24.75"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_3"
With Brick
 .Reset
 .Name "tmp_fill_metal_4"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_4"
With Brick
 .Reset
 .Name "tmp_fill_metal_5"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_5"
With Brick
 .Reset
 .Name "tmp_fill_metal_6"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_6"
With Brick
 .Reset
 .Name "tmp_fill_metal_7"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_7"
With Brick
 .Reset
 .Name "tmp_fill_metal_8"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_8"
With Brick
 .Reset
 .Name "tmp_fill_metal_9"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_9"
With Brick
 .Reset
 .Name "tmp_fill_metal_10"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_10"
With Brick
 .Reset
 .Name "tmp_fill_metal_11"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_11"
With Brick
 .Reset
 .Name "tmp_fill_metal_12"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "24.75", "29.8"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_12"
With Brick
 .Reset
 .Name "tmp_fill_metal_13"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "30.2", "35.25"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_13"
With Brick
 .Reset
 .Name "tmp_fill_metal_14"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "36.75", "41.8"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_14"
With Brick
 .Reset
 .Name "tmp_fill_metal_15"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "42.2", "47.25"
 .Yrange "-40.1", "-38.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_15"
With Brick
 .Reset
 .Name "tmp_fill_metal_16"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-47.25", "-42.2"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_16"
With Brick
 .Reset
 .Name "tmp_fill_metal_17"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-41.8", "-36.75"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_17"
With Brick
 .Reset
 .Name "tmp_fill_metal_18"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-35.25", "-30.2"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_18"
With Brick
 .Reset
 .Name "tmp_fill_metal_19"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-29.8", "-24.75"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_19"
With Brick
 .Reset
 .Name "tmp_fill_metal_20"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_20"
With Brick
 .Reset
 .Name "tmp_fill_metal_21"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_21"
With Brick
 .Reset
 .Name "tmp_fill_metal_22"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_22"
With Brick
 .Reset
 .Name "tmp_fill_metal_23"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_23"
With Brick
 .Reset
 .Name "tmp_fill_metal_24"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_24"
With Brick
 .Reset
 .Name "tmp_fill_metal_25"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_25"
With Brick
 .Reset
 .Name "tmp_fill_metal_26"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_26"
With Brick
 .Reset
 .Name "tmp_fill_metal_27"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_27"
With Brick
 .Reset
 .Name "tmp_fill_metal_28"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "24.75", "29.8"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_28"
With Brick
 .Reset
 .Name "tmp_fill_metal_29"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "30.2", "35.25"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_29"
With Brick
 .Reset
 .Name "tmp_fill_metal_30"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "36.75", "41.8"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_30"
With Brick
 .Reset
 .Name "tmp_fill_metal_31"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "42.2", "47.25"
 .Yrange "-28.1", "-26.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_31"
With Brick
 .Reset
 .Name "tmp_fill_metal_32"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-47.25", "-42.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_32"
With Brick
 .Reset
 .Name "tmp_fill_metal_33"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-41.8", "-36.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_33"
With Brick
 .Reset
 .Name "tmp_fill_metal_34"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-35.25", "-30.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_34"
With Brick
 .Reset
 .Name "tmp_fill_metal_35"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-29.8", "-24.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_35"
With Brick
 .Reset
 .Name "tmp_fill_metal_36"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_36"
With Brick
 .Reset
 .Name "tmp_fill_metal_37"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_37"
With Brick
 .Reset
 .Name "tmp_fill_metal_38"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_38"
With Brick
 .Reset
 .Name "tmp_fill_metal_39"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_39"
With Brick
 .Reset
 .Name "tmp_fill_metal_40"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_40"
With Brick
 .Reset
 .Name "tmp_fill_metal_41"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_41"
With Brick
 .Reset
 .Name "tmp_fill_metal_42"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_42"
With Brick
 .Reset
 .Name "tmp_fill_metal_43"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_43"
With Brick
 .Reset
 .Name "tmp_fill_metal_44"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "24.75", "29.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_44"
With Brick
 .Reset
 .Name "tmp_fill_metal_45"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "30.2", "35.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_45"
With Brick
 .Reset
 .Name "tmp_fill_metal_46"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "36.75", "41.8"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_46"
With Brick
 .Reset
 .Name "tmp_fill_metal_47"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "42.2", "47.25"
 .Yrange "-16.1", "-14.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_47"
With Brick
 .Reset
 .Name "tmp_fill_metal_48"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-47.25", "-42.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_48"
With Brick
 .Reset
 .Name "tmp_fill_metal_49"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-41.8", "-36.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_49"
With Brick
 .Reset
 .Name "tmp_fill_metal_50"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-35.25", "-30.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_50"
With Brick
 .Reset
 .Name "tmp_fill_metal_51"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-29.8", "-24.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_51"
With Brick
 .Reset
 .Name "tmp_fill_metal_52"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_52"
With Brick
 .Reset
 .Name "tmp_fill_metal_53"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_53"
With Brick
 .Reset
 .Name "tmp_fill_metal_54"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_54"
With Brick
 .Reset
 .Name "tmp_fill_metal_55"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_55"
With Brick
 .Reset
 .Name "tmp_fill_metal_56"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_56"
With Brick
 .Reset
 .Name "tmp_fill_metal_57"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_57"
With Brick
 .Reset
 .Name "tmp_fill_metal_58"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_58"
With Brick
 .Reset
 .Name "tmp_fill_metal_59"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_59"
With Brick
 .Reset
 .Name "tmp_fill_metal_60"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "24.75", "29.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_60"
With Brick
 .Reset
 .Name "tmp_fill_metal_61"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "30.2", "35.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_61"
With Brick
 .Reset
 .Name "tmp_fill_metal_62"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "36.75", "41.8"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_62"
With Brick
 .Reset
 .Name "tmp_fill_metal_63"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "42.2", "47.25"
 .Yrange "-4.1", "-2.9"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_63"
With Brick
 .Reset
 .Name "tmp_fill_metal_64"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-47.25", "-42.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_64"
With Brick
 .Reset
 .Name "tmp_fill_metal_65"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-41.8", "-36.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_65"
With Brick
 .Reset
 .Name "tmp_fill_metal_66"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-35.25", "-30.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_66"
With Brick
 .Reset
 .Name "tmp_fill_metal_67"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-29.8", "-24.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_67"
With Brick
 .Reset
 .Name "tmp_fill_metal_68"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_68"
With Brick
 .Reset
 .Name "tmp_fill_metal_69"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_69"
With Brick
 .Reset
 .Name "tmp_fill_metal_70"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_70"
With Brick
 .Reset
 .Name "tmp_fill_metal_71"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_71"
With Brick
 .Reset
 .Name "tmp_fill_metal_72"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_72"
With Brick
 .Reset
 .Name "tmp_fill_metal_73"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_73"
With Brick
 .Reset
 .Name "tmp_fill_metal_74"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_74"
With Brick
 .Reset
 .Name "tmp_fill_metal_75"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_75"
With Brick
 .Reset
 .Name "tmp_fill_metal_76"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "24.75", "29.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_76"
With Brick
 .Reset
 .Name "tmp_fill_metal_77"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "30.2", "35.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_77"
With Brick
 .Reset
 .Name "tmp_fill_metal_78"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "36.75", "41.8"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_78"
With Brick
 .Reset
 .Name "tmp_fill_metal_79"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "42.2", "47.25"
 .Yrange "7.9", "9.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_79"
With Brick
 .Reset
 .Name "tmp_fill_metal_80"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-47.25", "-42.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_80"
With Brick
 .Reset
 .Name "tmp_fill_metal_81"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-41.8", "-36.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_81"
With Brick
 .Reset
 .Name "tmp_fill_metal_82"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-35.25", "-30.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_82"
With Brick
 .Reset
 .Name "tmp_fill_metal_83"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-29.8", "-24.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_83"
With Brick
 .Reset
 .Name "tmp_fill_metal_84"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_84"
With Brick
 .Reset
 .Name "tmp_fill_metal_85"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_85"
With Brick
 .Reset
 .Name "tmp_fill_metal_86"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_86"
With Brick
 .Reset
 .Name "tmp_fill_metal_87"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_87"
With Brick
 .Reset
 .Name "tmp_fill_metal_88"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_88"
With Brick
 .Reset
 .Name "tmp_fill_metal_89"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_89"
With Brick
 .Reset
 .Name "tmp_fill_metal_90"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_90"
With Brick
 .Reset
 .Name "tmp_fill_metal_91"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_91"
With Brick
 .Reset
 .Name "tmp_fill_metal_92"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "24.75", "29.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_92"
With Brick
 .Reset
 .Name "tmp_fill_metal_93"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "30.2", "35.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_93"
With Brick
 .Reset
 .Name "tmp_fill_metal_94"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "36.75", "41.8"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_94"
With Brick
 .Reset
 .Name "tmp_fill_metal_95"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "42.2", "47.25"
 .Yrange "19.9", "21.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_95"
With Brick
 .Reset
 .Name "tmp_fill_metal_96"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-47.25", "-42.2"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_96"
With Brick
 .Reset
 .Name "tmp_fill_metal_97"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-41.8", "-36.75"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_97"
With Brick
 .Reset
 .Name "tmp_fill_metal_98"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-35.25", "-30.2"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_98"
With Brick
 .Reset
 .Name "tmp_fill_metal_99"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-29.8", "-24.75"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_99"
With Brick
 .Reset
 .Name "tmp_fill_metal_100"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_100"
With Brick
 .Reset
 .Name "tmp_fill_metal_101"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_101"
With Brick
 .Reset
 .Name "tmp_fill_metal_102"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_102"
With Brick
 .Reset
 .Name "tmp_fill_metal_103"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_103"
With Brick
 .Reset
 .Name "tmp_fill_metal_104"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_104"
With Brick
 .Reset
 .Name "tmp_fill_metal_105"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_105"
With Brick
 .Reset
 .Name "tmp_fill_metal_106"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_106"
With Brick
 .Reset
 .Name "tmp_fill_metal_107"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_107"
With Brick
 .Reset
 .Name "tmp_fill_metal_108"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "24.75", "29.8"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_108"
With Brick
 .Reset
 .Name "tmp_fill_metal_109"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "30.2", "35.25"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_109"
With Brick
 .Reset
 .Name "tmp_fill_metal_110"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "36.75", "41.8"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_110"
With Brick
 .Reset
 .Name "tmp_fill_metal_111"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "42.2", "47.25"
 .Yrange "31.9", "33.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_111"
With Brick
 .Reset
 .Name "tmp_fill_metal_112"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-47.25", "-42.2"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_112"
With Brick
 .Reset
 .Name "tmp_fill_metal_113"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-41.8", "-36.75"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_113"
With Brick
 .Reset
 .Name "tmp_fill_metal_114"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-35.25", "-30.2"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_114"
With Brick
 .Reset
 .Name "tmp_fill_metal_115"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-29.8", "-24.75"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_115"
With Brick
 .Reset
 .Name "tmp_fill_metal_116"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-23.25", "-18.2"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_116"
With Brick
 .Reset
 .Name "tmp_fill_metal_117"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-17.8", "-12.75"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_117"
With Brick
 .Reset
 .Name "tmp_fill_metal_118"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-11.25", "-6.2"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_118"
With Brick
 .Reset
 .Name "tmp_fill_metal_119"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-5.8", "-0.75"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_119"
With Brick
 .Reset
 .Name "tmp_fill_metal_120"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "0.75", "5.8"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_120"
With Brick
 .Reset
 .Name "tmp_fill_metal_121"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "6.2", "11.25"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_121"
With Brick
 .Reset
 .Name "tmp_fill_metal_122"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "12.75", "17.8"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_122"
With Brick
 .Reset
 .Name "tmp_fill_metal_123"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "18.2", "23.25"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_123"
With Brick
 .Reset
 .Name "tmp_fill_metal_124"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "24.75", "29.8"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_124"
With Brick
 .Reset
 .Name "tmp_fill_metal_125"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "30.2", "35.25"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_125"
With Brick
 .Reset
 .Name "tmp_fill_metal_126"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "36.75", "41.8"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_126"
With Brick
 .Reset
 .Name "tmp_fill_metal_127"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "42.2", "47.25"
 .Yrange "43.9", "45.1"
 .Zrange "1.5", "1.535"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_fill_metal_127"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_0"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_0"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_0"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_1"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_1"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_1"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_1"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_2"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_2"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_2"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_2"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_3"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_3"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_3"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_3"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_4"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_4"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_4"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_4"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_5"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_5"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_5"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_5"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_6"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_6"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_6"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_6"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_7"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_7"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_7"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "-40.9", "-38.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_7"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_8"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_8"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_8"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_8"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_9"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_9"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_9"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_9"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_10"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_10"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_10"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_10"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_11"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_11"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_11"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_11"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_12"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_12"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_12"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_12"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_13"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_13"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_13"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_13"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_14"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_14"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_14"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_14"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_15"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_15"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_15"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "-28.9", "-26.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_15"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_16"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_16"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_16"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_16"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_17"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_17"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_17"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_17"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_18"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_18"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_18"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_18"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_19"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_19"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_19"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_19"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_20"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_20"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_20"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_20"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_21"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_21"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_21"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_21"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_22"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_22"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_22"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_22"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_23"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_23"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_23"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "-16.9", "-14.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_23"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_24"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_24"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_24"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_24"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_25"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_25"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_25"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_25"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_26"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_26"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_26"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_26"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_27"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_27"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_27"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_27"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_28"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_28"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_28"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_28"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_29"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_29"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_29"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_29"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_30"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_30"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_30"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_30"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_31"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_31"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_31"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "-4.9", "-2.1"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_31"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_32"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_32"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_32"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_32"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_33"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_33"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_33"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_33"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_34"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_34"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_34"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_34"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_35"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_35"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_35"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_35"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_36"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_36"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_36"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_36"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_37"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_37"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_37"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_37"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_38"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_38"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_38"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_38"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_39"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_39"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_39"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "7.1", "9.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_39"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_40"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_40"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_40"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_40"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_41"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_41"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_41"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_41"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_42"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_42"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_42"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_42"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_43"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_43"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_43"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_43"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_44"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_44"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_44"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_44"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_45"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_45"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_45"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_45"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_46"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_46"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_46"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_46"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_47"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_47"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_47"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "19.1", "21.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_47"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_48"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_48"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_48"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_48"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_49"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_49"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_49"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_49"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_50"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_50"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_50"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_50"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_51"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_51"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_51"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_51"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_52"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_52"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_52"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_52"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_53"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_53"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_53"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_53"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_54"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_54"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_54"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_54"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_55"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_55"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_55"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "31.1", "33.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_55"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_56"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_56"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_56"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-43.2", "-40.8"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_56"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_57"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_57"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_57"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-31.2", "-28.8"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_57"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_58"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_58"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_58"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-19.2", "-16.8"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_58"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_59"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_59"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_59"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "-7.2", "-4.8"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_59"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_60"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_60"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_60"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "4.8", "7.2"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_60"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_61"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_61"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_61"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "16.8", "19.2"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_61"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_62"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_62"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_62"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "28.8", "31.2"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_62"
With Brick
 .Reset
 .Name "tmp_window_interlayer_fill_63"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:tmp_window_interlayer_fill_63"
With Brick
 .Reset
 .Name "tmp_window_substrate_spacer_with_windows_63"
 .Component "RF_geometry"
 .Material "Vacuum"
 .Xrange "40.8", "43.2"
 .Yrange "43.1", "45.9"
 .Zrange "1.5", "2.335"
 .Create
End With
Solid.Subtract "RF_geometry:substrate_spacer_with_windows", "RF_geometry:tmp_window_substrate_spacer_with_windows_63"
With Solver
 .FrequencyRange "fmin_GHz", "fmax_GHz"
End With
MsgBox "Geometry created. Loads and excitation remain to be configured."
End Sub
