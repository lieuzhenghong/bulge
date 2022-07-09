class_name SeekTrigger extends Trigger

func _init(actor, target, colour):
	self.type = "Seek"
	self.actor = actor
	self.target = target
	self.data = { colour: colour }
