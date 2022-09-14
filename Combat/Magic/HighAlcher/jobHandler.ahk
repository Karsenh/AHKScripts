#Include, ../../../Utilities/GlobalLibrary.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

alch() {
    global inventoryCoords

    Send, {f2}

    Loop, {
        customMouseMove(730, 340, "fastest", 7, 9)
        customMouseClick()

        customMouseMove(inventoryCoords["slot12X"], inventoryCoords["slot12Y"], "fastest")
        customMouseClick()

        Random, rAlchSleep, 1967, 2651
        Sleep, rAlchSleep
    }
}