class_name LoadAbility extends Ability

func _init(player):
	self.player = get_node(player)
	
func execute():
	self.player.load()
