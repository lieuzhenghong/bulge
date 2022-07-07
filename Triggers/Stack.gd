extends Node

signal trigger_popped(type, actor, target)

var stack = []

func push(trigger: Trigger):
	stack.append(trigger)
	
func pop():
	var trigger = stack.pop_back()
	if trigger == null:
		pass
	else:
		emit_signal("trigger_popped", 
			trigger.type,
			trigger.actor,
			trigger.target
		)
		
func class_in_stack(Class):
	for item in stack:
		if item is Class:
			return true
	return false
