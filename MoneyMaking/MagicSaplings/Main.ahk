; DEFAULT
#Include, C:\Users\OSRS\AHK\AHKScripts\Utilities\QOL.ahk
#Include, C:\Users\OSRS\AHK\AHKScripts\Utilities\Anti-ban.ahk
#Include, C:\Users\OSRS\AHK\AHKScripts\Utilities\Global-Coords.ahk
; PROJECT
#Include, C:\Users\OSRS\AHK\AHKScripts\MoneyMaking\MagicSaplings\Helpers.ahk
#Include, C:\Users\OSRS\AHK\AHKScripts\MoneyMaking\MagicSaplings\JobHandlers.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

PgUp::
    normalizeInterface()
    Loop, {
        bank()
        plantSeeds()
        castHumidify()
    }

return

Ins::
    ; bank()
    plantSeeds()
return

PgDn::
    Pause, Toggle
return

NumpadEnter::
    MouseGetPos, currX, currY
    ToolTip, % "X: " currX " Y: " currY
return