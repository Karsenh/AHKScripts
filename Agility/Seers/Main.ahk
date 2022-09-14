
#Include, ../../Utilities/GlobalLibrary.ahk
#Include, ./jobHandlers.ahk
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
    ; normalizeInterface()
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

