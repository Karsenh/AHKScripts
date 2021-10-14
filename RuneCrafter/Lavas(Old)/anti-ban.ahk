#Include, D:\Misc Development\AHKScripts\RuneCrafter\helpers.ahk
#Include, D:\Misc Development\AHKScripts\RuneCrafter\jobHandlers.ahk
#Include, D:\Misc Development\AHKScripts\GlobalCoords\OSRS_CoordObjs.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

skillsTabIsOpen := False

randVariances() {
    Random, randMouseSpeedFast, 2.75, 3.4
    Random, randMouseSpeedSlow, 3.75, 4.35
    Random, randPixelDeviation, -4, 5
    Random, randActionDelayS, 225, 475
    Random, randActionDelayL, 725, 900
    Random, teleportDelay, 2875, 2925

    variancesObject := Object("actionDelayLong", randActionDelayL, "actionDelayShort", randActionDelayS, "mouseSpeedSlow", randMouseSpeedSlow, "mouseSpeedFast", randMouseSpeedFast, "pixelDev", randPixelDeviation, "teleportDelay", teleportDelay)

    return variancesObject
}

randomTabBrowse() {
    global skillsCoords
    global skillsTabIsOpen
    variance := randVariances()
    rActionDelay := variance["actionDelayShort"]
    Random, hoverSkillDelay, 350, 550
    Random, clickOtherTabChance, 1, 5

    ; If skills tab is NOT open - open it and set it to open
    if (!skillsTabIsOpen) {
        customMouseMove(skillsCoords["skillsTabX"], skillsCoords["skillsTabY"], True)
        MouseClick, Left
        Sleep, rActionDelay
        skillsTabIsOpen := True
    }
    ; Hover mouse over rc'ing
    customMouseMove(skillsCoords["rcingX"], skillsCoords["rcingY"], True)
    Sleep, hoverSkillDelay

    Random, clickOtherTabChance, 1, 3
    if (clickOtherTabChance == 1) {
        ; Click inventory
        customMouseMove(650, 210, True)
        MouseClick, Left
        skillsTabIsOpen := False
    }
}

randomMouseMoves(sleepMin=200, sleepMax=650) {
    Random, loopIterations, 1, 3
    Random, browseTabsChance, 1, 4
    Random, mouseSleep, sleepMin, sleepMax

    if (browseTabsChance == 1) {
        randomTabBrowse()
    }

    Loop, %loopIterations% {
        Random, randXCoord, 0, 700
        Random, randYCoord, 0, 500

        customMouseMove(randXCoord, randYCoord, True, False)
        Sleep, mouseSleep
    }

}

customMouseMovement(X, Y, isSlow=False, isTight=False) {

    if (isTight) {
        variance := randVariances()
        Random, pixelDev, -1, 1

        if (isSlow) {
            mouseSpeed := variance["mouseSpeedSlow"]
            MouseMove, X+pixelDev, Y+pixelDev, mouseSpeed
        } else {
            mouseSpeed := variance["mouseSpeedFast"]
            MouseMove, X+pixelDev, Y+pixelDev, mouseSpeed
        }
    } else {
        Random, loopIterations, 1, 3

        Loop, %loopIterations% {
            variance := randVariances()
            pixelDev := variance["pixelDev"]

            if (isSlow) {
                mouseSpeed := variance["mouseSpeedSlow"]
                MouseMove, X+pixelDev, Y+pixelDev, mouseSpeed
            } else {
                mouseSpeed := variance["mouseSpeedFast"]
                MouseMove, X+pixelDev, Y+pixelDev, mouseSpeed
            }
        }
    }
}