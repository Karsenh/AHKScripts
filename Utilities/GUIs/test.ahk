#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gRcing1 w100 section, Lava Rc'ing 
GUI, Add, button, xs gRcing2 wp, Blood Rc'ing 
GUI, Add, button, xs gRcing3 wp, Soul Rc'ing 
GUI, show
return

Rcing1:
`::
    MsgBox, "Getting color..."
    MouseGetPos, currX, currY
    PixelGetColor, OutputVar, currX, currY
    MsgBox, % "Pixel color: " OutputVar
return
return

Rcing2:
    MsgBox, "Rcing 2"
return

Rcing3:
    MsgBox, "Rcing 3"
return