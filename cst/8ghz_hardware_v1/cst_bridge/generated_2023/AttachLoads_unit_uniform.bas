' GENERATED FROM LOCAL CST RECORDINGS: NOT EXECUTED OR VALIDATED HERE.
' Run ONCE in a clean copy of the matching geometry; do not duplicate existing loads.
Sub Main()
' Cell r00_c00 / R / pattern uniform
' User-recorded CST Studio Suite 2023 History; chat escapes removed.
With LumpedElement
    .Reset
    .SetName "r00_c00_amplitude"
    .Folder "Folder1"
    .SetType "RLCSerial"
    .SetR "50"
    .SetL "0"
    .SetC "0"
    .SetGs "0"
    .SetI0 "1e-14"
    .SetT "300"
    .SetMonitor "True"
    .SetRadius "0.0"
    .CircuitFileName ""
    .CircuitId "1"
    .UseCopyOnly "True"
    .UseRelativePath "False"
    .SetP1 "False", "-0.2", "2.5", "1.5175"
    .SetP2 "False", "0.2", "2.5", "1.5175"
    .SetInvert "False"
    .Wire ""
    .Position "end1"
    .Create
End With

' Cell r00_c00 / C / pattern uniform
' User-recorded CST Studio Suite 2023 History; chat escapes removed.
With LumpedElement
    .Reset
    .SetName "r00_c00_phase"
    .Folder "Folder1"
    .SetType "RLCSerial"
    .SetR "0"
    .SetL "0"
    .SetC "4e-13"
    .SetGs "0"
    .SetI0 "1e-14"
    .SetT "300"
    .SetMonitor "True"
    .SetRadius "0.0"
    .CircuitFileName ""
    .CircuitId "1"
    .UseCopyOnly "True"
    .UseRelativePath "False"
    .SetP1 "False", "-0.2", "0.0", "2.3525"
    .SetP2 "False", "0.2", "0.0", "2.3525"
    .SetInvert "False"
    .Wire ""
    .Position "end1"
    .Create
End With

End Sub
