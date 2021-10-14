#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

useBonesWithAltar() {
    global inventoryCoords
    3
    inventCoordsX := inventoryCoords["spot3X"]
    inventCoordsY := inventoryCoords["spot3Y"]

    altarCoordsX := 160
    altarCoordsY := 164

    col := 0
    row := 0
    iteration := 3

    Send, {Wheelup 34}

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

    Send, {WheelDown 34}

}

exitHouse() {
    portalX :=
    portalY :=

    unnoteBonesDelay := 5000

    customMouseMove(portalX, portalY, "slow", 8, 40)
    MouseClick, Left
    Sleep, unnoteBonesDelay

}

