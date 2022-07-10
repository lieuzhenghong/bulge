class_name SeekAbility extends Ability

func _init(player, target):
	self.player = get_node(player)
	self.target = get_node(target)
	
func execute():
	var card = self.player.discard()
	emit_signal("SeekRequest", card)
	var cards = yield(Game, "SeekResponseConfirmed")
	for targetCard in cards:
		self.target.discard(targetCard)
