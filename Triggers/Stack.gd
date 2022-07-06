class_name Stack extends Node

var triggers = []

func push(trigger: Trigger):
	triggers.append(trigger)
	
func pop():
	var trigger = triggers.pop_back()
	

