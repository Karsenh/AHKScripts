#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\Firemaking\GELogBurner\jobHandler.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

PgUp::
    setup()
    Loop, {
        withdrawLogs()
        moveToStart()
        burnLogs()
    }
return

PgDn::
    Pause, Toggle
return

Ins::
    ; setup()
    ; withdrawLogs()
    ; moveToStart()
    burnLogs()
return

NumpadEnter::
    MouseGetPos, currX, currY
    ToolTip, % "X: " currX " Y: " currY
return