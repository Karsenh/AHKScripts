#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

checkHP() {
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*76$36.DzzzjzTzzzTzU000TwDzzzzsTzzzzsM000TsM000TsM000TsM000Tws11UTwM2G8Tys0E8Tzk11U7zs0G8Dzk0G83zk0E83zk1Vk1zk0000zk0000Ts00007zzzzztzzzzzyTzzzzz0Tzz0D03zz0TU"

    if (ok:=FindText(X, Y, 2594-150000, 620-150000, 2594+150000, 620+150000, 0, 0, Text))
    {
        ; FindText.Click(X, Y, "L")
        eatFood() 
    }
}