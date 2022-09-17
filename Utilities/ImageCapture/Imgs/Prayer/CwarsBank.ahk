#Include, %A_LineFile%\..\..\..\..\Anti-ban.ahk
#Include, %A_LineFile%\..\..\..\ImgCap.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

clickCwarsBankDuringPrayer() {

    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*125$11.w7U20I/UI0g0A0c1I2c3E"

    controlVar := False
    numTries := 0

    While, controlVar == False {
        ToolTip
        if (ok:=FindText(X, Y, 925-150000, 150-150000, 925+150000, 150+150000, 0, 0, Text))
        {
            Random, clickBankChestDelay, 4223, 4309
            FindText.Click(X, Y + 4, "L")
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