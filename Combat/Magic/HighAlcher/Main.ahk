#Include, ../../../Utilities/GlobalLibrary.ahk
#Include, ./jobHandler.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

NumpadEnter::
    debugMouseCoords()
return

PgDn::
    Pause, Toggle
return

`::
    alch()
return