extends "res://Piles/DeckPile.gd"

static func sum(array):
	var array_sum = 0
	for i in range(array.size()):
		array_sum += array[i]
	return array_sum

func _process(_delta):
	$ActivePlayerDeckPileLabel.text = str(sum(contents))
