#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

checkNecklace2() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*60$38.0001z00000U80000E100809z80204zl00U2Q28081C0H020b02k0U/U0g004k0/071Q02k00K01A005U0j001M1rU00a1XU00EzXk00841s00400s00100Q000E0C000403000101k000E0s00040A0000UD008"

    if (ok:=FindText(X, Y, 2685-150000, 967-150000, 2685+150000, 967+150000, 0, 0, Text))
    {
        ; FindText.Click(X, Y, "L")
        return True
    }
}