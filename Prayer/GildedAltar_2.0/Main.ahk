#Include, ./jobHandler.ahk
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

Del::
InputBox, startStep, "Starting Step", "What step would you like to start on? 1-Bones 2-RemmyTele 3-Unnote 4-MoveToAltar"
    if (startStep == "1") {
        Loop {
            useBonesOnAltar()
            teleToRemmy()
            unnoteBones()
            moveToWorklessAltar()
        }
    } else if (startStep == "2") {
        Loop {
            teleToRemmy()
            unnoteBones()
            moveToWorklessAltar()
            useBonesOnAltar()
        }
    } else if (startStep == "3") {
        Loop {
            unnoteBones()
            moveToWorklessAltar()
            useBonesOnAltar()
            teleToRemmy()
        }
    } else {
        Loop {
            moveToWorklessAltar()
            useBonesOnAltar()
            teleToRemmy()
            unnoteBones()
        }
    }

return

Numpad0::
    ; teleToRemmy()
    ; unnoteBones()
    ; useBonesOnAltar()
return