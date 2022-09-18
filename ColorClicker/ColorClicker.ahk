#Include, %A_ScriptDir%\..\Utilities\GlobalLibrary.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

global findColor

ColorClicker:
`::
    global findColor
    ; Get color of current mouse pos
    ; Get interval between clicks
    ; MouseMove to color and wait interval +- 
    ; MouseClick
    ; After 28 clicks, drop all inventory
    MouseGetPos, currX, currY
    PixelGetColor, OutputColor, currX, currY
    findColor := OutputColor
return

PgUp::
    Loop {
        PixelSearch, OutputVarX, OutputVarY, 9, 30, 517, 361, findColor, 1, Fast
        customMouseMove(OutputVarX+4, OutputVarY+4, "fast", 10, 10)
        Random, rSleep1, 17, 87
        Sleep, rSleep1
        customMouseClick()
        Random, treeClickDelay, 10000, 11000
        Sleep, treeClickDelay
        if (isInventoryFull()) {
            dropInventItems(False, 2, 28)
        }
    }
return
PgDn::
    Pause, Toggle
return

Esc::ExitApp

return
