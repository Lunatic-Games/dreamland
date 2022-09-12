extends "res://interactable/interactable.gd"

##var event_data: EventData = preload("res://interactable/event/event_data/test_event.tres")
#
##onready var rounds_to_resolve = event_data.rounds_to_resolve
#
#
## Play card on event
#func interact(card_data: CardData) -> void:
#	_trigger_resolved_encounter(card_data)
#
#
## Called at end of the round to update countdown
#func round_end_update() -> void:
#	rounds_to_resolve -= 1
#
#	if rounds_to_resolve <= 0:
#		_trigger_ignored_encounter()
#
#
## The player has failed to deal with the encounter in given time
#func _trigger_ignored_encounter() -> void:
#	pass
#
#
## The player has succeeded in dealing with the encounter
#func _trigger_resolved_encounter(_card_data: CardData) -> void:
#	pass
