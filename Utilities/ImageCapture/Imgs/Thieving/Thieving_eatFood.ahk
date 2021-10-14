#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

eatFood() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*45$33.00Tbs01w3yk7k0C91000NA4000bUE003w1U00D04001s0E00701000s0400700U00s0400300E00Q04001U0U00A04001U1000A081y1U11zwA0Fz0lU4z01A0bU07U9k00M1Q0004"

    if (ok:=FindText(X, Y, 2644-150000, 895-150000, 2644+150000, 895+150000, 0, 0, Text))
    {
        FindText.Click(X, Y, "L")
    }
}