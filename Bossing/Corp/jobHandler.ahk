#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Bossing\Corp\helpers.ahk
#Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\GlobalLibrary.ahk
; #Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\Anti-ban.ahk
; #Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\QOL.ahk
; #Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\PoHInteractions.ahk
; #Include, D:\Dev\Personal_dev\My_AHK-dev\AHKScripts\Utilities\Global-Coords.ahk

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Relative

MainSequence() {
    ; Wait time until clicking Construction Cape to tele home from Corp cave
    Random, postSpecWait, 1850, 1950
    ; Wait time until clicking the rejuv. pool after tele'ing home with con cape
    Random, postHomeTeleWait, 3950, 4120
    Random, postPoolWait, 3000, 3125
    Random, postJewelryTeleWait, 850, 2250
    Random, postPortalClickWait, 2500, 2500
    
    ; STEP 1 - Click Spec & Wait 'x' MS before teleporting with con cape 
    ClickMMSpec()
    Sleep, postSpecWait

    ; STEP 2 - Shift click construction cape to teleport home  & Wait 'x' MS before clicking pool
    teleTo("home", postHomeTeleWait)

    ; STEP 3 - Click Ornate Rejuvination Pool in PoH & Wait 'X' MS before clicking jewelry box followed by spec
    ClickOrnatePool()
    Sleep, postPoolWait

    ; STEP 4 - Click jewelry box to tele then click mini map spec
    ClickJewelryBoxFromPool()
    ClickMMSpec()

    Sleep, postJewelryTeleWait

    ; ; STEP 5 - Click 
    ; clickPrivateCorpPortal()
    ; Sleep, postPortalClickWait

    customMouseMove(262, 230)
    ; customMouseClick()

    return
}

EmergencyTeleport() {
    teleTo("home")
}