extends ColorRect

export var mana_value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = str(mana_value)
	
func _process(_delta):
	$Label.text = str(mana_value)
