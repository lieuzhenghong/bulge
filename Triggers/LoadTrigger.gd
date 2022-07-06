class_name LoadTrigger extends Trigger

signal LoadTriggerResolved

func _init(actor, target):
	self.type = "Load"
	self.actor = actor
	self.target = target
