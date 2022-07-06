class_name Piles extends Node

export(NodePath) var deck_path
export(NodePath) var hand_path
export(NodePath) var discard_pile_path

onready var deck = get_node(deck_path)
onready var hand = get_node(hand_path)
onready var discard_pile = get_node(discard_pile_path)
onready var globals = get_node("/root/Globals")

func _ready():
	pass

func load_card():
	var loaded = deck.load()
	print(loaded)
	print(globals.DECKPILE_EMPTY)
	if loaded == globals.DECKPILE_EMPTY:
		print("out of cards!")
		return
	hand.add(loaded)
	
static func sum(array):
	var array_sum = 0
	for i in range(array.size()):
		array_sum += array[i]
	return array_sum	

func _on_LoadButton_pressed():
	load_card()
