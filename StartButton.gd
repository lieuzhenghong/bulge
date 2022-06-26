extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called when StartButton is pressed
func _on_StartButton_pressed():
	get_tree().change_scene("res://Main.tscn")
