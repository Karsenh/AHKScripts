#SingleInstance, Force
#Include, ./jobHandler.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

PgUp::
    getPixelColor()

    Loop {
        bank()
        make14Pots()
    }
return

PgDn::
    Pause, Toggle
return