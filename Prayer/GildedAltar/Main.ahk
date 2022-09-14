#Include, ./jobHandler.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

home::
    MouseGetPos, X, Y
    ToolTip, % "X: " X " | Y: " Y
return

PgDn:: 
    Pause, Toggle
return

Del::
    useBonesWithAltar()
return