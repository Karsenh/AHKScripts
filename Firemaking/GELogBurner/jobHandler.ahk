#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

isFirstRow := true

; Start script standing in front of south-west banker in GE
setup() {
    global interfaceCoords

    WinActivate, RuneLite

    Send, {F1}

    customMouseMove(interfaceCoords["compassX"], interfaceCoords["compassY"], "slow", 5, 5)
    MouseClick, Left

    customMouseMove(265, 233, "fast", 100, 100)
    Send, {WheelDown 50}

    customMouseMove(277, 181, "slow", 2, 2)
    MouseClick, Left

    customMouseMove(337, 346, "slow", 3, 3)
    MouseClick, Left

    return
}

withdrawLogs() {
    customMouseMove(140, 160)
    MouseClick, Left

}

moveToStart() {
    global isFirstRow

    if (isFirstRow) {
        customMouseMove(711, 132, "slow", 0, 0)
    } else {
        customMouseMove(710, 135, "slow", 0, 0)
    }
    MouseClick, Left
    isFirstRow := !isFirstRow

    Sleep, 6000
    return

}

burnLogs() {
    global inventoryCoords
    WinActivate, RuneLite

    currLogSlotX := inventoryCoords["slot2X"]
    currLogSlotY := inventoryCoords["slot2Y"]

    row := 1

    Loop, 27 {
        ; ToolTip, % "A_Index = " A_Index
        if (Mod(A_Index, 4) == 0) {
            currLogSlotX -= 160
            currLogSlotY += 35
        }

        customMouseMove(inventoryCoords["slot1X"], inventoryCoords["slot1Y"], "fastest")
        MouseClick, Left
        customMouseMove(currLogSlotX, currLogSlotY, "fastest")
        MouseClick, Left
        Sleep, 1950
        if(A_Index == 1) {
            Sleep, 1150
        }
        currLogSlotX += 40
    }
    return

}

openBank() {

}