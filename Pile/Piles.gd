extends Node

onready var globals = $Globals

func load_card():
	var loaded = $DeckPile.load()
	if loaded == globals.DECKPILE_EMPTY:
		print("out of cards!")
		return
	$HandPile.add(loaded)
	print("Deck:" + $DeckPile.str())


func _on_Button_pressed():
	load_card()
