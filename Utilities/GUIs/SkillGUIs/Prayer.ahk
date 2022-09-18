#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gPrayer1 w200 section, Workless' House
GUI, Add, button, xs gPrayer2 wp, Placeholder
GUI, show
return

Prayer1:
    Run, %A_ScriptDir%\..\..\..\Prayer\GildedAltar_Cwars\Main.ahk
    GUI, Hide
ExitApp
return

Prayer2:
    MsgBox, "Prayer 2"
return

ESC::ExitApp
