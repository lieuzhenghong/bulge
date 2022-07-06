extends Trigger

signal LoadTriggerResolved

func _init(actor, target):
	type = "LoadTriggerResolved"
	actor = actor
	target = target	
