#Include, ..\..\Utilities\GlobalLibrary.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

`::
    ; turnCamera("right", 1000)
    ; idleCameraRotation()
return

Numpad1::
    ; cameraZoom("in")
    idleStatCheck()
return

Numpad2::
    cameraZoom("out")
return

PgDn::
    Pause, Toggle
return

Esc:: ExitApp