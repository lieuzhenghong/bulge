extends Trigger

signal LoadTriggerResolved

func _init(actor, target):
	type = "LoadTriggerResolved"
	actor = null
	target = target	
