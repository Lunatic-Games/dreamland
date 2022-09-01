extends "res://interactable/interactable.gd"

onready var event_data = preload("res://interactable/event/event_datas/test_event.tres")

func interact(card_data):
	_trigger_resolved_encounter(card_data)

func _roundEndUpdate():
	event_data.rounds_to_resolve -= 1
	
	if event_data.rounds_to_resolve <= 0:
		_trigger_ignored_encounter()

func _trigger_ignored_encounter():
	pass

func _trigger_resolved_encounter(card_data):
	pass
