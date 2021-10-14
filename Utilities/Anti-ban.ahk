#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

customMouseMove(endX, endY, speed="fast", xRange=4, yRange=4) {
    Random, fastestMouseSpeed, 75, 110
    Random, fastMouseSpeed, 325, 390
    Random, slowMouseSpeed, 425, 525
    Random, rXDev, -xRange, xRange
    Random, rYDev, -yRange, yRange
    Random, clickDelay, 25, 75

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

    Sleep, clickDelay

    return 
}

idleMouseMovements() {
    Random, preDelay, 50, 325
    Random, loopIterations, 1, 4

    Sleep, preDelay
    Loop, %loopIterations% {
        Random, coordX, 0, 700
        Random, coordY, 0, 500
        Random, loopSleep, 50, 325

        customMouseMove(coordX, coordY, "slow")
        Sleep, loopSleep
    }
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