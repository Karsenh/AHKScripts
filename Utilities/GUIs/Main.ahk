#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gScriptOne w100 section, RuneCrafting
GUI, Add, button, xs gScriptTwo wp, Woodcutting
GUI, Add, button, xs gScriptThree wp, MiniGames
GUI, show
return

ScriptOne:
    MsgBox, "test"
return

ScriptTwo:
    MsgBox, "Test"
    run %A_ScriptDir%\ColorClickerGUI.ahk
    GUI, Hide
return

ScriptThree:
    run %A_ScriptDir%\MiniGamesGUI.ahk
ESC::ExitApp