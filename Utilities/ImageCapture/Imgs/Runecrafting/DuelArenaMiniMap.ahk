#Include, D:\Misc Development\AHKScripts\Utilities\ImageCapture\ImgCap.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

clickDuelArenaMinimap() {
    Random, altarClickDelay, 5325, 5525
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*138$24.0000AU00AU00hU00zU00z380AH80APM0ATs0Ajk0AX00hX00zX00z000A000A000A0000000000000000000U"

    if (ok:=FindText(X, Y, 1233-150000, 758-150000, 1233+150000, 758+150000, 0, 0, Text))
    {
        FindText.Click(X - 16, Y - 85, "L")
    } else {
        MsgBox, "Can't find image!"
    }

}

