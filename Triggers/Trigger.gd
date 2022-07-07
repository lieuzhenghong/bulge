class_name Trigger extends Node

# A trigger is put on the stack
# It should have the following properties:

# 1. When a trigger is put on the stack,
# it should emit a signal, so that things that care about the signal
# can respond to it.

# 2. When a trigger is resolved (popped from the stack),
# it should likewise emit a signal so that things that care
# about the signal can also respond to it.

# A trigger should contain, minimally:
# who the actor who put the trigger on is,
# the type of signal it is,
# and who the target is, potentially.

var type = null
var actor = null
var target = null
