#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Agility\SeersAgilityStart.ahk
#Include, D:\Misc Development\AHKScripts\Agility\Seers\jobHandlers.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\QOL.ahk
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
    normalizeInterface()
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
    Pause, Toggle
return

