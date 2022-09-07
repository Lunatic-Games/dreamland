extends "res://interactable/interactable.gd"

export (Resource) var test_card
export (Resource) var location_data = preload("res://interactable/location/location_data/mr_davis_geography_class.tres")

var encounter_scene = preload("res://encounter/encounter.tscn")


# Perform setup
func _ready() -> void:
	randomize()
	setup(location_data)


# For testing purposes
func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("ui_accept")):
		interact(test_card)


func setup(new_location_data: LocationData):
	location_data = new_location_data
	texture = location_data.texture


# Play card on location
func interact(card_data: CardData) -> void:
	var is_success = _card_passes_requirements(card_data)
	if is_success:
		_handle_location_succeeded()
	else:
		_handle_location_failed()
	print("Interact success: ", is_success)


# Check if card beats location requirements
func _card_passes_requirements(card_data: CardData) -> bool:
	if(location_data.required_athletics > card_data.athletics_modifier): return false
	if(location_data.required_charisma > card_data.charisma_modifier): return false
	if(location_data.required_strength > card_data.strength_modifier): return false
	if(location_data.required_intelligence > card_data.intelligence_modifier): return false
	
	return true


# Player has failed to pass the stat check
func _handle_location_failed() -> void:
	if randf() <= 0.25:
		_select_random_encounter(location_data.failure_encounters)
	# TODO: Add failure cards to the players deck


# Player has passed the stat check
func _handle_location_succeeded():
	if randf() <= 0.25:
		_select_random_encounter(location_data.success_encounters)
	# TODO: Adds the success cards to the player deck


# Spawn a randomly selected encounter
func _select_random_encounter(encounters: Array) -> void:
	var index = randi()%encounters.size()
	var encounter = encounter_scene.instance()
	get_tree().root.add_child(encounter)
	encounter.setup(encounters[index])
