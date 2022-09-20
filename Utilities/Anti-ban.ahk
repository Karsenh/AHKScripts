#Include, %A_LineFile%\..\QOL.ahk
#SingleInstance, Force
CoordMode, Mouse, Relative

customMouseMove(endX, endY, speed="fast", xRange=4, yRange=4) {
    Random, fastestMouseSpeed, 77, 112
    Random, fastMouseSpeed, 325, 390
    Random, slowMouseSpeed, 425, 525
    Random, rXDev, -xRange, xRange
    Random, rYDev, -yRange, yRange
    Random, preClickSleep, 12, 75

    MouseGetPos, X, Y

    endX += rXDev
    endY += rYDev

    if (speed == "fast") {
        RandomBezier(X, Y, endX, endY, "T" . fastMouseSpeed . " P2-5")
    } else if (speed == "fastest") {
        RandomBezier(X, Y, endX, endY, "T" . fastestMouseSpeed . " P1-2")
    } else {
        RandomBezier(X, Y, endX, endY, "T" . slowMouseSpeed . " P2-6")
    }

    Sleep, preClickSleep

    return 
}

customMouseClick(clickDirection="left") {
    Random, xCoordDev, -4, 4
    Random, yCoordDev, -4, 4
    Random, moveDelay, 2, 23
    MouseGetPos, currX, currY
    Random, mouseSpeed, 3, 27

    if (clickDirection == "left") {
        MouseClick, Left
        Sleep, moveDelay
        MouseMove, currX + xCoordDev, currY + yCoordDev, mouseSpeed 
    } else {
        MouseClick, Right
    }
    return
}

idleMouseMovements() {
    startTime := A_TickCount
    Random, preDelay, 50, 325
    Random, loopIterations, 1, 3

    Sleep, preDelay
    Loop, %loopIterations% {
        Random, coordX, 0, 750
        Random, coordY, 0, 500
        Random, loopSleep, 25, 325

        customMouseMove(coordX, coordY, "slow")
        Sleep, loopSleep
    }
    elapsedTime := A_TickCount - startTime
    ; MsgBox, % "Elapsed time = " elapsedTime
    return elapsedTime
}

idleCameraRotation(movement="subtle") {
    ; Randomize, number of camera turns (2-5 / 1-3 for subtle)
    ; Randomize the direction of ea turn based on number of turns
    ; Randomize length of ea turn (less for subtle)
    ; Randomize delay between ea turn
    ; Add Random combo turns (Left-Up / Right-Up / Left-Down / Right-Down)
    startTime := A_TickCount
    numCamTurns := 0
    directionsToTurn := Object()

    if (movement="subtle") {
        Random, numTurns, 1, 3
        numCamTurns := numTurns

    } else {
        Random, numTurns, 2, 5
        numCamTurns := numTurns
    }

    Loop, %numCamTurns% {
        newDirection := getRandDirection()
        if (directionsToTurn.Count() >= 1)
        {
            if (directionsToTurn[numCamTurns-1] == newDirection)
            {
                While, (directionsToTurn[numCamTurns-1] == newDirection)
                {
                    idx := numCamTurns - 1
                    newDirection := getRandDirection()
                }
            }

            directionsToTurn.Push(newDirection)

        } else {
            directionsToTurn.Push(newDirection)

        }

    }

    for Key, Val in directionsToTurn {
        List .= Key "`t" Val "`n"
        if (movement="subtle") {
            Random, rTurnTime, 200, 950
            Random, rDelayTime, 50, 150
        }
        Else {
            Random, rTurnTime, 975, 1867
            Random, rDelayTime, 121, 412
        }
        if (Val == "Up" Or Val == "Down")
            rTurnTime := rTurnTime / 2
        turnCamera(Val, rTurnTime)
        Sleep, rDelayTime
    }

    elapsedTime := A_TickCount - startTime
    ; MsgBox, %List%
    ; MsgBox, % "Elapsed Time: " elapsedTime
    return elapsedTime
}

idleStatCheck(skill="random") {
    global skillCoords
    startTime := A_TickCount

    if (skill == "random")
    {
        skill := selectRandomSkill()
    }

    ; ToolTip, % "Skill: " skill

    ; 40% chance to open with mouse | 60% chance to open with hotkey (f12)
    Random, rOpenSkillTabMethod, 1, 5
    if (rOpenSkillTabMethod > 3)
    {
        customMouseMove(590, 212)
        customMouseClick()
    } else {
        Send {f12}
    }

    xCoord := % skill "X"
    yCoord := % skill "Y"

    customMouseMove(skillCoords[xCoord], skillCoords[yCoord])

    Random, rSkillHoverSleep, 1000, 2500
    Sleep, rSkillHoverSleep

    Random, rBackToInventMethod, 1, 5
    if (rBackToInventMethod > 3)
    {
        customMouseMove(651, 212)
        customMouseClick()
    } else {
        Send, {f1}
    }

    totalTime := A_TickCount - startTime
    ; ToolTip, % "Total elapsed time: " totalTime

    return totalTime
}

