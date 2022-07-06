extends "res://Piles/HandPile.gd"

func str():
	return PoolStringArray(contents).join("")
	
func _process(_delta):
	$ActivePlayerHandPileLabel.text = str(contents)
