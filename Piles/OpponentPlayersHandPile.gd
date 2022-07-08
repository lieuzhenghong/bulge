extends "res://Piles/HandPile.gd"

export(NodePath) var pile_label_path
onready var label = get_node(pile_label_path)

func str():
	return PoolStringArray(contents).join("")
	
func _process(_delta):
	label.text = str(.hsize())
