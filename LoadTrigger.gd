extends "Trigger.gd"

signal load_resolved

func resolve():
	var mana = $HandArea/Hand.receive_mana($HandArea/Deck.give_random_mana())
	if mana == -1:
		return
	emit_signal("load_resolved", get_parent().name)
