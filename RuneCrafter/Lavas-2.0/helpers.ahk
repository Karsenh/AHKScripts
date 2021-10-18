#Include, .\jobHandlers.ahk
#Include, ..\..\Utilities\Global-Coords.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

checkJewelry() {
    ; Assumes bank is already open
    global ringCharges
    global necklaceCharges

    if (ringCharges == 0 || ringCharges == 1) {
        withdrawAndEquipJewelry("ring")
    }

    if (necklaceCharges == 0) {
        withdrawAndEquipJewelry("necklace")
    }
    return
}

withdrawAndEquipJewelry(jewelryType="necklace") {
    global ringCharges
    global necklaceCharges
    global inventoryCoords

    if (jewelryType == "ring") {
        ; Ring
        bankCoordsX := 332
        bankCoordsY := 246
        ringCharges := 8
    } else {
        ; Necklace
        bankCoordsX := 280
        bankCoordsY := 247
        necklaceCharges := 16
    }
    customMouseMove(bankCoordsX, bankCoordsY)
    MouseClick, Left

    Random, withdrawJewelrySleep, 475, 550

    Sleep, withdrawJewelrySleep

    customMouseMove(inventoryCoords["slot2X"], inventoryCoords["slot2Y"])
    MouseClick, Right

    MouseGetPos, currX, currY
    Random, rXDev, -1, 1

    customMouseMove(currX+rXDev, currY+114, "fastest")
    MouseClick, Left

    Random, equipJewelrySleep, 50, 200
    Sleep, equipJewelrySleep 

    return
}

clickCwarsBankChest() {
    Random, bankDelay, 350, 450
    ; Open inventory
    Send, {F1}
    ; Mouse move to cwars bank chest
    customMouseMove(282, 196, "slow", 2, 2)
    MouseClick, Left
    Sleep, bankDelay
    return
}

teleportTo(location) {
    global ringCharges
    ; Open equipment interface
    Random, teleportDelay, 2900, 3000

    global equipmentCoords

    if (location == "da") {

        Send, {F5}
        ; Duel Arena + 40px (y)
        customMouseMove(equipmentCoords["ringSlotX"], equipmentCoords["ringSlotY"])
        MouseClick, Right

        MouseGetPos, currX, currY
        selectionY := currY + 40
        customMouseMove(currX, selectionY, "fastest", 1, 1)
        MouseClick, Left
        ringCharges -= 1

    } else if (location == "cw") {
        Send, {F5}

        customMouseMove(equipmentCoords["ringSlotX"], equipmentCoords["ringSlotY"])
        MouseClick, Right

        MouseGetPos, currX, currY
        ; Castle Wars + 54px (y)
        selectionY := currY + 54
        customMouseMove(currX, selectionY, "fastest", 1, 1)
        MouseClick, Left
        ringCharges -= 1

    } else if (location == "house") {
        Send, {F5}
        customMouseMove(611, 293)
        MouseClick, Right

        MouseGetPos, currX, currY

        customMouseMove(currX, currY+70, "fastest", 3, 1)
        MouseClick, Left

        Sleep, 2000
    }
    ToolTip, % "Ring charges = " ringCharges

    offsetTime := idleMouseMovements()

    Sleep, teleportDelay-offsetTime

    return
}

withdrawEss() {
    customMouseMove(427, 209, "fast", 5, 5)
    MouseClick, Right

    MouseGetPos, currX, currY

    customMouseMove(currX, currY+102, "fastest", 1, 1)
    MouseClick, Left
    return
}

clickPouches(action="fill") {
    global inventoryCoords
    if (action != "fill") {
        Send, {ShiftDown}
    }
    customMouseMove(inventoryCoords["slot1X"], inventoryCoords["slot1Y"], "fastest", 5, 5)
    MouseClick, Left
    customMouseMove(inventoryCoords["slot5X"], inventoryCoords["slot5Y"], "fastest", 5, 5)
    MouseClick, Left
    customMouseMove(inventoryCoords["slot9X"], inventoryCoords["slot9Y"], "fastest", 5, 5)
    MouseClick, Left
    if (action != "fill") {
        Send, {ShiftUp}
    }
    return
}

castImbue() {
    Send, {F2}
    customMouseMove(630, 355, "fast", 3, 3)
    MouseClick, Left
    Random, imbueSleep, 150, 200
    Sleep, imbueSleep
    return
}

craftLavas() {
    global inventoryCoords
    ; Open inventory
    Send, {F1}
    ; Move mouse to Earth runes to select
    useEarthsOnAltar()
    Random, firstCraftSleep, 1000, 1100
    Sleep, firstCraftSleep

    ; Empty all pouches
    clickPouches("empty")

    ; Select earth runes and use with altar again
    useEarthsOnAltar()
    Sleep, teleportDelay, 1000, 1100
    Sleep, teleportDelay
    return
}

useEarthsOnAltar() {
    global necklaceCharges
    global inventoryCoords
    customMouseMove(inventoryCoords["slot13X"], inventoryCoords["slot13Y"])
    MouseClick, Left
    customMouseMove(303, 208, "fast", 1, 1)
    MouseClick, Left
    necklaceCharges -= 1

    return
}

drinkFromPool() {
    Random, drinkFromPoolSleep, 4000, 4100
    customMouseMove(236, 169, "fast", 2, 2)
    MouseClick, Left

    Sleep, drinkFromPoolSleep
    return
}

; useOrnateFromPool(location) {
;     Random, clickOrnateTeleportSleep, 6000, 6100
;     customMouseMove(226, 156, "fast", 2, 2)
;     MouseClick, Left
;     Sleep, clickOrnateTeleportSleep
; }
