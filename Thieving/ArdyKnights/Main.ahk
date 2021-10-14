#Include, D:\Misc Development\AHKScripts\Thieving\ArdyKnights\jobHandlers.ahk
#SingleInstance, Force
CoordMode, Mouse, Relative
SetWorkingDir, %A_ScriptDir%

PgUp::
    pickpocketKnight()
return

PgDn::
    Pause, Toggle
return
