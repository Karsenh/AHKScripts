#Include, ./JobHandler.ahk
#Include, ../../Utilities/GlobalLibrary.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

PgDn::
    Pause, Toggle
return

; Gear swap + imbued heart
NumpadEnter::
    ; debugMouseCoords()
    BlockInput, On
    switchToGear("magic")
    BlockInput, Off
return

; Gear swap
Numpad0::
    BlockInput, On
    switchToGear("melee")   
    BlockInput, Off
return

; Standard prot prayers
Numpad7::
    ; Prot Mage
    BlockInput, On
    prayMage()
    BlockInput, Off

return

Numpad8::
    ; Prot Range
    BlockInput, On
    prayRange()
    BlockInput, Off

return

Numpad9::
    ; Prot Melee
    BlockInput, On
    prayMelee()
    BlockInput, Off

return


; Nightmare Shifted (Special atk)
Numpad4::
    ; Prot Mage
    BlockInput, On
    ; prayRange()
    prayMelee()
    BlockInput, Off

return

Numpad5::
    ; Prot Range
    BlockInput, On
    ; prayMelee()
    prayMage()
    BlockInput, Off

return

Numpad6::
    ; Prot Melee
    BlockInput, On
    ; prayMage()
    prayRange()
    BlockInput, Off

return



Numpad1::
    BlockInput, On
    meleeSpec("claws")
    BlockInput, Off
return 

Numpad2::
    BlockInput, On
    meleeSpec("sgs")
    BlockInput, Off

return 

Numpad3::
    BlockInput, On
    clickQuickCure()
    BlockInput, Off
return
