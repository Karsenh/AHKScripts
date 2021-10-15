#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\RuneCrafter\Lavas-2.0\helpers.ahk
#Include, D:\Misc Development\AHKScripts\RuneCrafter\Lavas-2.0\jobHandlers.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\QOL.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Runecrafting\cwarsBankMiniMap.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

; Start Script
PgUp::
    startScript()
return

; Toggle Script Pause/Start
PgDn::
    Pause, Toggle
return

; Get Mouse Coords
NumpadEnter::
    debugMouseCoords()
return

; Debugging
Ins::
    startScript()
    bankCwars()
    ; customMouseMove(280, 200, "slow", 2, 2)
    ; openBank()
    ; withdrawAndEquipJewelry()
    ; withdrawAndEquipJewelry("ring")
    ; startScript()
    ; clickCwarsBankChest()
    ; checkJewelry()
    ; withdrawEss()
    ; teleportTo("da")
    ; teleportTo("cw")
    ; clickPouches("fill")
    ; clickPouches("empty")
return