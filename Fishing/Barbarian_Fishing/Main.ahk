#Include, D:\Misc Development\AHKScripts\Utilities\QOL.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

; Drop all fish from inventoryslot 3 onward
PgUp::
    dropInventItems(False, 3)
return

PgDn::
    Pause, Toggle
return

