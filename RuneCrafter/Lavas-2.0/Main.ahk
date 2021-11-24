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
NumpadEnter::
    debugMouseCoords()
return

; Debugging
Ins::
    ; startScript()
    ; bankCwars()
    ; moveToAltar()
    ; craftLavaRunes()
    ; customMouseMove(280, 200, "slow", 2, 2)
    ; openBank()
    ; withdrawAndEquipJewelry()
    ; withdrawAndEquipJewelry("ring")
    ; startScript()
    ; clickCwarsBankChest()
    ; checkJewelry()
    ; withdrawEss()
    ; teleportTo("da")
    ; teleportTo("cw")
    ; clickPouches("fill")
    ; clickPouches("empty")
    ; moveToAltar()
    ; clickCwarsBankIcon()
    ; clickDuelArenaMinimap()
    ; idleMouseMovements()
    ; withdrawEss()
    ; teleportTo("house")
    ; drinkFromPool()
    ; useOrnateFromPool("cw")
    ; clickGiantPouch()
    ; checkPouches()
    clickCwarsBankIcon()

return