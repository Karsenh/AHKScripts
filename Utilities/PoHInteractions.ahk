#Include, %A_LineFile% \..\Anti-ban.ahk
#Include, %A_LineFile% \..\Global-Coords.ahk

#SingleInstance, Force
CoordMode, Mouse, Relative

; These methods assume you have normalized your interface / viewport with QOL 


ClickOrnatePool() {
    Random, mousedelay, 10, 80
    customMouseMove(235, 170)
    Sleep, mousedelay
    customMouseClick()
}

ClickJewelryBoxFromPool() {
    Random, mouseDelay, 10, 80
    customMouseMove(226, 160, 2, 2)
    Sleep, mousedelay
    customMouseClick()
}