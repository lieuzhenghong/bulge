class_name Piles extends Node

export(NodePath) var deck_path
export(NodePath) var hand_path
export(NodePath) var discard_pile_path

onready var deck = get_node(deck_path)
onready var hand = get_node(hand_path)
onready var discard_pile = get_node(discard_pile_path)
onready var globals = "/root/Globals"

func _ready():
	pass

func load_card():
	var loaded = deck.load()
	if loaded == globals.DECKPILE_EMPTY:
		print("out of cards!")
		return
	hand.add(loaded)
	print("Deck:" + deck.str())

func _on_Button_pressed():
	load_card()
