#SingleInstance, Force
#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Runecrafting\cwarsBankMiniMap.ahk
SetWorkingDir, %A_ScriptDir%

startScript() {
    ; Take initial jewelry charge inputs

    ; Click compass to alignt camera
    global interfaceCoords
    customMouseMove(interfaceCoords["compassX"], interfaceCoords["compassY"], "slow")
    MouseClick, Left

    ; Zoom all the way out to normalize x/y coorindate interface
    customMouseMove(280, 190, "fast", 50, 50)
    Send, {WheelDown 100}

}

bankCwars() {
    ; Click bank icon mini map to move to chest -> sleep
    clickCwarsBank()

    ; Check jewelry (ring of dueling, necklace of binding) charges based on initialization inputs
    ; Withdraw ring of dueling (if applicable)
    ; Right click in inventory and equip
    ; Withdraw necklace of binding (if applicable)
    ; Right click in inventory and equip

    ; Click chest to open bank and withdraw essence

    ; Close bank and fill pouches

    ; Click chest to open bank and withdraw essence

    ; 
}

moveToAltar() {

}

craftLavas() {

}

returnToBank() {

}

; Cwars bank
; Move to altar
; Craft runes
; Return to cwars