#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\ImageCapture\ImgCap.ahk
#SingleInstance, Force

clickAgilityMinimap() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*92$13.A68kcMAzIqsD83U0w0n4n6H2k2A6E"

    controlVar := False
    tries := 0

    While, controlVar == False {
        if (ok:=FindText(X, Y, 1007-150000, 1162-150000, 1007+150000, 1162+150000, 0, 0, Text))
        {
            FindText.Click(X, Y, "L")

            controlVar := True
        } else {
            tries += 1
        }
        if (tries > 10) {
            controlVar := True
        }
    }

}

