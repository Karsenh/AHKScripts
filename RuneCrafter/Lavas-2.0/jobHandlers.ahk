; #Include, ./helpers.ahk
#Include, %A_LineFile%\..\helpers.ahk
#Include, %A_LineFile%\..\..\..\Utilities\GlobalLibrary.ahk

CoordMode, Mouse, Relative

; Store charges to know when to replace jewelry
ringCharges := 0
necklaceCharges := 0
runCount := 0
numPouches := 4
Random, numRuns, 13, 15
numRunsB4HouseTele := numRuns

Invoke_RuneCrafting_Lavas() {
    startScript()
    Loop {
        bankCwars()
        moveToAltar()
        craftLavaRunes()
    }
}

; ✅
startScript() {
    global ringCharges
    global necklaceCharges
    global interfaceCoords

    WinActivate, RuneLite

    ; Set initial jewelry charge based on user inputs
    InputBox, necklaceCharges, "Input Binding Necklace charges", "Enter the number of charges your currently equipped Binding necklace has: "
    InputBox, ringCharges, "Input RoD charges", "Enter the number of charges your currently equipped ring of duelling has: (0 if not equipped)"

    ; Click compass to alignt camera
    customMouseMove(interfaceCoords["compassX"], interfaceCoords["compassY"], "slow")
    MouseClick, Left

    Random, rActionDelay, 100, 300
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
    global runCount
    global numPouches

    checkPouches()

    clickCwarsBankChest()

    checkJewelry()

    withdrawEss()

    Send, {Esc}

    ; If numPouches = 3 (global), fills all three pouches regularly, otherwise (if 4), fills first two then the next two below
    clickPouches("fill", numPouches)

    clickCwarsBankChest()

    withdrawEss()

    Send, {Esc}

    if (numPouches = 4) {
        clickPouches("fill", numPouches)

        clickCwarsBankChest()

        withdrawEss()

        Send, {Esc}
    }

    teleportTo("da")

    return
}

moveToAltar() {
    ; click duel arena minimap location to being moving towards mysterious ruins -> sleep
    clickDuelArenaMinimap()

    ; click mysterious ruins to enter -> sleep
    customMouseMove(290, 130, "fast", 2, 2)
    MouseClick, Left
    Random, clickRuinsSleep, 2300, 2400

    offsetTime := idleMouseMovements()

    ; Move mouse to tile near fire altar
    customMouseMove(673, 145, "fast", 1, 0)
    Sleep, clickRuinsSleep - offsetTime
    ; click the tile nearest the fire-altar to move precisely to spot near fire altar -> sleep
    MouseClick, Left
    Random, moveToAltarSleep, 2000, 2100
    Sleep, moveToAltarSleep

    return
}

craftLavaRunes() {
    global runCount
    global necklaceCharges
    global ringCharges
    global numRunsB4HouseTele

    ; open mage tab & cast imbue
    castImbue()

    ; open inventory -> use earth runes with fire altar -> clickPouches("empty") [shift down + left click] -> use earth runes with fire altar
    craftLavas()

    ; Return to Cwars bank to start over
    if (mod(runCount, numRunsB4HouseTele) = 0 And runCount > 0) {
        teleportTo("house")
        drinkFromPool()
        ; useOrnateFromPool("cw")
        teleportTo("cw")
    } else {
        teleportTo("cw")
    }

    runCount += 1

    ToolTip, % "Run Count = " runCount, 0, 60 

    clickCwarsBankIcon()

    return
}

; Cwars bank
; Move to altar
; Craft runes
; Return to cwars