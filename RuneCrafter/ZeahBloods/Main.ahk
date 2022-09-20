#Include, ..\..\Utilities\GlobalLibrary.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

`::
    ; turnCamera("right", 1000)
    ; idleCameraRotation()

return

Numpad1::
    idleCameraRotation("subtle")
return

Numpad2::
    idleCameraRotation()
return

PgDn::
    Pause, Toggle
return

Esc:: ExitApp