extends Node

signal trigger_resolved(type, actor, target)

var stack = []

func push(trigger: Trigger):
	stack.append(trigger)
	
func pop():
	var trigger = stack.pop_back()
	if trigger == null:
		pass
	else:
		emit_signal("trigger_resolved", 
			trigger.type,
			trigger.actor,
			trigger.target
		)
