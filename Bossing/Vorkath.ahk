#Include, D:\Misc Development\AHKScripts\Utilities\Anti-ban.ahk
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

inventoryCoords := ["slot1X", 0, "slot1Y", 0]

NumpadEnter::
    MouseGetPos, X, Y
    ToolTip, % "X: " X " " "Y: " Y
return

Numpad0::
    global inventoryCoords

    MouseGetPos, X, Y

    inventoryCoords["slot1X"] := X
    inventoryCoords["slot1Y"] := Y

return

1::
    ; Open inventory
    Send, {F1}
    ; MouseMove to slayer staff
    customMouseMove(inventoryCoords["slot1X"], inventoryCoords["slot1Y"], "fast")
    ; Equip slayer staff
    MouseClick, Left

return