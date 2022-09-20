#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

global inputtedPass

; getLoginInfo()

getLoginInfo() {
    global inputtedPass
    InputBox, passVar,Pass, Please enter your password
    inputtedPass := passVar
    MsgBox, % "Your pass: " inputtedPass
}

checkIfLoggedOut() {
    global inputtedPass

    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*116$101.zzzzzzzzzzzzzzzzzzzzzzzrzzzzzzzzzzzzzzzz7zw0Tzzzzzzzzzzzy3z003zzzzzzzzzzzs00001zzzzwTzzzzzU00001zzzz1zzzzzzU00007zzzkxzzzzzzU0000DDzyD3zzzzzzU07z0wTzxU7zzzzzzk7zzkbzzw0DzzzzzzzzzzsFzzs0Tzzzzzzzzzzz3zzk0zzzzzzzzxzzkPzzs1zzzzzzzznzz0zzzk7zzzzzzzzrzy03zzlzzzzzzzzzzzy03zzzzzzzzzzzzzzw03zzzzzzzzzzzzzzzU3zzzzzzzzzzzzzzzFzzzzzzzzzzzzzzjs1zzzzzzzzzzzzzzDk1zzzzzzzzzzzzzwDU3zzzzzzzzzzzzzkD07zzzzzzzzzzzzzUS0Tzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzwzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzz1zzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzy0DzzzzzDzzzzzzzzy0TzzzzyTzzzzzzzjs0Tzzzzyzzzzzzzzzk0zzzzzxzzzzzzzzzk0zzzzzvzzzzzzzzzU1zzzzzbzzzzzzzzz03zzzzzDzzzzzzzzz3bzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzztzTzzzzzzzzzzzzzznwT3zzzzzzzzzzzzzrs03zzzzzzzzzzzzzjU07zzzzzzzzzzzzyS007zzzzzzzzzzzzww007zzzzzzzzzzzzxw00Dzzzzzzzzzzzzzw07zzzzzzzzzzzzzrz7zzzzzzzzzzzzzzDzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzxzzzzzzzzzzzzzzzzvzzzzzzzzzzzzzzzzrzzzzzzzzzzzzzzzzjzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzkzzzzzzzzzzzzzzzzVzzzzzzzz"

    if (ok:=FindText(X, Y, 1626-150000, 208-150000, 1626+150000, 208+150000, 0, 0, Text))
    {
        Random, rNumTimesToEsc, 3, 4
        Loop, %rNumTimesToEsc% {
            Send, {Esc}
        }

        Random, rDelay1, 13, 67
        Sleep, rDelay1

        customMouseMove(465, 316, "fast", 20, 8)
        customMouseClick()

        ; DELAY
        Random, rDelay2, 13, 67
        Sleep, rDelay2

        Send, %inputtedPass%

        ; Delay
        Send, {Enter}

        ; Sleep for as long as login takes (~10 seconds)
        Random, rLoginSleep, 10000, 12023
        Sleep, rLoginSleep

        ; click through welcome screen
        customMouseMove(394, 362, "fast", 39, 23)
        customMouseClick()

        return True
    }
    else
    {
        return False
    }

}