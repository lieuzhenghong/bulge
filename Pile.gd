class_name Pile extends Node

var contents = []

func give():
	return contents.pop_back()
	
func add(element):
	contents.push_back(element)
	return contents

func hsize():
	return contents.size()

func count(colour):
	var sum = 0
	for i in range(contents.size()):
		if contents[i].colour == colour:
			sum += 1
	return sum
