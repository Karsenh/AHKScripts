#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gRcing1 w100 section, ColorClicker
GUI, Add, button, xs gRcing2 wp, Regular Trees
GUI, Add, button, xs gRcing3 wp, Oaks
GUI, Add, button, xs gRcing4 wp, Willows
GUI, show
return

Rcing1:
    Run, %A_ScriptDir%\..\..\..\ColorClicker\ColorClicker.ahk
return

Rcing2:
    MsgBox, "Rcing 2"
return

Rcing3:
    MsgBox, "Rcing 3"
return

Rcing4:
    MsgBox, "Rcing 4"
return