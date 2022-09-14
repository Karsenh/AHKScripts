#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\GlobalLibrary.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

highAlch(alchDelay) {
    global standardSpellCoords
    global inventoryCoords
    Random, randomAction, 1, 3
    Random, sleepDelay, 75, 175

    ; Open magic tab
    Send {F2}

    customMouseMove(standardSpellCoords["highAlchX"], standardSpellCoords["highAlchY"], "fast", 6, 6)

    if (randomAction == 1) {
        ; Select High-Alch & sleep
        MouseClick, Left
        Sleep, sleepDelay
    } else {
        ; Sleep then select High-Alch
        Sleep, sleepDelay
        MouseClick, Left
    }
    customMouseMove(inventoryCoords["slot12X"], inventoryCoords["slot12Y"], "fast", 8, 8)
    Sleep, alchDelay
    MouseClick, Left
}

clickNextObstacleAndAlch(nextObstacleX, nextObstacleY, highAlchDelay, xRange=4, yRange=4 ) {
    Random, briefClickSleep, 15, 50
    customMouseMove(nextObstacleX, nextObstacleY, "fast", xRange, yRange)
    Sleep, briefClickSleep
    MouseClick, Left

    ; Add random mouse movement here
    idleMouseMovements()

    highAlch(highAlchDelay)
}

; ----------- Methods for returning after course completion -----------
; Old fashion run back
runBackToSeersCourseStart() {
    Random, rMinimapX, 712, 713
    Random, rMinimapY, 72, 75
    Random, rMouseX, 402, 407
    Random, rMouseY, 147, 154

    customMouseMove(rMouseX, rMouseY, "slow", 0, 0)
    MouseClick, Left

    highAlch(highAlchDelay)

    highAlch(highAlchDelay)

    highAlch(restartDelay)
}
; Use Construction cape -> House -> Seers Portal
teleHouseSeersPortal() {
    customMouseMove(673, 256, "fast", 10, 10)
    Send, {ShiftDown}
    Sleep, clickDelay
    MouseClick, Left
    Sleep, keyDelay
    Send, {ShiftUp}

    Random, teleportDelay, 3900, 4000
    Sleep, teleportDelay

    ; Mouse move to portal and click
    customMouseMove(365, 175, "slow", 5, 5)
    MouseClick, Left

    Random, portalDelay, 4150, 4250

    Sleep, portalDelay
}
; Use Seers teleport spell in standard spellbook
teleportToSeers() {
    global standardSpellCoords
    seersX := standardSpellCoords["seersTpX"]
    seersY := standardSpellCoords["seersTpY"]

    Random, clickDelay, 15, 35
    Random, clickMiniMapDelay, 1920, 2000

    Send, {F2}

    customMouseMove(seersX, seersY, "slow", 6, 6)
    Sleep, clickDelay
    MouseClick, Left

    idleMouseMovements()
    Sleep, clickMiniMapDelay
}