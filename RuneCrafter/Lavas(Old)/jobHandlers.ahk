#Include, ./helpers.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Runecrafting\BankMiniMap.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Runecrafting\FireAltarImg.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\Imgs\Runecrafting\DuelArenaMiniMap.ahk
#Include, D:\Misc Development\AHKScripts\RuneCrafter\anti-ban.ahk
#Include, D:\Misc Development\AHKScripts\GlobalCoords\OSRS_CoordObjs.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

bankLavas() {
    ; Starting off in cwars lobby - moves in front of bank chest - resupplies - teleports to Duel Arena
    variances := randVariances()
    bankMinimapDelay := variances["bankMiniMapDelay"]

    ; 2. Open bank once standing in-front
    openBank()

    ; 3. Check Jewelry charges and equips if necessary
    checkJewelryCharges()

    ; 4. Withdraw Essence - Fill pouches - Withdraw more essence
    withdrawEssence()
    ; isWithdraw = False
    clickAllPouches(False)
    openBank()
    withdrawEssence()

    ; 5. Teleport to Duel Arena - sleeps - 
    teleportTo("da")

}

craftLavas() {
    global altarCoords
    Random, mmClickMouseSpeed, 3.5, 4.55
    Random, clickFireAltarMiniMapDelay, 1325, 1425
    Random, craftLavaDelay, 925, 1125
    Random, bankOpenDelay, 1400, 1550

    clickDuelArenaMinimap()

    ; Click mysterious ruins to enter fire altar
    customMouseMove(altarCoords[3]["ruinsX"], altarCoords[3]["ruinsY"], True)
    MouseClick, Left

    randomMouseMoves(125, 325)
    Sleep, clickFireAltarMiniMapDelay

    ; Click fire altar minimap tile
    MouseMove, altarCoords[2]["entranceX"], altarCoords[2]["entranceY"], mmClickMouseSpeed
    MouseClick, Left

    randomMouseMoves(120, 175)

    castImbue()
    Sleep, craftLavaDelay

    craftLavaRunes()

    teleportTo("cw")

    ; 1. Click minimap of cwars bank to move in-front
    clickBankImg()
    randomMouseMoves()
    Sleep, bankOpenDelay
}
