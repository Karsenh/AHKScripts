#Include, ../../Utilities/GlobalLibrary.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

useBonesOnAltar() {
    global inventoryCoords
    i := 1

    Send, {f1}

    Loop, 28 {
        Random, rAltarClickSleep, 7, 47
        currXslot := % "slot" i "X"
        currYslot := % "slot" i "Y"

        customMouseMove(inventoryCoords[currXslot], inventoryCoords[currYslot], "fastest", 7, 6)
        customMouseClick()

        Random, rBoneClickSleep, 9, 67
        Sleep, rBoneClickSleep
        customMouseMove(438, 275, "fastest", 43, 67)
        customMouseClick()

        Sleep, rAltarClickSleep
        i++
    }
}

getBonesFromCwars() {
    ; open equipment
    Send, {f5}

    ; right click con cape
    customMouseMove(611, 293, 11, 9)
    customMouseClick("right")

    MouseGetPos, currX, currY

    ; left click tele to PoH - SLEEP
    customMouseMove(currX, currY+70, "fastest", 25, 4)
    customMouseClick()

    offset1 := idleMouseMovements()
    Random, conTeleSleep, 5000, 5100
    Sleep, conTeleSleep - offset1

    ; move to ornate jewelry box - SLEEP
    customMouseMove(662, 148, "fast", 1, 1)
    customMouseClick()

    offset2 := idleMouseMovements()
    Random, moveToOrnateSleep, 4779, 5100
    Sleep, moveToOrnateSleep - offset2

    ; left click ornate jewelry box - SLEEP (teleports to cwars)
    customMouseMove(264, 337, "fast", 45, 13)
    customMouseClick()

    offset3 := idleMouseMovements()
    Random, ornateTeleSleep, 4000, 4100
    Sleep, ornateTeleSleep - offset3

    ; move to cwars bank - SLEEP
    clickCwarsBankIcon()
    ; customMouseMove(633, 86)
    ; customMouseClick()

    Random, moveToCwarsBankSleep, 4579, 4799
    Sleep, moveToCwarsBankSleep - offset4

    ; left click cwars bank chest to open - SLEEP
    customMouseMove(117, 254, "fast", 37, 43)
    customMouseClick()

    Random, openChestDelay, 1579, 1600
    Sleep, openChestDelay

    ; left click bones to withdraw full invent
    customMouseMove(429, 123)
    customMouseClick()

    Random, rCloseBankDelay, 78, 217
    Sleep, rCloseBankDelay

    ; esc to close bank - SLEEP
    Send, {esc}

    Random, rRemmyTeleDelay, 17, 187
    Sleep, rRemmyTeleDelay

}

moveBackToWorklessAltar() {

    ; open equipment tab
    Send, {f5}
    customMouseMove(611, 293)
    customMouseClick("right")
    customMouseMove(610, 347, "fastest", 50, 4)
    customMouseClick()
    Random, capeTeleSleep, 775, 1100
    Sleep, capeTeleSleep
    Send, {2}
    offsetTime := idleMouseMovements()
    Random, remmyTeleSleep, 4000, 4100
    Sleep, remmyTeleSleep - offsetTime

    ; left click teleport
    customMouseMove(510, 59, "fast", 3, 13)
    customMouseClick()

    Random, adClickSleep, 4450, 4679
    offsetTime2 := idleMouseMovements()
    Sleep, adClickSleep - offsetTime2

    customMouseMove(643, 134, "fast", 0, 0)
    customMouseClick()

    altarOffsetTime := idleMouseMovements()
    Random, rMoveFromPortalToAltarSleep, 3400, 3600
    Sleep, rMoveFromPortalToAltarSleep - altarOffsetTime

}