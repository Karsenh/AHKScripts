#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

GUI, Add, button, gScriptOne w100 section, RuneCrafting
GUI, Add, button, xs gScriptTwo wp, Woodcutting
GUI, Add, button, xs gScriptThree wp, Smithing
GUI, show
return

ScriptOne:
    run D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\GUIs\test.ahk
return

ScriptTwo:
    run D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\GUIs\ColorClickerGUI.ahk
    GUI, Hide
return

ScriptThree:
    run scriptthree.ahk
return