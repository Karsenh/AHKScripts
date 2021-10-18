#Include, ..\..\ImgCap.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

clickAltarImg() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*139$17.1zE3zUTznzzrzzjzzU"

    if (ok:=FindText(X, Y, 2522-150000, 402-150000, 2522+150000, 402+150000, 0, 0, Text))
    {
        FindText.Click(X, Y, "L")
    } else {
        Text:="|<>*123$15.1w0zwTzrzzzzzzzzwzzXTssTbU"

        if (ok:=FindText(X, Y, 2715-150000, 444-150000, 2715+150000, 444+150000, 0, 0, Text))
        {
            FindText.Click(X, Y, "L")
        } else {
            Text:="|<>*125$18.01U0zk1zwDzyTzyTzyTzzTzDLzB3zDU"
            if (ok:=FindText(X, Y, 2711-150000, 442-150000, 2711+150000, 442+150000, 0, 0, Text))
            {
                FindText.Click(X, Y, "L")
            } else {

                Text:="|<>*128$18.1z03zkDzsTzwzzwzzyTzyzyTDyT3y+U"
                if (ok:=FindText(X, Y, 2716-150000, 444-150000, 2716+150000, 444+150000, 0, 0, Text))
                {
                    FindText.Click(X, Y, "L")
                } else {
                    MsgBox, "Image not found!"
                }
            }
        }

    } 

    ; ok:=FindText("wait",3, 0,0,0,0,0,0,Text)    ; Wait 3 seconds for appear
    ; ok:=FindText("wait0",-1, 0,0,0,0,0,0,Text)  ; Wait indefinitely for disappear

    ; MsgBox, 4096, Tip, % "Found:`t" Round(ok.Length())
    ; . "`n`nTime:`t" (A_TickCount-t1) " ms"
    ; . "`n`nPos:`t" X ", " Y
    ; . "`n`nResult:`t<" (Comment:=ok[1].id) ">"

    ; for i,v in ok
    ;     if (i<=2)
    ;     FindText.MouseTip(ok[i].x, ok[i].y)

}