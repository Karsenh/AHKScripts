#Include, C:\Users\OSRS\AHK\AHKScripts\MoneyMaking\MagicSaplings\Main.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%


bank() {
    customMouseMove(278, 195)
    MouseClick, Left

    customMouseMove(427, 125)
    Sleep, 500
    MouseClick, Right

    MouseGetPos, currX, currY
    customMouseMove(currX, currY+100, "fastest")
    MouseClick, Left

    Send, {Esc}
}

plantSeeds() {
    global inventoryCoords

    Loop, 26 {
        ; currIndex := A_Index
        currX := "slot" A_Index "X"
        currY := "slot" A_Index "Y"

        if (A_Index != 14) {
            ; ToolTip, % "Curr Slot = " inventoryCoords[currX] " " inventoryCoords[currY]
            customMouseMove(inventoryCoords["slot14X"], inventoryCoords["slot14Y"], "fastest")
            MouseClick, Left
            customMouseMove(inventoryCoords[currX], inventoryCoords[currY], "fastest")
            MouseClick, Left
        }

        Sleep, 175
    }

}
