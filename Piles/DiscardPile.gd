extends Pile
export(NodePath) var pile_label_path
onready var label = get_node(pile_label_path)

# FIXME don't hardcode the label
func _process(_delta):
	label.text = str(.hsize())
