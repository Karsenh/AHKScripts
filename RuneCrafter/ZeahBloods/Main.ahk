#Include, ..\..\Utilities\GlobalLibrary.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

`::
    global inventoryCoords

    Loop, 27 {
        customMouseMove(inventoryCoords["slot28X"], inventoryCoords["slot28Y"], "fastest")
        customMouseClick()

        customMouseMove(inventoryCoords["slot27X"], inventoryCoords["slot27Y"], "fastest")
        customMouseClick()
    }
return

PgDn::
    Pause, Toggle
return

Esc:: ExitApp