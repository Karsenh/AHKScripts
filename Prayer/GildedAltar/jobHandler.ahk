#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

useBonesWithAltar() {
    global inventoryCoords
    inventCoordsX := inventoryCoords["spot3X"]
    inventCoordsY := inventoryCoords["spot3Y"]

    altarCoordsX := 130
    altarCoordsY := 115

    col := 0
    row := 0
    iteration := 3

    Random, useBonesDelay, 3125, 3250

    customMouseMove(646, 87, "slow", 0, 0)
    MouseClick, Left

    customMouseMove(270, 240, "slow", 30, 30)

    Sleep, useBonesDelay

    Send, {WheelUp 36}

    Loop, 26 {
        customMouseMove(inventCoordsX, inventCoordsY, "fast", 4, 4)
        MouseClick, Left
        customMouseMove(altarCoordsX, altarCoordsY, "fast", 6, 9)
        MouseClick, Left
        if ( mod(iteration, 4) == 0) {
            row += 1
            inventCoordsX -= 160
            inventCoordsY += 35
        }
        inventCoordsX += 40
        iteration += 1
    }

    Send, {WheelDown 36}

    ; customMouseMove(273, 331, "slow", 0, 2)
    ; MouseClick, Left
    Random, rMousespeed, 20, 30

    Send, {F5}
    MouseMove, 610, 292, 5
    MouseClick, Right
    MouseMove, 604, 349, 5
    MouseClick, Left
    Random, capeTeleSelectionDelay, 1000, 1100 
    Sleep, capeTeleSelectionDelay
    Send, {2}
    Random, moveToPhialsDelay, 3000, 3100

    Sleep, movetoPhialsDelay

    Send, {F1}

    customMouseMove(627, 151, "slow", 0, 0)
    MouseClick, Left

    customMouseMove(630, 253, "slow", 5, 5)
    MouseClick, Left

    SoundBeep, 250, 200

    return
}

