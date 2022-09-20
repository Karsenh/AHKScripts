#Include, %A_LineFile% \..\Anti-ban.ahk
#Include, %A_LineFile% \..\Global-Coords.ahk

#SingleInstance, Force
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

normalizeInterface() {
    global interfaceCoords

    WinActivate, RuneLite

    ; Click compass to alignt camera
    customMouseMove(interfaceCoords["compassX"], interfaceCoords["compassY"], "slow")
    MouseClick, Left

    Random, rActionDelay, 100, 300
    Sleep, rActionDelay

    ; Zoom all the way out to normalize x/y coorindate interface
    customMouseMove(280, 190, "fast", 50, 50)
    Send, {WheelDown 100}
}

turnCamera(direction="left", holdTime=2000) {
    Random, rHoldTimeDeviation, 3, 13

    IfInString, direction, %A_Space%
    {
        StringSplit, directionArr, direction, %A_Space%
        Send, {%directionArr1% down}
        Send, {%directionArr2% down}
        Sleep, holdTime
        Send, {%directionArr1% up}
        Send, {%directionArr2% up}
    } else {
        Send, {%direction% down}
        Sleep, holdTime
        Send, {%direction% up}
    }

    return
}

; amt = 1-55
cameraZoom(direction="in", amt=10) {
    ; Maximum zoom is 1-55 on scroll wheel
    startTime := A_TickCount
    ; Game window to define where mouse can scroll in/out
    Random, randX, 10, 515
    Random, randY, 33, 360

    wheelDir := ""

    switch direction
    {
    case "in":
        wheelDir := "WheelUp"
    case "out":
        WheelDir := "WheelDown"
    }

    customMouseMove(randX, randY, "fast", 0, 0)
    Random, rScrollDelay, 13, 79
    Sleep, rScrollDelay
    Send, {%WheelDir% %amt%}

    totalTime := A_TickCount - startTime
    return totalTime
}

dropInventItems(isInputEnabled=False, startSlot=1, endSlot=28) {
    global inventoryCoords

    Send, {f1}

    if (isInputEnabled) {
        InputBox, startSlot, "Start Slot", "Enter the starting inventory slot:"
        InputBox, endSlot, "End slot", "Enter the ending inventory slot:"
    }
    numIterations := endSlot - startSlot + 1

    firstSlotX := % "slot" startSlot "X" 
    firstSlotY := % "slot" startSlot "Y"

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

teleTo(location="home", SleepTime=3850) {
    global inventoryCoords

    Random, randInterval, 15, 115
    Random, secondRandInterval, 15, 115

    if (location == "home") {
        customMouseMove(inventoryCoords["slot1X"], inventoryCoords["slot1Y"])
        Send, {ShiftDown}
        Sleep, randInterval
        customMouseClick()
        Sleep, secondRandInterval
        Send, {ShiftUp}
    }

    Sleep SleepTime

    return
}

