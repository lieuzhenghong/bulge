extends "res://Piles/HandPile.gd"
	
func _process(_delta):
	$RedManaButton.mana_value = count(Globals.COLOURS.RED)
	$WhiteManaButton.mana_value = count(Globals.COLOURS.WHITE)
	$GreenManaButton.mana_value = count(Globals.COLOURS.GREEN)
	$BlackManaButton.mana_value = count(Globals.COLOURS.BLACK)
	$BlueManaButton.mana_value = count(Globals.COLOURS.BLUE)
	$PurpleManaButton.mana_value = count(Globals.COLOURS.PURPLE)
