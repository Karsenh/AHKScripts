#Include, ../../Utilities/GlobalLibrary.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

useBonesOnAltar() {
    global inventoryCoords
    i := 1

    Loop, 26 {
        Random, rAltarClickSleep, 7, 103
        currXslot := % "slot" i "X"
        currYslot := % "slot" i "Y"

        customMouseMove(inventoryCoords[currXslot], inventoryCoords[currYslot], "fastest", 7, 7)
        customMouseClick()

        Random, rBoneClickSleep, 13, 87
        Sleep, rBoneClickSleep
        customMouseMove(450, 275, "fastest", 50, 65)
        customMouseClick()
        
        Sleep, rAltarClickSleep
        i++
    }
}

teleToRemmy() {
    Random, capeTeleSleep, 1127, 1203
    Random, remmyTeleSleep,  4000, 4123
    Send, {f5}
    customMouseMove(611, 293)
    customMouseClick("right")
    customMouseMove(610, 347, "fastest", 50, 4)
    customMouseClick()
    Sleep, capeTeleSleep
    Send, {2}
    offsetTime := idleMouseMovements()
    Sleep, remmyTeleSleep - offsetTime
}

unnoteBones() {
    global inventoryCoords
    Random, rMoveToPhialsSleep, 6000, 6100
    customMouseMove(665, 73, "slow", 0, 0)
    customMouseClick()
    phialsOffsetTime := idleMouseMovements()
    Sleep, rMoveToPhialsSleep - phialsOffsetTime
    Send, {f1}
    customMouseMove(673, 471, "fast", 9, 17)
    customMouseClick()

    customMouseMove(300, 76, "fast", 43, 37)
    customMouseClick()
    Random, rUseNotedBonesSleep, 1000, 1100
    Sleep, rUseNotedBonesSleep
    Send, {3}
    Random, rConvertAllBonesSleep, 217, 1100
    Sleep, rConvertAllBonesSleep

}

moveToWorklessAltar() {
    customMouseMove(635, 135, "fast", 0, 0)
    customMouseClick()
    Random, rMoveToPoHSleep, 5000, 5100
    pohOffsetTime := idleMouseMovements()
    Sleep, rMoveToPoHSleep - pohOffsetTime

    customMouseMove(220, 304, "fast", 41, 43)
    customMouseClick()

    pohAdOffsetTime := idleMouseMovements()
    Random, rClickPoHAdSleep, 4000, 4100
    Sleep, rClickPoHAdSleep - pohAdOffsetTime

    customMouseMove(643, 134, "fast", 0, 0)
    customMouseClick()

    altarOffsetTime := idleMouseMovements()
    Random, rMoveFromPortalToAltarSleep, 3400, 3600
    Sleep, rMoveFromPortalToAltarSleep - altarOffsetTime
}