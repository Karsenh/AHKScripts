#Include, ../../Utilities/GlobalLibrary.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

global invent1X
global invent1Y

GetMouseCoords() {
    global invent1X
    global invent1Y

    MouseGetPos, currX, currY
    invent1X := currX
    invent1Y := currY
}

ClickGiantLargePouch() {
    MouseGetPos, currX, currY
    Sleep, 100
    MouseMove, invent1X, invent1Y

    ; customMouseMove(invent1X, invent1Y, "fastest")
    customMouseClick()

    Random, sleep1, 27, 117
    Sleep, sleep1

    MouseMove, invent1X, invent1Y + 70 
    ; customMouseMove(invent1X, invent1Y + 70, "fastest")
    customMouseClick()
    MouseMove, currX, currY
    Random, rSecondSleep, 120, 185
    Sleep, rSecondSleep
    MouseClick, Left
}

ClickLargeMedSmallPouch() {
    MouseGetPos, currX, currY
    Sleep, 100
    MouseMove, invent1X, invent1Y + 70
    ; customMouseMove(invent1X, invent1Y + 70, "fastest")
    customMouseClick()

    Random, sleep2, 27, 117
    Sleep, sleep2

    MouseMove, invent1X + 75, invent1Y
    ; customMouseMove(invent1X + 75, invent1Y, "fastest")
    customMouseClick()

    Random, sleep3, 27, 117
    Sleep, sleep3

    MouseMove, invent1X + 75, invent1Y + 70
    ; customMouseMove(invent1X + 75, invent1Y + 70, "fastest")
    customMouseClick()
    MouseMove, currX, currY
    Random, rSecondSleep, 120, 185
    Sleep, rSecondSleep
    MouseClick, Left
}