extends "res://interactable/interactable.gd"

export (Resource) var test_card

var location_data = preload("res://interactable/location/location_datas/mr_davis_geography_class.tres")

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		interact(test_card)

func interact(card_data):
	var did_succeed = _attempt_location_result(card_data)
	if did_succeed:
		_handle_location_succeeded()
	else:
		_handle_location_failed()
	print(did_succeed)

func _attempt_location_result(card_data):
	if(location_data.required_athletics > card_data.athletics_modifier): return false
	if(location_data.required_charisma > card_data.charisma_modifier):return false
	if(location_data.required_strength > card_data.strength_modifier):return false
	if(location_data.required_intelligence > card_data.intelligence_modifier):return false
	
	return true

func _handle_location_failed():
	if randf() <= 0.25:
		_select_random_encounter(location_data.failure_encounters)
	# Add failure cards to the players deck
	pass

func _handle_location_succeeded():
	if randf() <= 0.25:
		_select_random_encounter(location_data.success_encounters)
	# Adds the success cards to the player deck
	pass

func _select_random_encounter(encounters):
	var index = randi()%encounters.size()
	pass
