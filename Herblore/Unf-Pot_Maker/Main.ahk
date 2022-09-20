#SingleInstance, Force
#Include, ./jobHandler.ahk
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

PgUp::
    getPixelColor()

    Loop {
        bank()
        make14Pots()
        checkIfLoggedOut()
    }
return

PgDn::
    Pause, Toggle
return