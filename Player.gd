class_name Player extends Node

export(NodePath) var piles_path
onready var piles = get_node(piles_path)
signal turn_action_request_ended(action_chosen)
signal turn_action_made()
signal load_action_ended()


var turn_action = null setget set_turn_action

func load():
	piles.load_card()
	
func set_turn_action(new_value):
	print("Turn action set to new value: %s" % new_value)
	turn_action = new_value
	emit_signal("turn_action_made")
	
func _on_turn_action_request_started(player):
	print("waiting for turn action")
	if player != self:
		return
	yield(self, "turn_action_made")
	print("Turn action made. Emitting turn action request ended signal.")
	emit_signal("turn_action_request_ended", self.turn_action)

func _on_load_action_started(player):
	if player != self:
		return
	piles.load_card()
	print("Load action complete. Emitting load action ended signal.")
	emit_signal("load_action_ended")
