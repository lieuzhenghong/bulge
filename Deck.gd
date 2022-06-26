extends "res://Pile.gd"
# Called when the node enters the scene tree for the first time.
func _ready():
	self.contents = [3,3,3,3,3,3]

func _process(_delta):
	var sum = 0
	for i in range(self.contents.size()):
		sum += self.contents[i] 
	$Label.text = str(sum)

