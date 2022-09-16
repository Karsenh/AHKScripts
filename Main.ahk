#Include, .\RuneCrafter\Lavas-2.0\jobHandlers.ahk
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

Gui, Color, White

Gui, Add, Radio, x10 y10 Checked Group vRad1 gRadio_Label, White
Gui, Add, Radio, x10 vRad2 gRadio_Label, Blue
Gui, Add, Radio, x10 vRad3 gRadio_Label, Green
Gui, Add, Radio, x10 vRad4 gRadio_Label, Red
Gui, Add, Radio, x10 vRad5 gRadio_Label, "RuneCrafting - Lavas"

Gui, Show, w500 h250, Selector , Gui
Gui, Submit, NoHide
return

GuiClose:
ExitApp

Radio_Label:
    Gui, Submit, NoHide
    if(Rad1==1)
        Gui, Color, White
    if(Rad2==1)
        Gui, Color, Blue
    if(Rad3==1)
        Gui, Color, Green
    if(Rad4 = True)
        Gui, Color, Red
    if(Rad4 = True)
        Invoke_RuneCrafting_Lavas()
return

NumpadEnter::
ExitApp