#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\Anti-ban.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative


ClickMMSpec() {
    customMouseMove(590, 176)
    customMouseClick()
    return
}