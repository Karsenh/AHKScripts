#Include, D:\Misc Development\AHKScripts\ImageCapture\Imgs\Thieving\Thieving_dodgyNecklace.ahk
#Include, D:\Misc Development\AHKScripts\ImageCapture\Imgs\Thieving\Thieving_MoneyPouch.ahk
#Include, D:\Misc Development\AHKScripts\ImageCapture\Imgs\Thieving\Thieving_usedNecklace.ahk
#Include, D:\Misc Development\AHKScripts\ImageCapture\Imgs\Thieving\Thieving_checkNecklace2.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#SingleInstance, Force
CoordMode, Mouse, Relative
SetWorkingDir, %A_ScriptDir%

pickpocketKnight() {

    MouseGetPos, knightX, knightY
    usedNecklacePresent := False

    ; Loop the script
    Loop {
        ; Move mouse to Ardy knight and loop click
        customMouseMove(knightX, knightY, "slow", 2, 4)
        Loop {
            ; ToolTip, % "usedNecklacePresent = " usedNecklacePresent
            ; First check if our coinpouch is full - if so, click to empty and resume...
            if (checkCoinPouch()) {
                Break
            }
            ; ; Then check if we have a used necklace to setUsedNecklace to true which resumes checking for new necklace
            ; if (checkNecklace() OR checkNecklace2()) {
            ;     usedNecklacePresent := True
            ;     ; MsgBox, % "usedNecklace detected - setting usedNecklacePresent to True: " usedNecklacePresent
            ; }

            ; ; If we do have a used necklace we can check for new necklace to equip - after equipping new necklace we set usedNecklace to false to stop checking for new necklace until we've used at least one charge
            ; if (usedNecklacePresent) {
            ;     ; If we find a new necklace(10) equip it and set usedNecklace to false to stop checking, the resume...
            ;     if (equipNewNecklace()) {
            ;         ; MsgBox, % "Equipped new necklace - Setting isPresent to false: " usedNecklacePresent
            ;         usedNecklacePresent := False
            ;         Break
            ;     }
            ; }
            MouseClick, Left
            Random, rSleep, 10, 550
            Sleep, rSleep
        }
    }

}