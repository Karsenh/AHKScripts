#Include, ..\..\Utilities\GlobalLibrary.ahk
#Include, .\jobHandlers.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

`::
    ; turnCamera("right", 1000)
    ; idleCameraRotation()
    ; checkIfLoggedOut()
    ; normalizeZeahBloodInterface()
    ; getAllColors()
    MouseGetPos, currX, currY
    PixelGetColor, currColor, currX, currY

    PixelSearch, OutputVarX, OutputVarY, viewportCoords["tlX"], viewportCoords["tlY"], viewportCoords["brX"], viewportCoords["brY"], currColor, 1, Fast

    MsgBox, % "X: " OutputVarX " Y: " OutputVarY " CurrColor: " currColor
return

PgDn::
    Pause, Toggle
return

LShift & Esc:: ExitApp