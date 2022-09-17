#Include, %A_LineFile%\..\..\GlobalLibrary.ahk
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
        MouseMove, OutputVarX, OutputVarY
        Sleep, 100
        MouseClick, Left
        Sleep, 10000
        if (CheckForFullInventoryOfLogs()) {
            dropInventItems(False, 1, 28)
        }
    }
return
PgDn::
    Pause, Toggle
return

Esc::ExitApp

return

