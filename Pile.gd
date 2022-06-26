extends ColorRect

export var contents = [0,0,0,0,0,0,0]

func receive_mana(mana_index):
	assert(mana_index <= self.contents.size())
	if mana_index != -1:
		self.contents[mana_index] += 1

func give_mana(mana_index):
	print(str(mana_index))
	if mana_index == -1:
		return mana_index
	self.contents[mana_index] -= 1
	return mana_index
	
func give_random_mana():
	var valid_draw = false
	var prospective_draw
	
	if self.contents.max() == 0:
		return give_mana(-1)
	
	while not valid_draw:
		prospective_draw = randi() % 6
		assert(prospective_draw >= 0 and prospective_draw < 6)
		if self.contents[prospective_draw] > 0:
			valid_draw = true
			return give_mana(prospective_draw)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
