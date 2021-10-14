#Include, ./debugging.ahk
#Include, D:\Misc Development\AHKScripts\GlobalCoords\OSRS_CoordObjs.ahk
#Include, D:\Misc Development\AHKScripts\RuneCrafter\anti-ban.ahk
#Include, ../ImageCapture/BankMiniMap.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\FireAltarImg.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\DuelArenaMiniMap.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

RemoveToolTip:
    ToolTip
return

getJewelryCharges() {
    global rodCharges
    global bindindNecklaceCharges
    ; Input custom values for binding and RoD rodCharges
    InputBox, bindingVal , "Bindind Necklace Charges", "How many charges does your binding necklace have?"
    InputBox, rodVal , "RoD Charges", "How many charges does your RoD have?"

    rodCharges := rodVal
    bindindNecklaceCharges := bindingVal

    ; MsgBox, % "RoD Charges = " rodCharges
    ; MsgBox, % "Necklace Charges = " bindindNecklaceCharges
}

clickAllPouches(isWithdraw) {
    global inventoryCoords

    variance := randVariances()
    actionDelay := variance["actionDelayShort"]

    ; Open inventory
    Send, {F1}

    if (isWithdraw) {
        ; Shift + Left click 
        customMouseMove(inventoryCoords[1]["slot1X"], inventoryCoords[1]["slot1Y"], False, True)
        Send, {Shift Down}
        MouseClick, Left
        customMouseMove(inventoryCoords[2]["slot2X"], inventoryCoords[2]["slot2Y"], False, True)
        MouseClick, Left
        customMouseMove(inventoryCoords[3]["slot3X"], inventoryCoords[3]["slot3Y"], False, True)
        MouseClick, Left 
        Send, {Shift Up}
    } else {
        ; Regular Left click
        customMouseMove(inventoryCoords[1]["slot1X"], inventoryCoords[1]["slot1Y"], False, True)
        MouseClick, Left
        customMouseMove(inventoryCoords[2]["slot2X"],inventoryCoords[2]["slot2Y"], False, True)
        MouseClick, Left
        customMouseMove(inventoryCoords[3]["slot3X"], inventoryCoords[3]["slot3Y"], False, True)
        MouseClick, Left
    }

    Sleep, actionDelay 

}

withdrawEssence() {
    global bankCoords

    variance := randVariances()
    delayDev := variance["actionDelayShort"]

    customMouseMove(bankCoords[2]["essenceSlotX"], bankCoords[2]["essenceSlotY"])
    Sleep, delayDev
    MouseClick, Right
    customMouseMove(bankCoords[3]["essenceWithdrawX"], bankCoords[3]["essenceWithdrawY"], False, True)
    MouseClick, Left
    Send {Esc}
    Sleep, delayDev - 100
}

openBank() {
    global bankCoords
    variance := randVariances()
    delayDev := variance["actionDelayShort"]

    customMouseMove(bankCoords[1]["chestX"], bankCoords[1]["chestY"], True)
    MouseClick, Left
    Sleep, delayDev + 275
}

teleportTo(location) {
    global equipmentCoords
    global rodCharges

    variance := randVariances()
    delayDev := variance["actionDelayShort"]
    teleportDelay := variance["teleportDelay"]
    Random, customDelay, 250, 500

    Sleep, customDelay
    ; Open equipment tab 
    Send, {F5}

    ; If Duel Arena or Castle Wars is passed as argument
    if (location == "da" || location == "cw") {
        ; Mouse move to ring slot in equipment tab & right click
        customMouseMove(equipmentCoords[1]["ringSlotX"], equipmentCoords[1]["ringSlotY"])
        MouseClick, Right
        if (location == "da") {
            ; Duel Arena
            customMouseMove(equipmentCoords[2]["duelArenaX"], equipmentCoords[2]["duelArenaY"], True, True)
            Sleep, delayDev
            MouseClick, Left
            randomMouseMoves()
            ; Shave time off daTeleportSleep based on slowest randomMouseMoves() cycle
        } else {
            ; Castle Wars
            customMouseMove(equipmentCoords[3]["castleWarsX"], equipmentCoords[3]["castleWarsY"], True, True)
            Sleep, delayDev
            MouseClick, Left
            randomMouseMoves()
        }
        ; Else (home)
    } else {
        ; Mouse move to Construction Cape slot in equipment tab
        customMouseMove(equipmentCoords[1]["ringSlotX"], equipmentCoords[1]["ringSlotY"])
        ; Right click ring
        MouseClick, Right
        ; Castle Wars
        customMouseMove(equipmentCoords[3]["castleWarsX"], equipmentCoords[3]["castleWarsY"], True, True)
    }
    Sleep, teleportDelay - 350
    rodCharges -= 1
    ToolTip, % "RoD: " rodCharges
    SetTimer, RemoveToolTip, -5000
}

