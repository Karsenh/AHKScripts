#Include, ..\..\Utilities\GlobalLibrary.ahk
#Include, .\jobHandlers.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

`::
    ; turnCamera("right", 1000)
    ; idleCameraRotation()
    normalizeZeahBloodInterface()
return

PgDn::
    Pause, Toggle
return

Esc:: ExitApp