#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\Anti-ban.ahk
#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\ImageCapture\ImgCap.ahk

clickPrivateCorpPortal() {
    
    t1:=A_TickCount, X:=Y:=""

    Text:="|<>*162$8.UE4wD3kw087zU"

    if (ok:=FindText(X, Y, 745-150000, 381-150000, 745+150000, 381+150000, 0, 0, Text))
    {
    FindText.Click(X, Y, "L")
    }

    ; ok:=FindText("wait",3, 0,0,0,0,0,0,Text)    ; Wait 3 seconds for appear
    ; ok:=FindText("wait0",-1, 0,0,0,0,0,0,Text)  ; Wait indefinitely for disappear

    ; MsgBox, 4096, Tip, % "Found:`t" Round(ok.Length())
    ; . "`n`nTime:`t" (A_TickCount-t1) " ms"
    ; . "`n`nPos:`t" X ", " Y
    ; . "`n`nResult:`t<" (Comment:=ok[1].id) ">"

    ; for i,v in ok
    ; if (i<=2)
    ; FindText.MouseTip(ok[i].x, ok[i].y)
}