#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gScriptOne w100 section, RuneCrafting
GUI, Add, button, xs gScriptTwo wp, Woodcutting
GUI, show
return

ScriptOne:
    MsgBox, "test"
return

ScriptTwo:
    run %A_ScriptDir%\ColorClickerGUI.ahk
    GUI, Hide
return
