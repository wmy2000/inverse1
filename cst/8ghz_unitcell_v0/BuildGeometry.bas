Sub Main()
' DRAFT GEOMETRY ONLY. Not solved or CST-validated. Units mm/GHz.
StoreParameter "p", "12"
StoreParameter "h1", "1.5"
StoreParameter "h2", "0.8"
StoreParameter "tcu", "0.035"
StoreParameter "Lphase", "9.0"
StoreParameter "Lamp", "10.5"
StoreParameter "wphase", "1.2"
StoreParameter "wamp", "1.2"
StoreParameter "gap", "0.4"
StoreParameter "dy", "2.5"
StoreParameter "epsr", "3.55"
StoreParameter "tand", "0.0027"
StoreParameter "Rload", "50"
StoreParameter "Cload", "0.4"
StoreParameter "Lpin", "0.4"
StoreParameter "Lvar", "0.4"
StoreParameter "Rvar", "1.5"
StoreParameter "fmin", "6"
StoreParameter "fmax", "10"
With Units
 .Geometry "mm"
 .Frequency "GHz"
 .Time "ns"
End With
With Material
 .Reset
 .Name "Generic_Dielectric_NOT_VENDOR_VALIDATED"
 .Type "Normal"
 .Epsilon "epsr"
 .Mue "1"
 .TanD "tand"
 .TanDGiven "True"
 .Create
End With
With Material
 .Reset
 .Name "Copper_v0"
 .Type "Normal"
 .Epsilon "1"
 .Mue "1"
 .Kappa "5.8e7"
 .Create
End With
With Brick
 .Reset
 .Name "ground"
 .Component "cell"
 .Material "Copper_v0"
 .Xrange "-p/2", "p/2"
 .Yrange "-p/2", "p/2"
 .Zrange "-tcu", "0"
 .Create
End With
With Brick
 .Reset
 .Name "dielectric_lower"
 .Component "cell"
 .Material "Generic_Dielectric_NOT_VENDOR_VALIDATED"
 .Xrange "-p/2", "p/2"
 .Yrange "-p/2", "p/2"
 .Zrange "0", "h1"
 .Create
End With
With Brick
 .Reset
 .Name "dielectric_upper"
 .Component "cell"
 .Material "Generic_Dielectric_NOT_VENDOR_VALIDATED"
 .Xrange "-p/2", "p/2"
 .Yrange "-p/2", "p/2"
 .Zrange "h1+tcu", "h1+tcu+h2"
 .Create
End With
With Brick
 .Reset
 .Name "amp_left"
 .Component "cell"
 .Material "Copper_v0"
 .Xrange "-Lamp/2", "-gap/2"
 .Yrange "dy-wamp/2", "dy+wamp/2"
 .Zrange "h1", "h1+tcu"
 .Create
End With
With Brick
 .Reset
 .Name "amp_right"
 .Component "cell"
 .Material "Copper_v0"
 .Xrange "gap/2", "Lamp/2"
 .Yrange "dy-wamp/2", "dy+wamp/2"
 .Zrange "h1", "h1+tcu"
 .Create
End With
With Brick
 .Reset
 .Name "phase_left"
 .Component "cell"
 .Material "Copper_v0"
 .Xrange "-Lphase/2", "-gap/2"
 .Yrange "-wphase/2", "wphase/2"
 .Zrange "h1+tcu+h2", "h1+2*tcu+h2"
 .Create
End With
With Brick
 .Reset
 .Name "phase_right"
 .Component "cell"
 .Material "Copper_v0"
 .Xrange "gap/2", "Lphase/2"
 .Yrange "-wphase/2", "wphase/2"
 .Zrange "h1+tcu+h2", "h1+2*tcu+h2"
 .Create
End With
With Brick
 .Reset
 .Name "access_cutout"
 .Component "cell"
 .Material "Vacuum"
 .Xrange "-1", "1"
 .Yrange "dy-1", "dy+1"
 .Zrange "h1+tcu", "h1+tcu+h2"
 .Create
End With
Solid.Subtract "cell:dielectric_upper", "cell:access_cutout"
With Solver
 .FrequencyRange "fmin", "fmax"
End With

MsgBox "Draft geometry created. Add RLC loads and Floquet setup per README before solving."
End Sub
