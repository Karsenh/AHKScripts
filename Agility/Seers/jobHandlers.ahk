#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\ImageCapture\Imgs\Agility\SeersAgilityStart.ahk
#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Agility\Seers\helpers.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

startCourse() {
    global seersAgilityCoords
    global inventoryCoords
    Random, highAlchDelay, 2350, 2550

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers1X := seersAgilityCoords["seers1X"]
    seers1Y := seersAgilityCoords["seers1Y"]

    clickAgilityMinimap()

    Send, {f2}
    customMouseMove(730, 340, "fastest", 7, 9)
    customMouseClick()

    customMouseMove(inventoryCoords["slot12X"], inventoryCoords["slot12Y"], "fastest")
    customMouseClick()

    Random, rSleep, 2350, 2475
    Sleep, rSleep

    clickNextObstacleAndAlch(seers1X, seers1Y, highAlchDelay)
}

obstacleTwoOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 4000, 4250

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers2X := seersAgilityCoords["seers2X"]
    seers2Y := seersAgilityCoords["seers2Y"]

    clickNextObstacleAndAlch(seers2X, seers2Y, highAlchDelay)
}

obstacleThreeOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 7220, 7330

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers3X := seersAgilityCoords["seers3X"]
    seers3Y := seersAgilityCoords["seers3Y"]

    clickNextObstacleAndAlch(seers3X, seers3Y, highAlchDelay)
}

obstacleFourOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 2350, 2450

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers4X := seersAgilityCoords["seers4X"]
    seers4Y := seersAgilityCoords["seers4Y"]

    clickNextObstacleAndAlch(seers4X, seers4Y, highAlchDelay, 15, 7)
}

obstacleFiveOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 2950, 3125

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers5X := seersAgilityCoords["seers5X"]
    seers5Y := seersAgilityCoords["seers5Y"]

    clickNextObstacleAndAlch(seers5X, seers5Y, highAlchDelay, 26, 6)
}

obstacleSixOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 1200, 1300

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers6X := seersAgilityCoords["seers6X"]
    seers6Y := seersAgilityCoords["seers6Y"]

    clickNextObstacleAndAlch(seers6X, seers6Y, highAlchDelay, 6, 25)
}

returnToStart() {

    teleportToSeers()

}