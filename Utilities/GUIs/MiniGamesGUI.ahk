#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gMiniGames1 w100 section, GotR
GUI, Add, button, xs gMiniGames2 wp, test1
GUI, Add, button, xs gMiniGames3 wp, test2 
GUI, show
return

MiniGames1:
    Run, %A_ScriptDir%\..\..\Minigames\GuardiansOfTheRift\Gotr_Main.ahk
    GUI, hide
return

MiniGames2:
    MsgBox, "Placeholder"
return

MiniGames3:
    MsgBox, "Placeholder"
return

Esc::ExitApp