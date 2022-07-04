extends Node

onready var globals = "/root/Globals"

var contents = [3,3,3,3,3,3]

func load():
	var i = 0
	while contents[i] <= 0:
		if i >= contents.size():
			return globals.DECKPILE_EMPTY
		i += 1
	return i
	
func str():
	return PoolStringArray(contents).join("")
