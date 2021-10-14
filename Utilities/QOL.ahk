#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

; ---- IDEAS -----
;  1. Construction cape house teleport
;  2. Drop inventory items in range x-y
;  3. 
;  -------------
debugMouseCoords() {
    MouseGetPos, X, Y
    ToolTip, % "Mouse X: " X " Y: " Y
    return
}

dropInventItems(isInputEnabled=False, startSlot=1, endSlot=28) {
    global inventoryCoords

    if (isInputEnabled) {
        InputBox, startSlot, "Start Slot", "Enter the starting inventory slot:"
        InputBox, endSlot, "End slot", "Enter the ending inventory slot:"
    }
    numIterations := endSlot - startSlot + 1

    firstSlotX := % "spot" startSlot "X" 
    firstSlotY := % "spot" startSlot "Y"

    inventSlotX := inventoryCoords[firstSlotX]
    inventSlotY := inventoryCoords[firstSlotY]

    column := 1
    iterations := 1
    lastColIndex := 5 - startSlot
    currCol := startSlot

    Send, {ShiftDown}

    Loop, %numIterations% {
        customMouseMove(inventSlotX, inventSlotY, "fastest", 5, 5)
        MouseClick, Left
        if ( mod(currCol, 4) = 0) {
            inventSlotX -= 160
            inventSlotY += 35
        }
        inventSlotX += 40
        iterations += 1
        currCol += 1
    }

    Send, {ShiftUp}

    return
}

