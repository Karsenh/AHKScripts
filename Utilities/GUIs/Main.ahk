#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gScriptOne w100 section, RuneCrafting
GUI, Add, button, xs gScriptTwo wp, Prayer
GUI, Add, button, xs gScriptThree wp, Woodcutting
GUI, Add, button, xs gScriptFour wp, MiniGames
GUI, Add, button, xs gScriptFive wp, Bossing
GUI, show
return

ScriptOne:
    run %A_ScriptDir%\SkillGUIs\Runecrafting.ahk
    GUI, Hide
return

ScriptTwo:
    MsgBox, % "Select color with ` "
    run %A_ScriptDir%\SkillGUIs\Woodcutting.ahk
    GUI, Hide
return

ScriptThree:
    MsgBox, % "Select color with ` "
    run %A_ScriptDir%\SkillGUIs\Woodcutting.ahk
    GUI, Hide
return 

ScriptFour:
    run %A_ScriptDir%\Skills\MiniGamesGUI.ahk
return 

ScriptFive:
    run %A_ScriptDir%\Skills\MiniGamesGUI.ahk
return 
ESC::ExitApp