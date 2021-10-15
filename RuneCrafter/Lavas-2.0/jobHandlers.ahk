#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\RuneCrafter\Lavas-2.0\helpers.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Runecrafting\DuelArenaMiniMap.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Runecrafting\cwarsBankMiniMap.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

; Store charges to know when to replace jewelry
ringCharges := 0
necklaceCharges := 0

; ✅
startScript() {
    global ringCharges
    global necklaceCharges
    global interfaceCoords

    ; Set initial jewelry charge based on user inputs
    InputBox, necklaceCharges, "Input Binding Necklace charges", "Enter the number of charges your currently equipped Binding necklace has: "
    InputBox, ringCharges, "Input RoD charges", "Enter the number of charges your currently equipped ring of duelling has: (0 if not equipped)"

    ; Click compass to alignt camera
    customMouseMove(interfaceCoords["compassX"], interfaceCoords["compassY"], "slow")
    MouseClick, Left

    Random, rActionDelay, 150, 275
    Sleep, rActionDelay

    ; Zoom all the way out to normalize x/y coorindate interface
    customMouseMove(280, 190, "fast", 50, 50)
    Send, {WheelDown 100}
    return
}

bankCwars() {
    ; Click bank icon mini map to move to chest -> sleep
    global ringCharges
    global necklaceCharges

    ; ✅ Move to bank chest in cwars
    clickCwarsBankIcon()

    ; ✅ Open bank
    clickCwarsBankChest()

    ; ✅ Check jewelry charges / equip what is necessary
    checkJewelry()

    ; ✅ Click chest to open bank and withdraw essence
    withdrawEss()

    Send, {Esc}

    ; ✅ Close bank and fill pouches
    clickPouches("fill")

    ; ✅ Reopen bank
    clickCwarsBankChest()

    ; ✅ Withdraw essence again
    withdrawEss()

    ; ✅ Close out of the bank interface
    Send, {Esc}

    ; ✅ Teleport to Duel Arena
    teleportTo("da") 

    return
}

moveToAltar() {
    ; click duel arena minimap location to being moving towards mysterious ruins -> sleep
    clickDuelArenaMinimap()

    ; click mysterious ruins to enter -> sleep
    customMouseMove(290, 142, "fast", 3, 3)
    MouseClick, Left
    Random, clickRuinsSleep, 3000, 3100

    idleMouseMovements()

    customMouseMove(492, 332)
    Sleep, clickRuinsSleep
    ; click the tile nearest the fire-altar to move precisely to spot near fire altar -> sleep
    MouseClick, Left
    Random, moveToAltarSleep, 2500, 2625
    Sleep, moveToAltarSleep

    return
}

craftLavaRunes() {
    ; open mage tab & cast imbue
    castImbue()

    ; open inventory -> use earth runes with fire altar -> clickPouches("empty") [shift down + left click] -> use earth runes with fire altar
    craftLavas()

    ; Return to Cwars bank to start over
    teleportTo("cw")

    return
}

; Cwars bank
; Move to altar
; Craft runes
; Return to cwars