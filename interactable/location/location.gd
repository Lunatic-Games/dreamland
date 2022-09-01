extends "res://interactable/interactable.gd"

export (Resource) var test_card

var location_data = preload("res://interactable/location/location_datas/mr_davis_geography_class.tres")

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		interact(test_card)

func interact(card_data):
	var did_succeed = _attempt_location(card_data)
	print(did_succeed)

func _attempt_location(card_data):
	if(location_data.required_athletics > card_data.athletics_modifier):
		return _handle_location_failed()
		
	if(location_data.required_charisma > card_data.charisma_modifier):
		return _handle_location_failed()
		
	if(location_data.required_strength > card_data.strength_modifier):
		return _handle_location_failed()
		
	if(location_data.required_intelligence > card_data.intelligence_modifier):
		return _handle_location_failed()
	
	return _handle_location_succeeded()

func _handle_location_failed():
	return false
	# Add failure cards to the players deck
	pass

func _handle_location_succeeded():
	return true
	# Adds the success cards to the player deck
	pass
