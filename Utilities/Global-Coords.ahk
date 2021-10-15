#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

; Skills coords
skillsCoords := Object()

; Equipment coords
equipmentCoords := Object("ringSlotX", 708, "ringSlotY", 413)

; Prayer coords
prayerCoords := Object()

; Inventory coords (from left to right, top to bottom)
inventoryCoords := Object("slot1X", 590, "slot1Y", 255, "slot2X", 630, "slot2Y", 255, "slot3X", 675, "slot3Y", 255, "slot4X", 715, "slot4Y", 253, "slot5X", 589, "slot5Y", 293, "slot8X", 714, "slot8Y", 290, "slot9X", 588, "slot9Y", 327)

; Spells (Magic tab)
standardSpellCoords := Object("highAlchX", 725, "highAlchY", 307, "seersTpX", 675, "seersTpY", 305)
lunarSpellCoords := Object()
ancientSpellCoords := Object()

; Agility Course
seersAgilityCoords := Object("seers1X", 265, "seers1Y", 190, "seers2X", 164, "seers2Y", 180, "seers3X", 200 , "seers3Y", 266, "seers4X", 304, "seers4Y", 238, "seers5X", 125, "seers5Y", 226, "seers6X", 279, "seers6Y", 229)

interfaceCoords := Object("compassX", 565, "compassY", 46)