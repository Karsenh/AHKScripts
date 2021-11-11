#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\ImgCap.ahk
#Include, D:\Misc Development\AHKScripts\Utilities\Global-Coords.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

clickLocatorOrb() {
    global inventoryCoords
    startTick := A_TickCount

    Loop, {
        Random, hpGenerationSleep, 60000, 64000

        if ( Mod(A_TickCount - startTick, hpGenerationSleep) == 0 ) {
            BlockInput, On
            customMouseMove(inventoryCoords["slot1X"], inventoryCoords["slot1Y"])
            Random, rNumClicks, 8, 15
            Loop, %rNumClicks% {
                MouseClick, Left
                Random, rClickIntervalSleep, 10, 75
                Sleep, rClickIntervalSleep
            }
            BlockInput, Off
        }
        ToolTip, % "If " A_TickCount - startTick " MOD 10 = 0"
    }
}