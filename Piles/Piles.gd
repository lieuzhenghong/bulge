class_name Piles extends Node

signal load_successful(type, actor, target)

export(NodePath) var deck_path
export(NodePath) var hand_path
export(NodePath) var discard_pile_path
export(int) var relevant_player

onready var deck = get_node(deck_path)
onready var hand = get_node(hand_path)
onready var discard_pile = get_node(discard_pile_path)

func _ready():
	Stack.connect("trigger_resolved", self, "_on_Trigger_resolved")

func load_card():
	print(deck)
	var loaded = deck.load()
	print(loaded)
	print(Globals.DECKPILE_EMPTY)
	if loaded == Globals.DECKPILE_EMPTY:
		print("out of cards!")
		return loaded
	hand.add(loaded)
	return loaded
	
static func sum(array):
	var array_sum = 0
	for i in range(array.size()):
		array_sum += array[i]
	return array_sum	

func _on_Trigger_resolved(type, actor, target):
	print("Trigger of type %s from actor %s targeting %s resolved!" % 
	[type, actor, target])
	if type == "Load" and target == relevant_player:
		var loaded = load_card()
		if loaded != Globals.DECKPILE_EMPTY:
			emit_signal("load_successful", relevant_player, relevant_player)
