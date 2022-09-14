#SingleInstance, Force
#Include, ./jobHandler.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

NumpadEnter::
    MouseGetPos currX, currY
    ToolTip, % "x: " currX " Y: " currY
return

PgDn::
    Pause, Toggle
return

`::
    Loop {
        make14Pots()
    }
return