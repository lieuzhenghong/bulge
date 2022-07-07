extends Node

var turn = 1

func _on_LoadButton_pressed():
	# Push a LoadTrigger for player one onto the stack
	Stack.push(LoadTrigger.new(
		Globals.PLAYER_ONE_ID, 
		Globals.PLAYER_ONE_ID)
	)

func _on_ResolveStack_pressed():
	Stack.pop()

func _process(_delta):
	$StackSizeLabel.text = "Stack Size: %s" % Stack.stack.size()
