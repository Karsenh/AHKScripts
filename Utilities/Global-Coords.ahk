#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

; Skills coords
skillsCoords := Object()

; Equipment coords
equipmentCoords := Object()

; Prayer coords
prayerCoords := Object()

; Inventory coords (from left to right, top to bottom)
inventoryCoords := Object("spot1X", 590, "spot1Y", 255, "spot2X", 630, "spot2Y", 255, "spot3X", 675, "spot3Y", 255, "spot4X", 715, "spot4Y", 253, "spot8X", 714, "spot8Y", 290)

; Spells (Magic tab)
standardSpellCoords := Object("highAlchX", 725, "highAlchY", 307, "seersTpX", 675, "seersTpY", 305)
lunarSpellCoords := Object()
ancientSpellCoords := Object()

; Agility Course
seersAgilityCoords := Object("seers1X", 265, "seers1Y", 190, "seers2X", 164, "seers2Y", 180, "seers3X", 200 , "seers3Y", 266, "seers4X", 304, "seers4Y", 238, "seers5X", 125, "seers5Y", 226, "seers6X", 279, "seers6Y", 229)

interfaceCoords := Object("compassX", 565, "compassY", 46)