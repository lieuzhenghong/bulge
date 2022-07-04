extends Node

onready var globals = $Globals

var contents = [6,6,0,0,0,0]

func load():
	var i = 0
	while contents[i] <= 0:
		if i >= contents.size():
			return globals.DECKPILE_EMPTY
		i += 1
	return i
	
func str():
	return PoolStringArray(contents).join("")
