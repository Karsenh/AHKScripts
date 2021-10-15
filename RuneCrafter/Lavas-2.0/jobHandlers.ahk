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

startScript() {
    global ringCharges
    global necklaceCharges
    global interfaceCoords

    ; Set initial jewelry charge based on user inputs
    InputBox, ringCharges, "Input RoD charges", "Input the current number of ring of dueling charges for your equipped RoD, or zero for none."
    InputBox, necklaceCharges, "Input Binding Necklace charges", "Input the current number of binding necklace charges for your equipped necklace, or zero for none."

    MsgBox, % "Interface coords X: " interfaceCoords["compassX"] " Y: " interfaceCoords["compassY"]
    ; Click compass to alignt camera
    customMouseMove(interfaceCoords["compassX"], interfaceCoords["compassY"], "slow")
    MouseClick, Left

    Random, rActionDelay, 150, 275
    Sleep, rActionDelay

    ; Zoom all the way out to normalize x/y coorindate interface
    customMouseMove(280, 190, "fast", 50, 50)
    Send, {WheelDown 100}

    clickCwarsBankIcon()
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

    ; click the minimap x y location to move precisely to spot near fire altar -> sleep

    ; open mage tab & cast imbue

    ; open inventory -> use earth runes with fire altar -> clickPouches("empty") [shift down + left click] -> use earth runes with fire altar
    return
}

craftLavas() {
    return

}

returnToBank() {
    return

}

; Cwars bank
; Move to altar
; Craft runes
; Return to cwars