#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

IsInventFull() {
    ; #Include <FindText>

    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*70$121.zznbzk3F227zk36k07zkTztrz01U007z01XU07z0Dzzo000m004000kk04007zzy000Q002000QQ02003zzD000S001000SAU1001zzbU00C000U00CNU0U00zznk007000E007FU0E00Tzxs00Dk00s00Dkk0s00DznU000600U000600U007zzk0k00U0k0k00U0k0k3zzM0000M0M0000S1s001zzs2000A882000A08200zzw000068I000060A000Try00003020000302000Dzz00007U100007U10007zzU000DU0U000DVUU003zzwE00Tk0gE00TkWAE01zxzs03zkE3s03zk23s03zyzw0Dw0E0w0DwM30w0DzzzV0zU00030zs61010zzzzkFy00000Fy00U00FyCzzk7s40M007s000007s3zzkVk000001k0000U1k1vxk00000000800000000xzs00000002800000010TTsU000000000E00U000Dbz01000020QE8000E007uTkTsk01zzzE0000E00Dzvxzzzw7zzzs00000007zzzzzzzbzzzyVM21W1UDzzzzzzzzzzzzbzzzzzwzzznzzzzzzzzzzzzzzzzzzzszzzzrzzzzTzzzzzzxzzsTzzzzzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzzzzzj7zzzwzzzznzzzzzzzbsDnzzzkDw3z1zzzzzzzkE7tzs3k7w0z0zsz0w1zs03wzk1s3y0T0Tkz6AMzw1zyTk0C3zEjUDsTXaDzy30yDk01UzU7U7wDnnDzz00DjkEEMTmHU3z7ttbzzU4HrsQQADs1k1y2Qwn3zk29vs447Dw0w0z1SSNtzs00Rw003ryAS0TUb7AQzw11Sy000vzdS0DUE3D0Ty2FST000Rzriw7k00DkDz0rDDUU0CzxjHPsDnzzzzU4D7kE47Ty4tns01zzzzk7z3w467js28Fw007zzzszy1y1y3bk0U1w001Y0zwY"

    if (ok:=FindText(X, Y, 2210-150000, 1214-150000, 2210+150000, 1214+150000, 0, 0, Text))
    {
        return True
    }
    return False

}