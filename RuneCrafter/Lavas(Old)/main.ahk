#Include, ./jobHandlers.ahk
#Include, ./debugging.ahk
#Include, ./helpers.ahk
#Include, D:\Misc Development\AHKScripts\RuneCrafter\anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\GlobalCoords\OSRS_CoordObjs.ahk
; -----------

; In-Game Hotkeys
; F1 = Inventory tab
; F2 = Magic tab
; F5 = Equipment tab

CoordMode, Mouse, Relative

; Build Array with mouse coorindates
Numpad0::
    buildRCCoords()
return

; BANK
PgUp::
    Loop, {
        bankLavas()
        craftLavas()
    }
return

; FIRE ALTAR
PgDn::

return

; Individual testing
Numpad3::
    global bankCoords
    ; testMouseMovements()
    ; randomTabBrowse()
    ; testRandomMouseMovements()
    ; bankLavas()
    ; clickDuelArenaMinimap()
    ; craftLavas()
    ; randomMouseMoves()
    ; equipNewJewelry("ring")
    ; equipNewJewelry("necklace")
    ; MsgBox, % "Coords = " bankCoords[1]["chestX"]
    ; testHelperAccess()

return

Numpad4::

return

Numpad5::

return

Numpad6::

return

NumpadAdd::
    Pause, Toggle
return

NumpadSub::
    Reload
    Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
    MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
        IfMsgBox, Yes, Edit
return