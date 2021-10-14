#Include, D:\Misc Development\AHKScripts\Thieving\ArdyKnights\jobHandlers.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

equipNewNecklace() {
    global usedNecklaceSeen
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*115$29.zzy3zQTs1wrTbxxizztvRzztqvzzvhrzzzPjzzwMrzzzzjzzzzTzzzzzzzzzzzzzzzrzzDyTzw63zzkCDzzUATzz0Mzzy0Hzzw0jzzs0Tzzk1zzzkDzzzkzzz"

    if (ok:=FindText(X, Y, 1024-150000, 647-150000, 1024+150000, 647+150000, 0, 0, Text))
    {
        FindText.Click(X, Y, "L")
        return True
    }

}