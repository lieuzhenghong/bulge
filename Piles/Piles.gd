class_name Piles extends Node

signal trigger_resolved(type, actor, target)

export(NodePath) var deck_path
export(NodePath) var hand_path
export(NodePath) var discard_pile_path
export(int) var relevant_player

onready var deck = get_node(deck_path)
onready var hand = get_node(hand_path)
onready var discard_pile = get_node(discard_pile_path)

func _ready():
	var _error = Stack.connect("trigger_popped", self, "_on_Trigger_popped")

func load_card():
	var card = deck.give()
	if card == null:
		print("Out of cards")
	else:
		hand.add(card)
	
static func sum(array):
	var array_sum = 0
	for i in range(array.size()):
		array_sum += array[i]
	return array_sum	

func _on_Trigger_popped(type, actor, target):
	print("Trigger of type %s from actor %s targeting %s resolved!" % 
	[type, actor, target])
	if type == "Load" and target == relevant_player:
		var loaded = load_card()
		if loaded != Globals.DECKPILE_EMPTY:
			emit_signal("trigger_resolved", "Load", relevant_player, relevant_player)
