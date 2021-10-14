#Include, D:\Misc Development\AHKScripts\Thieving\ArdyKnights\jobHandlers.ahk
#Include, D:\Misc Development\AHKScripts\ImageCapture\ImgCap.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

checkCoinPouch() {
    global isCoinPouchFull
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*48$24.0000A600F8U010U0260048z08CUU0kUkT70k100k100k100k0k3k0S0w0D1W0S0N0U071001100310031003100710060U060M0SU"

    if (ok:=FindText(X, Y, 2842-150000, 719-150000, 2842+150000, 719+150000, 0, 0, Text))
    {
        FindText.Click(X, Y, "L")
        return True
    }

}

