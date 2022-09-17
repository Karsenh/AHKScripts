#Include, %A_ScriptDir%\jobHandlers.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, hide

`::
    GetMouseCoords()
return

1::
    ClickGiantLargePouch()
return

2::
    ClickLargeMedSmallPouch()
return

3::
    Random, rSleep, 120, 220
    Send, {ShiftDown}
    Sleep, rSleep
    ClickGiantLargePouch()
    Send, {ShiftUp}
return

4::
    Random, rSleep2, 120, 220
    Send, {ShiftDown}
    Sleep, rSleep2
    ClickLargeMedSmallPouch()
    Send, {ShiftUp}
return

ESC::ExitApp