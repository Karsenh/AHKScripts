#Include, D:\Misc Development\AHKScripts\Thieving\ArdyKnights\jobHandlers.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

checkNecklace() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*112$35.zzzy1zz7zs1zxrzbxzvjzTtzvTzztzszzzvzxzzzzzvzzzzzrrzzzzzjzzzzzTzzzzzzzzzzzzzzzzzzrzzzDyTzzw63zzzkA7zzzU8Tzzz00zzzy0Hzzzw0jzzzs0Tzzzk1zzzzk7zzzzkzzz"

    if (ok:=FindText(X, Y, 2682-150000, 967-150000, 2682+150000, 967+150000, 0, 0, Text))
    {
        ; FindText.Click(X, Y, "L")
        return True
    }

}