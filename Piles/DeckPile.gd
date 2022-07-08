extends Pile

onready var globals = "/root/Globals"
export(NodePath) var pile_label_path
onready var label = get_node(pile_label_path)

func _init():
	contents = [
		Mana.new(Globals.COLOURS.RED),
		Mana.new(Globals.COLOURS.RED),
		Mana.new(Globals.COLOURS.RED),
		Mana.new(Globals.COLOURS.WHITE),
		Mana.new(Globals.COLOURS.WHITE),
		Mana.new(Globals.COLOURS.WHITE),
		Mana.new(Globals.COLOURS.GREEN),
		Mana.new(Globals.COLOURS.GREEN),
		Mana.new(Globals.COLOURS.GREEN),
		Mana.new(Globals.COLOURS.BLACK),
		Mana.new(Globals.COLOURS.BLACK),
		Mana.new(Globals.COLOURS.BLACK),
		Mana.new(Globals.COLOURS.BLUE),
		Mana.new(Globals.COLOURS.BLUE),
		Mana.new(Globals.COLOURS.BLUE),
		Mana.new(Globals.COLOURS.PURPLE),
		Mana.new(Globals.COLOURS.PURPLE),
		Mana.new(Globals.COLOURS.PURPLE)
	]
	contents.shuffle()

# FIXME don't hardcode the label
func _process(_delta):
	label.text = str(.hsize())
