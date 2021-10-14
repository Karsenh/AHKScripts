#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\RuneCrafter\Lavas-2.0\jobHandlers.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\QOL.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Runecrafting\cwarsBankMiniMap.ahk
SetWorkingDir, %A_ScriptDir%

; Start Script
PgUp::
    startScript()
return

; Toggle Script Pause/Start
PgDn::

return

; Get Mouse Coords
NumpadEnter::
    debugMouseCoords()
return

; Debugging
Ins::
    clickCwarsBank()
return