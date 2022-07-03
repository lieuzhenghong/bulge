extends "res://Pile.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.contents = [0,0,0,0,0,0]
	$GridContainer/RedManaButton.color = Color(1, 0, 0, 1)
	$GridContainer/WhiteManaButton.color = Color(0.95, 0.95, 0.95, 1)
	$GridContainer/GreenManaButton.color = Color(0, 1, 0, 1)
	$GridContainer/BlackManaButton.color = Color(0, 0, 0, 1)
	$GridContainer/BlueManaButton.color = Color(0, 0, 1, 1)
	$GridContainer/PurpleManaButton.color = Color(0.4, 0, 0.6, 1)

# TODO obviously dirty as hell, don't hardcode these values
func _process(_delta):
	$GridContainer/RedManaButton.mana_value = self.contents[0]
	$GridContainer/WhiteManaButton.mana_value = self.contents[1]
	$GridContainer/GreenManaButton.mana_value = self.contents[2]
	$GridContainer/BlackManaButton.mana_value = self.contents[3]
	$GridContainer/BlueManaButton.mana_value = self.contents[4]
	$GridContainer/PurpleManaButton.mana_value = self.contents[5]
	
