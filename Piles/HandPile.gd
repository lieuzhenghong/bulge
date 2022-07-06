extends Helpers

onready var globals = "/root/Globals"

var contents = [0,0,0,0,0,0]

func add(card_type):
	assert(card_type <= contents.size())
	contents[card_type] += 1
