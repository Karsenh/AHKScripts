#Include, %A_LineFile%\..\..\..\..\Anti-ban.ahk
#Include, %A_LineFile%\..\..\..\ImgCap.ahk
; #Include, ..\..\..\Anti-ban.ahk
; #Include, ..\..\ImgCap.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

clickCwarsBankIcon() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*112$12.zyw7k1U4VQ1E1MU"

    controlVar := False
    numTries := 0

    While, controlVar == False {
        ToolTip
        if (ok:=FindText(X, Y, 2874-150000, 634-150000, 2874+150000, 634+150000, 0, 0, Text))
        {
            Random, clickBankChestDelay, 3400, 3500
            FindText.Click(X, Y, "L")
            offsetTime := idleMouseMovements()
            Sleep, clickBankChestDelay-offsetTime
            controlVar := True
        }
        else {
            numTries += 1
        }
        if (numTries > 1000) {
            controlVar := True

        }
    }
}