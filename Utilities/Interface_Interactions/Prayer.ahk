#Include %A_LineFile%\..\..\Anti-ban.ahk

prayMage() {
    global prayerCoords

    BlockInput, On

    Send, {F4}
    customMouseMove(prayerCoords["protMagicX"], prayerCoords["protMagicY"], "fastest")
    MouseClick, Left
    ; customMouseClick()

    BlockInput, Off
}

prayRange() {
    global prayerCoords

    BlockInput, On

    Send, {F4}
    customMouseMove(prayerCoords["protRangeX"], prayerCoords["protRangeY"], "fastest")
    MouseClick, Left
    ; customMouseClick()

    BlockInput, Off
}

prayMelee() {
    global prayerCoords

    BlockInput, On

    Send, {F4}
    customMouseMove(prayerCoords["protMeleeX"], prayerCoords["protMeleeY"], "fastest")
    MouseClick, Left
    ; customMouseClick()

    BlockInput, Off
}