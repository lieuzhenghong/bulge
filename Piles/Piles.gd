class_name Piles extends Node

<<<<<<< Updated upstream
=======
signal trigger_resolved(type, actor, target)

>>>>>>> Stashed changes
export(NodePath) var deck_path
export(NodePath) var hand_path
export(NodePath) var discard_pile_path

onready var deck = get_node(deck_path)
onready var hand = get_node(hand_path)
onready var discard_pile = get_node(discard_pile_path)
onready var globals = "/root/Globals"

func _ready():
<<<<<<< Updated upstream
	pass
=======
	Stack.connect("trigger_popped", self, "_on_Trigger_popped")
>>>>>>> Stashed changes

func load_card():
	var loaded = deck.load()
	if loaded == globals.DECKPILE_EMPTY:
		print("out of cards!")
		return
	hand.add(loaded)
	print("Deck:" + deck.str())

<<<<<<< Updated upstream
func _on_Button_pressed():
	load_card()
=======
func _on_Trigger_popped(type, actor, target):
	print("Trigger of type %s from actor %s targeting %s popped!" % 
	[type, actor, target])
	if type == "Load" and target == relevant_player:
		var loaded = load_card()
		if loaded != Globals.DECKPILE_EMPTY:
			emit_signal("trigger_resolved", "load", relevant_player, relevant_player)
>>>>>>> Stashed changes
