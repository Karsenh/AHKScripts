#Include, ./jobHandlers.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

NumpadEnter::
    MouseGetPos, X, Y
    ToolTip, % "X: " X " | Y: " Y
return

PgDn:: 
    Pause, Toggle
return

`::
    InputBox, startStep, "Starting Step", "What step would you like to start on? `r 1 - UseBones `r 2 - CwarsRestock `r 3 - ReturnToWorkless"
    if (startStep == "1") {
        Loop {
            useBonesOnAltar()
            getBonesFromCwars()
            moveBackToWorklessAltar()
        }
    } else if (startStep == "2") {
        Loop {
            getBonesFromCwars()
            moveBackToWorklessAltar()
            useBonesOnAltar()
        }
    } else {
        Loop {
            moveBackToWorklessAltar()
            useBonesOnAltar()
            getBonesFromCwars()
        }
    }
return