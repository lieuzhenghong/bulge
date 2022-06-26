extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	draw_initial_hand()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# This needs to be refactored
func draw_initial_hand():
	for _i in range(7):
		print("Drawing card...")
		# FIXME Deck.give_card() can return -1
		# TODO refactor this into more general give_card and take_card functions
		$Hand.contents[$Deck.give_card()] += 1
