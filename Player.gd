extends Node

export(NodePath) var piles_path
onready var piles = get_node(piles_path)

func load():
	piles.load_card()
