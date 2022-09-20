#Include, ../../Utilities/GlobalLibrary.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

CoordMode, Mouse, Relative

global findColor

getPixelColor() {
    global findColor
    MouseGetPos, currX, currY
    PixelGetColor, OutputColor, currX, currY
    findColor := OutputColor
    return
}

bank() {
    global findColor
    global inventoryCoords

    PixelSearch, OutputVarX, OutputVarY, 9, 32, 517, 362, findColor, 1, fast
    PixelSearch, OutputVarX2, OutputVarY2, 517, 362, 9, 32, findColor, 1, fast
    CenterTileX := ((OutputVarX + OutputVarX2) / 2)
    CenterTileY := ((OutputVarY + OutputVarY2) / 2)

    ; Open the bank
    customMouseMove(CenterTileX, CenterTileY, "fast", 0, 0)
    customMouseClick()

    Random, rWaitForBankOpen, 1200, 1300
    Sleep, rWaitForBankOpen

    ; Deposite everything in inventory
    customMouseMove(446, 341, "fast", 7, 7)
    customMouseClick()

    Random, rWaitToWithdraw, 6, 23
    Sleep, rWaitToWithdraw

    ; Withdraw unf pots & secondaries
    customMouseMove(382, 125, "fast", 8, 8)
    customMouseClick()

    customMouseMove(430, 126, "fastest", 8, 8)
    customMouseClick()

    Random, rWaitToCloseBank, 53, 97
    Sleep, rWaitToCloseBank

    Send, {Esc}

    customMouseMove(inventoryCoords["slot13X"], inventoryCoords["slot13Y"], "fast")
    Random, rWaitToStartPots, 900, 1100
    Sleep, rWaitToStartPots

    return
}

make14Pots() {
    global inventoryCoords
    customMouseClick()

    customMouseMove(inventoryCoords["slot17X"], inventoryCoords["slot17Y"], "fastest")
    customMouseClick()

    Random, rWaitToConfirmChatBox, 1267, 1313
    Sleep, rWaitToConfirmChatBox

    checkIfStillMixingPots()

    Send, {Space}

    delayOffset := 0

    Random, shouldMoveMouse, 1, 5
    if (shouldMoveMouse >= 3)
        delayOffset := idleMouseMovements()

    Random, shouldTurnCam, 1, 10
    if (shouldTurnCam >= 7)
        delayOffset := delayOffset + idleCameraRotation("subtle")

    Random, shouldCheckStats, 1, 10
    if (shouldCheckStats >= 8)
        delayOffset := delayOffset + idleStatCheck("random")

    Random, shouldMoveMouse2, 1, 5
    if (shouldMoveMouse2 >= 3)
        delayOffset := idleMouseMovements()

    Random, rWaitForPots, 9023, 10237
    Sleep, rWaitForPots - delayOffset

    return
}