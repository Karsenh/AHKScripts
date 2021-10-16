#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

isFirstRow := true

setup() {
    global interfaceCoords

    WinActivate, RuneLite

    Send, {F1}

    customMouseMove(interfaceCoords["compassX"], interfaceCoords["compassY"], "slow", 5, 5)
    MouseClick, Left

    customMouseMove(265, 233, "fast", 100, 100)
    Send, {WheelDown 50}

    customMouseMove(275, 180, "slow", 2, 2)
    MouseClick, Left

    customMouseMove(337, 346, "slow", 3, 3)
    MouseClick, Left
}

withdrawLogs() {
    customMouseMove(140, 160)
    MouseClick, Left

}

moveToStart() {
    global isFirstRow

    if (isFirstRow) {
        customMouseMove(710, 131, "slow", 0, 0)
    } else {
        customMouseMove(710, 135, "slow", 0, 0)
    }
    MouseClick, Left
    isFirstRow := !isFirstRow

    Sleep, 6000
}

burnLogs() {
    global inventoryCoords
    WinActivate, RuneLite

    currLogSlotX := inventoryCoords["slot2X"]
    currLogSlotY := inventoryCoords["slot2Y"]

    Loop, 27 {
        customMouseMove(inventoryCoords["slot1X"], inventoryCoords["slot1Y"], "fastest")
        MouseClick, Left
        customMouseMove(currLogSlotX, currLogSlotY, "fastest")
        MouseClick, Left
        currLogSlotX += 40

        if (Mod(A_Index, 3) == 0) {
            currLogSlotY += 35
            currLogSlotX -= 160
        }

        if(A_Index == 1) {
            Sleep, 1250
        }
        Sleep, 1750
    }
}

openBank() {

}