idleQuestCheck() {

}

RandomBezier( X0, Y0, Xf, Yf, O="" ) {
    Time := RegExMatch(O,"i)T(\d+)",M)&&(M1>0)? M1: 200
    RO := InStr(O,"RO",0) , RD := InStr(O,"RD",0)
    N:=!RegExMatch(O,"i)P(\d+)(-(\d+))?",M)||(M1<2)? 2: (M1>19)? 19: M1
    If ((M:=(M3!="")? ((M3<2)? 2: ((M3>19)? 19: M3)): ((M1=="")? 5: ""))!="")
        Random, N, %N%, %M%
    OfT:=RegExMatch(O,"i)OT(-?\d+)",M)? M1: 100, OfB:=RegExMatch(O,"i)OB(-?\d+)",M)? M1: 100
    OfL:=RegExMatch(O,"i)OL(-?\d+)",M)? M1: 100, OfR:=RegExMatch(O,"i)OR(-?\d+)",M)? M1: 100
    MouseGetPos, XM, YM
    If ( RO )
        X0 += XM, Y0 += YM
    If ( RD )
        Xf += XM, Yf += YM
    If ( X0 < Xf )
        sX := X0-OfL, bX := Xf+OfR
    Else
        sX := Xf-OfL, bX := X0+OfR
    If ( Y0 < Yf )
        sY := Y0-OfT, bY := Yf+OfB
    Else
        sY := Yf-OfT, bY := Y0+OfB
    Loop, % (--N)-1 {
        Random, X%A_Index%, %sX%, %bX%
        Random, Y%A_Index%, %sY%, %bY%
    }
    X%N% := Xf, Y%N% := Yf, E := ( I := A_TickCount ) + Time
    While ( A_TickCount < E ) {
        U := 1 - (T := (A_TickCount-I)/Time)
        Loop, % N + 1 + (X := Y := 0) {
            Loop, % Idx := A_Index - (F1 := F2 := F3 := 1)
                F2 *= A_Index, F1 *= A_Index
            Loop, % D := N-Idx
                F3 *= A_Index, F1 *= A_Index+Idx
            M:=(F1/(F2*F3))*((T+0.000001)**Idx)*((U-0.000001)**D), X+=M*X%Idx%, Y+=M*Y%Idx%
        }
        MouseMove, %X%, %Y%, 0
        Sleep, 1
    }
    MouseMove, X%N%, Y%N%, 0
    Return N+1
}

; =========
; HELPERS
; =========

getRandDirection() {
    Random, turnDir, 1, 8
    direction := ""

    switch turnDir
    {
    Case 1:
        direction := "Left"
    Case 2:
        direction := "Right"
    Case 3:
        direction := "Up"
    Case 4:
        direction := "Down"
    Case 5:
        direction := "Left Up"
    Case 6:
        direction := "Left Down"
    Case 7:
        direction := "Right Up"
    Case 8:
        direction := "Right Down"
    }

    return direction
}

selectRandomSkill() {
    Random, rSkillInt, 1, 23
    skillString := ""

    switch, rSkillInt
    {
    case 1:
        skillString := "attack"
    case 2:
        skillString := "strength"
    case 3:
        skillString := "defense"
    case 4:
        skillString := "range"
    case 5:
        skillString := "prayer"
    case 6:
        skillString := "magic"
    case 7:
        skillString := "rcing"
    case 8:
        skillString := "construction"
    case 9:
        skillString := "hp"
    case 10:
        skillString := "agility"
    case 11:
        skillString := "herblore"
    case 12:
        skillString := "thieving"
    case 13:
        skillString := "crafting"
    case 14:
        skillString := "fletching"
    case 15:
        skillString := "slayer"
    case 16:
        skillString := "hunter"
    case 17:
        skillString := "mining"
    case 18:
        skillString := "smithing"
    case 19:
        skillString := "fishing"
    case 20:
        skillString := "cooking"
    case 21:
        skillString := "firemaking"
    case 22:
        skillString := "wcing"
    case 23:
        skillString := "farming"
    }

    return skillString
}