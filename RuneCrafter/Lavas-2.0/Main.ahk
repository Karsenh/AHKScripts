#Include, .\jobHandlers.ahk
#SingleInstance, Force
CoordMode, Mouse, Relative

global inventoryCoords

; Start Script
PgUp::
    startScript()
    Loop {
        bankCwars()
        moveToAltar()
        craftLavaRunes()
    }
return

; Toggle Script Pause/Start
PgDn::
    Pause, Toggle
return

; Get Mouse Coords
; NumpadEnter::
;     debugMouseCoords()
; return

; Debugging
Numpad0::
    ; clickCwarsBankIcon()
    clickDuelArenaMinimap()
return