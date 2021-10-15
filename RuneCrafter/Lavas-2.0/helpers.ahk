#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\RuneCrafter\Lavas-2.0\jobHandlers.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

checkJewelry() {
    ; Assumes bank is already open
    global ringCharges
    global necklaceCharges

    if (ringCharges == 0) {
        withdrawAndEquipJewelry("ring")
    }

    if (necklaceCharges == 0) {
        withdrawAndEquipJewelry("necklace")
    }
    return
}

withdrawAndEquipJewelry(jewelryType="necklace") {
    if (jewelryType == "ring") {
        ; Ring
        bankCoordsX := 332
        bankCoordsY := 246
    } else {
        ; Necklace
        bankCoordsX := 280
        bankCoordsY := 247
    }
    customMouseMove(bankCoordsX, bankCoordsY)
    MouseClick, Left

    Random, equipDelay, 375, 425

    Sleep, equipDelay

    customMouseMove(630, 255, "fast")
    MouseClick, Right

    MouseGetPos, currX, currY
    Random, rXDev, -1, 1

    customMouseMove(currX+rXDev, currY+114, "fastest")
    MouseClick, Left
    return
}

clickCwarsBankChest() {
    Random, bankDelay, 375, 450
    ; Mouse move to cwars bank chest
    customMouseMove(277, 200, "slow", 2, 2)
    MouseClick, Left
    Sleep, bankDelay
    return
}

teleportTo(location) {
    ; Open equipment interface
    Send, {F5}
    Random, teleportDelay, 3000, 3100

    global equipmentCoords
    customMouseMove(equipmentCoords["ringSlotX"], equipmentCoords["ringSlotY"])
    MouseClick, Right

    MouseGetPos, currX, currY

    if (location == "da") {
        ; Duel Arena + 40px (y)
        selectionY := currY + 40 
    } else if (location == "cw") {
        ; Castle Wars + 54px (y)
        selectionY := currY + 54
    }

    customMouseMove(currX, selectionY, "fastest", 1, 1)
    ; MouseClick, Left

    ; Sleep, teleportDelay
}

withdrawEss() {
    customMouseMove(427, 209, "fast", 5, 5)
    MouseClick, Right

    MouseGetPos, currX, currY

    customMouseMove(currX, currY+102, "fastest", 1, 1)
    MouseClick, Left
}

clickPouches(action="fill") {
    global inventoryCoords
    if (action == "fill") {
        ; Fill pouches - Left click all pouches
        customMouseMove(inventoryCoords["slot1X"], inventoryCoords["slot1Y"], "fastest", 5, 5)
        MouseClick, Left
        customMouseMove(inventoryCoords["slot5X"], inventoryCoords["slot5Y"], "fastest", 5, 5)
        MouseClick, Left
        customMouseMove(inventoryCoords["slot9X"], inventoryCoords["slot9Y"], "fastest", 5, 5)
        MouseClick, Left

    } else {
        ; Empty pouches - Shift down + Left click all pouches
        Send, {ShiftDown}
        customMouseMove(inventoryCoords["slot1X"], inventoryCoords["slot1Y"], "fastest", 5, 5)
        MouseClick, Left
        customMouseMove(inventoryCoords["slot5X"], inventoryCoords["slot5Y"], "fastest", 5, 5)
        MouseClick, Left
        customMouseMove(inventoryCoords["slot9X"], inventoryCoords["slot9Y"], "fastest", 5, 5)
        MouseClick, Left
        Send, {ShiftUp}
    }
}