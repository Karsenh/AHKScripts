#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

CheckForFullInventoryOfLogs() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*61$71.E0003k0E0002E000zU0E000wT00Ty00T00TsS07y000S07y021z000021z002Dk00002Dk003w000003w0003U000003U000000000000000000000000000000000000000000000000000000C0000Q0000Dzzz0Tzzw000zzzz7zzzzzUDzzzzzzzzzzktzzzzbzzzzzzjzzzyzzzzzzzDzzzwzzzzzzy3zzzcDzzzzzw3zwzEDXzzzzs7zly0T7zs3zk7z7w0SDzX7zU7yTw0Tzz7zz0/wTs007z"

    if (ok:=FindText(X, Y, 1853-150000, 1209-150000, 1853+150000, 1209+150000, 0, 0, Text))
    {
        ; FindText.Click(X, Y, "L")
        return true
    } else {
        return false
    }

}