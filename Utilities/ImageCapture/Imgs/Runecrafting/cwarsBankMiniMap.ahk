#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\ImgCap.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

clickCwarsBank() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*112$12.zyw7k1U4VQ1E1MU"

    if (ok:=FindText(X, Y, 2874-150000, 634-150000, 2874+150000, 634+150000, 0, 0, Text))
    {
        FindText.Click(X, Y, "L")
    }

    for i,v in ok
        if (i<=2)
        FindText.MouseTip(ok[i].x, ok[i].y)

}