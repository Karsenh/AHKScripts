#Include, D:\Misc Development\AHKScripts\Combat\NMZ\JobHandler.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

PgUp::
    clickLocatorOrb()
return

PgDn::
    Pause, Toggle
return

Ins::
    MouseGetPos, currX, currY
    ToolTip, % "Curr X: " currX " Curr Y: " currY
return