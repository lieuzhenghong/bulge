class_name ActionA
var actor
var target
	
func _init(actor, target=null):
	self.actor = actor
	self.target = self.actor if target == null else target
	print("Action constructor called")
	print(target)
	print(self.target)
