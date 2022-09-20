#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

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

clickAvailableEssence() {

}

