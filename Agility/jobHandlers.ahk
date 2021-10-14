#Include, D:\Misc Development\AHKScripts\ImageCapture\SeersAgilityStart.ahk
#Include, D:\Misc Development\AHKScripts\Agility\helpers.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

startCourse() {
    global seersAgilityCoords
    Random, highAlchDelay, 2350, 2550

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers1X := seersAgilityCoords["seers1X"]
    seers1Y := seersAgilityCoords["seers1Y"]

    clickAgilityMinimap()

    clickNextObstacleAndAlch(seers1X, seers1Y, highAlchDelay)
}

obstacleTwoOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 4000, 4250

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers2X := seersAgilityCoords["seers2X"]
    seers2Y := seersAgilityCoords["seers2Y"]

    clickNextObstacleAndAlch(seers2X, seers2Y, highAlchDelay, 4, 7)
}

obstacleThreeOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 7150, 7225

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

    clickNextObstacleAndAlch(seers4X, seers4Y, highAlchDelay, 35, 6)
}

obstacleFiveOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 2575, 2650

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers5X := seersAgilityCoords["seers5X"]
    seers5Y := seersAgilityCoords["seers5Y"]

    clickNextObstacleAndAlch(seers5X, seers5Y, highAlchDelay, 26, 6)
}

obstacleSixOfSix() {
    global seersAgilityCoords

    Random, highAlchDelay, 1100, 1200

    ; ToolTip, % "High Alch Delay: " highAlchDelay

    seers6X := seersAgilityCoords["seers6X"]
    seers6Y := seersAgilityCoords["seers6Y"]

    clickNextObstacleAndAlch(seers6X, seers6Y, highAlchDelay, 6, 25)
}

returnToStart() {

    teleportToSeers()

}