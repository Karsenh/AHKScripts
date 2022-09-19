#Include, ..\..\Utilities\GlobalLibrary.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

`::
    ; turnCamera("right", 1000)
    ; idleCameraRotation()
    turnCamera("down left", 1372)
    Sleep, 1212
    turnCamera("up right", 848)

return

PgDn::
    Pause, Toggle
return

Esc:: ExitApp