#Include, %A_LineFile%\..\..\..\..\Anti-ban.ahk
#Include, %A_LineFile%\..\..\..\ImgCap.ahk

clickDuelArenaMinimap() {
    Random, ruinsClickDelay, 4900, 4800
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*138$24.0000AU00AU00hU00zU00z380AH80APM0ATs0Ajk0AX00hX00zX00z000A000A000A0000000000000000000U"

    controlVar := False
    numTries := 0

    While, controlVar == False {
        if (ok:=FindText(X, Y, 1233-150000, 758-150000, 1233+150000, 758+150000, 0, 0, Text))
        {
            FindText.Click(X - 16, Y - 85, "L")
            offsetTime := idleMouseMovements()
            Sleep, ruinsClickDelay - offsetTime 
            controlVar := True
        } else {
            ; MsgBox, "Can't find image!"
            numTries += 1
        }
        if (numTries > 1000) {
            controlVar := True
        }
    }

}

