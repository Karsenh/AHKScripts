#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

global essNorthColor
global essSouthColor
global northScColor
global southScColor
global darkAltarColor
global bloodAltarColor

normalizeZeahBloodInterface() {
    clickCompass()

    ; Pitch all the way up
    Random, rUpHoldTime, 3000, 3850
    turnCamera("up", rUpHoldTime)

    ; Zoom all the way out
    Random, rZoomDist, 55, 65
    cameraZoom("out", rZoomDist)

    Random, rRightHoldTime, 850, 950 
    turnCamera("right", rRightHoldTime)

    Random, rZoomDist2, 10, 14
    cameraZoom("in", rZoomDist2)
}

getAllColors() {
    global viewportCoords
    global essNorthColor
    global essSouthColor
    global northScColor
    global southScColor
    global darkAltarColor
    global bloodAltarColor

    essNorthColor := getCurrHoverColor("North Ess")
    essSouthColor := getCurrHoverColor("South Ess")
    northScColor := getCurrHoverColor("North short-cut")
    southScColor := getCurrHoverColor("South short-cut")
    darkAltarColor := getCurrHoverColor("Dark Altar")
    bloodAltarColor := getCurrHoverColor("Blood Altar")

    validateColor(essNorthColor)
    validateColor(essSouthColor)
    validateColor(northScColor)
    validateColor(southScColor)
    validateColor(darkAltarColor)
    validateColor(bloodAltarColor)

}

clickAvailableEssence() {

    PixelSearch, OutputVarX, OutputVarY, X1, Y1, X2, Y2, ColorID, 1, Fast
    ; PixelSearch, essNorthX, essNorthY, 

}

; ==========
; HELPERS
; ==========
; Used in 'getAllColors() to return colors of hovered mouse pos.'
getCurrHoverColor(hoverString="North Ess") {
    ToolTip,% "Hover mouse over " hoverString " - Capturing color in 3 sec..."
    Sleep, 3000
    MouseGetPos, currX, currY
    PixelGetColor, currColor, currX, currY
    return currColor
}

validateColor(currColor) {
    ToolTip, % "Global Color: " currColor
    PixelSearch, OutputVarX, OutputVarY, viewportCoords["tlX"], viewportCoords["tlY"], viewportCoords["brX"], viewportCoords["brY"], currColor, 1, Fast
    ToolTip, % "Found @ x: " OutputVarX " Y: " OutputVarY
    customMouseMove(OutputVarX, OutputVarY)
}