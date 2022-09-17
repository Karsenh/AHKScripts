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
    Random, moveToOrnateSleep, 4673, 5100
    Sleep, moveToOrnateSleep - offset2

    ; left click ornate jewelry box - SLEEP (teleports to cwars)
    customMouseMove(264, 337, "fast", 45, 13)
    customMouseClick()

    offset3 := idleMouseMovements()
    Random, ornateTeleSleep, 3947, 4102
    Sleep, ornateTeleSleep - offset3

    ; move to cwars bank - SLEEP
    clickCwarsBankDuringPrayer()
    ; customMouseMove(633, 86)
    ; customMouseClick()

    ; left click cwars bank chest to open - SLEEP
    customMouseMove(117, 254, "fast", 37, 43)
    customMouseClick()

    Random, openChestSleep, 1023, 1209
    Sleep, openChestSleep

    ; left click bones to withdraw full invent
    customMouseMove(429, 123)
    customMouseClick()

    Random, rCloseBankSleep, 78, 217
    Sleep, rCloseBankSleep

    ; esc to close bank - SLEEP
    Send, {esc}

    Random, rRemmyTeleDelay, 314, 512
    Sleep, rRemmyTeleDelay

}

moveBackToWorklessAltar() {

    ; open equipment tab
    Send, {f5}
    customMouseMove(611, 293)
    customMouseClick("right")
    MouseGetPos, currX, currY
    customMouseMove(currX, currY+56, "fastest", 9, 2)
    customMouseClick()
    Random, capeTeleSleep, 1314, 1498
    Sleep, capeTeleSleep
    Send, {2}
    offsetTime := idleMouseMovements()
    Random, remmyTeleSleep, 4017, 4109
    Sleep, remmyTeleSleep - offsetTime

    ; left click ad stand teleport to workless' home
    customMouseMove(510, 59, "fast", 3, 13)
    customMouseClick()

    Random, adClickSleep, 4603, 7801
    offsetTime2 := idleMouseMovements()
    Sleep, adClickSleep - offsetTime2

    customMouseMove(643, 134, "fast", 0, 0)
    customMouseClick()

    altarOffsetTime := idleMouseMovements()
    Random, rMoveFromPortalToAltarSleep, 3443, 3601
    Sleep, rMoveFromPortalToAltarSleep - altarOffsetTime

}