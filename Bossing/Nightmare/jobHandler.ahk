#Include, ../../Utilities/GlobalLibrary.ahk

switchToGear(gearType="melee") {
    global inventoryCoords

    BlockInput, On

    Send, {F1}
    ; 2, 3, 4, 6, 7, 8
    ; customMouseMove(inventoryCoords["slot2X"], inventoryCoords["slot2Y"], "fastest")
    MouseMove, inventoryCoords["slot2X"], inventoryCoords["slot2Y"], 2
    MouseClick, Left
    ; customMouseClick()

    ; customMouseMove(inventoryCoords["slot6X"], inventoryCoords["slot6Y"], "fastest")
    MouseMove, inventoryCoords["slot6X"], inventoryCoords["slot6Y"], 2
    MouseClick, Left
    ; customMouseClick()

    ; customMouseMove(inventoryCoords["slot3X"], inventoryCoords["slot3Y"], "fastest")
    MouseMove, inventoryCoords["slot3X"], inventoryCoords["slot3Y"], 2
    MouseClick, Left
    ; customMouseClick()

    ; customMouseMove(inventoryCoords["slot7X"], inventoryCoords["slot7Y"], "fastest")
    MouseMove, inventoryCoords["slot7X"], inventoryCoords["slot7Y"], 2
    MouseClick, Left
    ; customMouseClick()

    ; customMouseMove(inventoryCoords["slot4X"], inventoryCoords["slot4Y"], "fastest")
    MouseMove, inventoryCoords["slot4X"], inventoryCoords["slot4Y"], 2
    MouseClick, Left
    ; customMouseClick()

    if (gearType="magic") {
    ; customMouseMove(inventoryCoords["slot8X"], inventoryCoords["slot8Y"], "fastest")
    MouseMove, inventoryCoords["slot8X"], inventoryCoords["slot8Y"], 2
    MouseClick, Left
    ; customMouseClick()
    }

    BlockInput, Off

}

meleeSpec(weapon="claws") {
    global inventoryCoords

    if (weapon="claws") {
        MouseMove, inventoryCoords["slot1X"], inventoryCoords["slot1Y"] 
    } else {
        MouseMove, inventoryCoords["slot5X"], inventoryCoords["slot5Y"] 
    }
    MouseClick, Left

    clickQuickSpec()
}
