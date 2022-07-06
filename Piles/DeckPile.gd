extends Helpers

onready var globals = "/root/Globals"

var contents = [3,3,3,3,3,3]

func load():
	var i = 0
	while contents[i] <= 0:
		if i >= contents.size():
			return globals.DECKPILE_EMPTY
		i += 1
	return i
	
func add(card_type):
	assert(card_type <= contents.size())
	contents[card_type] += 1

# FIXME don't hardcode the label
func _process(_delta):
	$ActivePlayerDeckPileLabel.text = str(sum(contents))
