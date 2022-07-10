extends Node

var turn = 0

var phases = [
	"P1Start",
	"P1Main",
	"P1End",
	"P2Start",
	"P2Main",
	"P2End",
	"GameEnd",
]

var action_counts = [0, 0]

var current_phase = phases[0]

export(NodePath) var active_player
export(NodePath) var opponent_player

signal SeekResponseConfirmed

func _ready():
	$ActivePlayer/GridContainer/SeekButton.connect("confirmed", self, "_on_seekConfirmButtonPressed")

func _on_LoadButton_pressed():
	if current_phase != "P1Main" or action_counts[0] > 0:
		pass
	else:
		$ActivePlayer/ActivePlayerPiles.load_card()
		action_counts[Globals.PLAYER_ONE_ID] += 1
		change_phase("P1End")
		
func _on_seekConfirmButtonPressed(colour):
	# Is this the only check? Do we not have to check if 
	# the player is seeking with valid colours?
	if current_phase != "P1Main" or action_counts[0] > 0:
		pass
	else:
		var card = active_player.discard()
		#emit_signal("SeekResponseRequested", card)
		# var cards = yield(self, "SeekResponseConfirmed")
		var cards = requestSeekResponse(card, opponent_player)
		for targetCard in cards:
			self.target.discard(targetCard)
		action_counts[Globals.PLAYER_ONE_ID] += 1
		change_phase("P1End")

func requestSeekResponse(card, target_player):
	if target_player == active_player:
		$ActivePlayer/SeekResponsePopup.show()
		var cards = yield(self, "SeekResponseConfirmed")
	else:
		# discard random 2 cards
		$OpponentPlayer/OpponentPiles.discard_random_card()
		$OpponentPlayer/OpponentPiles.discard_random_card()
		change_phase("P1End")
		

func change_phase(phase):
	assert(phase in phases)
	current_phase = phase
	return current_phase


func _on_SeekResponseConfirmButton_pressed():
	var cards = $ActivePlayer/SeekResponsePopup
	emit_signal("SeekResponseConfirmed", cards)
