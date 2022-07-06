class_name Helpers extends Node

static func sum(array):
	var array_sum = 0
	for i in range(array.size()):
		array_sum += array[i]
	return array_sum
