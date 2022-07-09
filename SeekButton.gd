extends Button

signal confirmed
var seek_colour = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$SeekPopup.hide()
	$"../../ActivePlayerPiles/VBoxContainer/HandPile/RedManaButton/Button".connect(
		"pressed", 
		self, 
		"_on_RedManaButton_pressed"
	)
	
	
func _on_SeekButton_pressed():
	if $SeekPopup.visible:
		$SeekPopup.hide()
	else:
		$SeekPopup.show()

func _on_RedManaButton_pressed():
	print("Red mana button pressed!")
	$SeekPopup/SeekColour.color = Color(1, 0, 0, 1)
	seek_colour = Globals.COLOURS.RED
	


func _on_ConfirmButton_pressed():
	emit_signal("confirmed", seek_colour)
