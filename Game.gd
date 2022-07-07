extends Node

var turn = 0
var current_phase = 0
var priority = Globals.PLAYER_ONE_ID
var has_passed = []

# FIXME
# Not general enough solution.
# Also bugged because you only want to disallow two loads of one player
# Opponent LoadTriggers are OK. 
# Will fail if opponent has a "During your opponent's action phase, Load" kinda 
# thing
func _on_LoadButton_pressed():
	# Push a LoadTrigger for player one onto the stack
	if turn % 2 == Globals.PLAYER_ONE_ID and \
	priority == Globals.PLAYER_ONE_ID and \
	current_phase == 0 and not Stack.class_in_stack(LoadTrigger):
		Stack.push(LoadTrigger.new(
			Globals.PLAYER_ONE_ID, 
			Globals.PLAYER_ONE_ID)
		)
		# FIXME Hardcode this for now
		has_passed = [Globals.PLAYER_ONE_ID, Globals.PLAYER_TWO_ID]

# FIXME
func _on_OppLoadButton_pressed():
	if turn % 2 == Globals.PLAYER_TWO_ID and \
	priority == Globals.PLAYER_TWO_ID and \
	current_phase == 0 and not Stack.class_in_stack(LoadTrigger):
		Stack.push(LoadTrigger.new(
		Globals.PLAYER_TWO_ID, 
		Globals.PLAYER_TWO_ID)
		)
		# FIXME Hardcode this for now
		has_passed = [Globals.PLAYER_ONE_ID, Globals.PLAYER_TWO_ID]

func _on_OppPlayerPassButton_pressed():
	if Globals.PLAYER_TWO_ID in has_passed:
		pass
	else:
		has_passed.push_back(Globals.PLAYER_TWO_ID)

func _on_ActivePlayerPassButton_pressed():
	if Globals.PLAYER_ONE_ID in has_passed:
		pass
	else:
		has_passed.push_back(Globals.PLAYER_ONE_ID)
		

# We move to a new phase when both players have passed and the stack is empty.

# When we move to a new phase:
# - Clear all passes.
# - The player whose turn it is gains priority.
# 

func next_phase():
	# We need to make this increment the turn too.
	if current_phase == Globals.phases.size() - 1:
		current_phase = 0
		turn += 1
	else:
		current_phase += 1
	has_passed = []
	priority = Globals.PLAYER_TWO_ID if (turn % 2) == 1 else Globals.PLAYER_ONE_ID

func _process(_delta):
	$StackSizeLabel.text = "Stack Size: %s" % Stack.stack.size()
	$TurnCountLabel.text = "Turn Count: %s" % turn
	if has_passed.size() == 2:
		while Stack.stack.size() > 0:
			Stack.pop()
		next_phase()
