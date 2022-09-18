#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gWcing1 w200 section, ColorClicker
GUI, Add, button, xs gWcing2 wp, Regular Trees
GUI, Add, button, xs gWcing3 wp, Oaks
GUI, Add, button, xs gWcing4 wp, Willows
GUI, show
return

Wcing1:
    Run, %A_ScriptDir%\..\..\..\ColorClicker\ColorClicker.ahk
    GUI, Hide
return

Wcing2:
    MsgBox, "Wcing 2"
return

Wcing3:
    MsgBox, "Wcing 3"
return

Wcing4:
    MsgBox, "Wcing 4"
return
ESC::ExitApp
