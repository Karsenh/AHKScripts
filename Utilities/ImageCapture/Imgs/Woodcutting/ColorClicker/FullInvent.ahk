#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

isInventoryFull() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*140$141.0000002000000000000000080000000000000000000000100000000000000000000000E0000000000000000000000028000000000000000000000EF000000000E000001000002280000000020000008000A0E+0000U0000E0002010002E20UsWI0gF75XXWYE1sCC70EWE48YH0aG94mEWMW2E129424G0V4WE4W+8YG4G4EFk8F8UsWE48YG0YFFsWEWEW21129424G0V4WE4W484G4G3kE88F8UEWE473W0YEUwWAQE22S0lks23W00000000000000E000000E000000000000000200000020000000000000004U000000U000000000000000M000000000zzzzzzzzzzzzzzzzzzzzzzzw"

    if (ok:=FindText(X, Y, 1258-150000, 1046-150000, 1258+150000, 1046+150000, 0, 0, Text))
    {
        ; FindText.Click(X, Y, "L")
        return true
    } else {
        return false
    }

}