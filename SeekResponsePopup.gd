extends ColorRect

var colours = [null, null]

func _ready():
	$"../ActivePlayerPiles/VBoxContainer/HandPile/RedManaButton/Button".connect(
		"pressed", 
		self, 
		"_on_RedManaButton_pressed"
	)
	$"../ActivePlayerPiles/VBoxContainer/HandPile/WhiteManaButton/Button".connect(
		"pressed", 
		self, 
		"_on_WhiteManaButton_pressed"
	)
	
func add_colour(colour, RGBColour):
	if colours[0] == null:
		pass
	else:
		colours[1] = colours[0]
		$SeekResponseColour2.color = $SeekResponseColour1.color
	colours[0] = colour
	$SeekResponseColour1.color = RGBColour
		

func _on_RedManaButton_pressed():
	print("Red mana button pressed!")
	add_colour(Globals.COLOURS.RED, Color(1,0,0,1))

func _on_WhiteManaButton_pressed():
	print("White mana button pressed!")
	add_colour(Globals.COLOURS.WHITE, Color(1,1,1,1))

func _on_SeekResponseResetButton_pressed():
	colours = [null, null]
	$SeekResponseColour1.color = Color(0.5, 0.5, 0.5, 1)
	$SeekResponseColour2.color = Color(0.5, 0.5, 0.5, 1)
