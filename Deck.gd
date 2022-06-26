extends "res://Pile.gd"
# Called when the node enters the scene tree for the first time.
func _ready():
	self.contents = [3,3,3,3,3,3]

func _process(delta):
	var sum = 0
	for i in range(self.contents.size()):
		sum += self.contents[i] 
	$Label.text = str(sum)

func give_card():
	var valid_draw = false
	var prospective_draw
	# FIXME check if deck is empty otherwise we're stuck in an infinite loop here
	
	if self.contents.max() == 0:
		return -1
	
	while not valid_draw:
		prospective_draw = randi() % 6
		assert(prospective_draw >= 0 and prospective_draw < 6)
		if self.contents[prospective_draw] > 0:
			valid_draw = true
			break
		else:
			pass
	
	self.contents[prospective_draw] -= 1
	return prospective_draw

