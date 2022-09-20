#Include, ..\..\Utilities\GlobalLibrary.ahk
#Include, .\jobHandlers.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

`::
    ; turnCamera("right", 1000)
    ; idleCameraRotation()
    ; checkIfLoggedOut()
    normalizeZeahBloodInterface()
return

PgDn::
    Pause, Toggle
return

LShift & Esc:: ExitApp