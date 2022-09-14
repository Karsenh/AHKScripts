#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Bossing\Corp\jobHandler.ahk
#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\QOL.ahk   
#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\Global-Coords.ahk 
#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\ImageCapture\Imgs\CorpCave\PrivatePortal.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

NumpadEnter::
    ; MouseGetPos, X, Y
    ; ToolTip, % "X: " X " " "Y: " Y
    MainSequence()
return

Numpad0::
    EmergencyTeleport()
return

PgDn::
    Pause, Toggle
return

F1::
    normalizeInterface()
return

F2::
    ; (Starting in corp cave after having clicked attack with first spec clicked already - wait for first attack then execute ahk command)
    MainSequence()
return


F3::
    EmergencyTeleport()
return 