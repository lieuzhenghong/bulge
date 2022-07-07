extends Helpers

onready var globals = "/root/Globals"

var contents = [0,0,0,0,0,0]
export(NodePath) var pile_label_path
onready var label = get_node(pile_label_path)

func add(card_type):
	assert(card_type <= contents.size())
	contents[card_type] += 1

# FIXME don't hardcode the label
func _process(_delta):
	label.text = str(sum(contents))
