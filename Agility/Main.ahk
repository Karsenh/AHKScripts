#Include, D:\Misc Development\AHKScripts\ImageCapture\SeersAgilityStart.ahk
#Include, D:\Misc Development\AHKScripts\Agility\jobHandlers.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
#SingleInstance, Force
CoordMode, Mouse, Relative
SetWorkingDir, %A_ScriptDir%

; Debugging current mouse position coordinates
NumpadEnter::
    MouseGetPos, currX, currY
    ToolTip, % "X = " currX " Y = " currY
return

; ------DEBUGGING------
Numpad0::
    ; highAlch()
    ; startCourse()
    ; obstacleTwoOfSix()
    ; returnToStart()
    teleportToSeers()
    ; idleMouseMovements()
    ; clickAgilityMinimap()
    ; customMouseMove(715, 255, "fast", 10, 10)

return

PgUp::
    Loop {
        startCourse()
        obstacleTwoOfSix()
        obstacleThreeOfSix()
        obstacleFourOfSix()
        obstacleFiveOfSix()
        obstacleSixOfSix()
        returnToStart()
    }
return

PgDn::
    returnToStart()
    ; clickAgilityMinimap()
return

NumpadAdd::
    Pause, Toggle
return