castImbue() {
    ; Open Magic tab
    global spellCoords

    variance := randVariances()
    mouseSpeed := variance["mouseSpeedFast"]
    pixelDev := variance["pixelDev"]
    delayDev := variance["actionDelayLong"]
    Random, castImbueDelay, 125, 275

    ; Open Magic tab
    Send, {F2}

    ; Move mouse to Imbue spell
    customMouseMove(spellCoords[1]["imbueX"], spellCoords[1]["imbueY"])

    Sleep, imbueDelay

    MouseClick, Left

    Sleep, delayDev + 100
}

useEarthRunesWithAltar() {
    global inventoryCoords
    global altarCoords
    global bindindNecklaceCharges

    variance := randVariances()
    delayDev := variance["actionDelayLong"]
    Random, earthDelay, 300, 375

    ; Mousemove to Earth runes
    customMouseMove(inventoryCoords[4]["slot4X"], inventoryCoords[4]["slot4Y"])

    ; Select Earth runes
    MouseClick, Left

    ; Mousemove to Fire Altar
    customMouseMove(altarCoords[1]["fireAltarX"], altarCoords[1]["fireAltarY"])

    ; Use Earth runes with Fire Altar to craft Lavas
    MouseClick, Left

    bindindNecklaceCharges -= 1
    ToolTip, % "Necklace: " bindindNecklaceCharges
    SetTimer, RemoveToolTip, -5000

    ; wait for crafting stall
    Sleep, delayDev + earthDelay
}

craftLavaRunes() {
    ; Open inventory
    Send, {F1}
    useEarthRunesWithAltar()
    clickAllPouches(true)
    useEarthRunesWithAltar()
}

equipNewJewelry(jewelryType) {
    global bankCoords
    global inventoryCoords

    variance := randVariances()
    rDelay := variance["actionDelayLong"]
    Random, withdrawDelay, 475, 525

    if (jewelryType == "ring") {
        ; Assumes bank is already open
        ; mousemove to bank slot of ring & withdraws
        ; Mouse to ring bank slot
        customMouseMove(bankCoords[4]["rodX"], bankCoords[4]["rodY"], True)
        MouseClick, Left
        ; mousemove to inventory slot next to origin to right click > equip
        customMouseMove(inventoryCoords[5]["equipItemX"], inventoryCoords[5]["equipItemY"], True)
        ; wait for jewelry item to withdraw before right click > equipment
        Sleep, withdrawDelay
        MouseClick, Right
        ; mousemove to equip and click
        customMouseMove(inventoryCoords[5]["equipItemX"] - 30, inventoryCoords[5]["equipItemY"] + 116, True, True)
        MouseClick, Left
        Sleep, rDelay

    } else if (jewelryType == "necklace") {
        ; Assumes bank is already open

        customMouseMove(bankCoords[5]["bindingX"], bankCoords[5]["bindingY"], True)
        MouseClick, Left
        ; Mousemove to inventory slot (next to origin)
        customMouseMove(inventoryCoords[5]["equipItemX"], inventoryCoords[5]["equipItemY"], True)
        Sleep, rDelay
        ; Right click necklace
        MouseClick, Right
        ; Mousemove to 'Equip'
        customMouseMove(inventoryCoords[5]["equipItemX"] - 32, inventoryCoords[5]["equipItemY"] + 118, True, True)
        ; Click to equip
        MouseClick, Left
        Sleep, rDelay
    }

}

checkJewelryCharges() {
    global rodCharges
    global bindindNecklaceCharges

    ; MsgBox,% "RoD Charges: " rodCharges
    ; MsgBox,% "Necklace Charges: " bindindNecklaceCharges

    if (rodCharges == 0) {
        ; withdraw ring of dueling
        ; right click and equip
        equipNewJewelry("ring")
        rodCharges := 8
    }
    if (bindindNecklaceCharges == 0) {
        ; withdraw necklace of binding
        ; right click and equip
        equipNewJewelry("necklace")
        bindindNecklaceCharges := 16
    }
}

testHelperAccess() {
    global bankCoords

    MsgBox, % "Helper bank coords = " bankCoords[1]["chestX"]
}