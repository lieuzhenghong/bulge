class_name Game extends Node

export(NodePath) var active_player_path
export(NodePath) var opponent_player_path

signal load_action_started(target)
signal turn_action_request_started(target)

func _ready():
	#$ActivePlayer/GridContainer/SeekButton.connect("confirmed", self, "_on_seekConfirmButtonPressed")
	var active_player = get_node(active_player_path)
	var opponent_player = get_node(opponent_player_path)
	print(active_player)

	var turn_player = active_player
	var action:Action = TurnRequestAction.new(turn_player, turn_player, self)
	while true:
		print(action)
		var next_action = action.execute()
		if next_action is GDScriptFunctionState:
			print("nextaction is gdcsriptfunctionstate")
			next_action = yield(next_action, "completed")
		print("Next action:")
		print(next_action)
		if next_action is TurnEndAction:
			turn_player = opponent_player if turn_player == active_player else active_player
			print("New turn. Turn player: %s" % turn_player)
			action = TurnRequestAction.new(turn_player, turn_player, self)
		elif next_action is DoneAction:
			break
		elif next_action is String:
			# Handling the special case where the player is selecting the action to take this turn
			if next_action == "LoadAction":
				action = LoadAction.new(turn_player, turn_player, self)
			elif next_action == "SeekAction":
				pass
			else:
				pass
		else:
			print("Next action again:")
			print(typeof(next_action))
			action = next_action.new(turn_player, turn_player, self)


class Action:
	var actor
	var target
	var game
	
	func _init(actor, target=null, game=null):
		self.actor = actor
		self.target = self.actor if target == null else target
		self.game = game
		print("Action constructor called")
		
class DoneAction extends Action:
	func execute():
		assert(false, "DoneAction cannot be executed")

class TurnEndAction extends Action:
	func execute():
		assert(false, "TurnEndAction cannot be executed")
		
class LoadAction extends Action:
	func _init(a: Player, b:Player, g: Game).(a,b, g):
		g.connect("load_action_started", a, "_on_load_action_started")
		b.connect('load_action_ended', self, "_on_load_action_ended")
		
	func _on_load_action_ended():
		print("on load action ended")
		
	func _helper():
		yield(self.target, "load_action_ended")
		print('asdfjaweklfjawlkef')
		return TurnEndAction
		
	func execute():
		var temp = _helper()
		self.game.emit_signal("load_action_started", self.target)
		print(temp)
		return temp.resume()

class TurnRequestAction extends Action:
	func _init(a: Player, b:Player, g: Game).(a,b, g):
		g.connect("turn_action_request_started", b, "_on_turn_action_request_started")
		print(a, b, g)
	
	func execute():
		self.game.emit_signal("turn_action_request_started", self.target)
		print("TurnRequestAction execute()d")
		print(self.target)
		var turn_action = yield(self.target, "turn_action_request_ended")
		print("Result of turn action yield:")
		print(turn_action)
		return turn_action
	


"""
func _on_LoadButton_pressed():
	if current_phase != "P1Main" or action_counts[0] > 0:
		pass
	else:
		#$ActivePlayer/ActivePlayerPiles.load_card()
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
		#$ActivePlayer/SeekResponsePopup.show()
		var cards = yield(self, "SeekResponseConfirmed")
	else:
		# discard random 2 cards
		#$OpponentPlayer/OpponentPiles.discard_random_card()
		#$OpponentPlayer/OpponentPiles.discard_random_card()
		change_phase("P1End")
"""
