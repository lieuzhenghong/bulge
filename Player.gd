extends VSplitContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	draw_initial_hand()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# This needs to be refactored
func draw_initial_hand():
	for _i in range(7):
		print("Drawing card...")
		$HandArea/Hand.receive_mana($HandArea/Deck.give_random_mana())

func load_mana():
	$HandArea/Hand.receive_mana($HandArea/Deck.give_random_mana())

func surface():
	var discard_pile_is_empty = false
	while not discard_pile_is_empty:
		var mana_index = $HandArea/DiscardPile.give_random_mana()
		$HandArea/Deck.receive_mana(mana_index)
		if mana_index == -1:
			discard_pile_is_empty = true
