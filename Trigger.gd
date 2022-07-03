extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func resolve():
	self.function.call()
	self.signal.emit()

func _init(function, fnsignal):
	self.function = function
	self.signal = fnsignal
