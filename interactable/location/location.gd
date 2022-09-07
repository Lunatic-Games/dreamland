extends "res://interactable/interactable.gd"

export (Resource) var test_card
export (Resource) var location_data = preload("res://interactable/location/location_data/mr_davis_geography_class.tres")

onready var encounter_scene = preload("res://encounter/encounter.tscn")

func _ready():
	randomize()
	setup_location(location_data)

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("ui_accept")):
		interact(test_card)


func interact(card_data):
	var did_succeed = _attempt_location_result(card_data)
	if did_succeed:
		_handle_location_succeeded()
	else:
		_handle_location_failed()
	print("Interact success: ", did_succeed)


func _attempt_location_result(card_data):
	if(location_data.required_athletics > card_data.athletics_modifier): return false
	if(location_data.required_charisma > card_data.charisma_modifier): return false
	if(location_data.required_strength > card_data.strength_modifier): return false
	if(location_data.required_intelligence > card_data.intelligence_modifier): return false
	
	return true

func _handle_location_failed():
	if randf() <= 0.25:
		_select_random_encounter(location_data.failure_encounters)
	# TODO: Add failure cards to the players deck


func _handle_location_succeeded():
	if randf() <= 0.25:
		_select_random_encounter(location_data.success_encounters)
	# TODO: Adds the success cards to the player deck


func _select_random_encounter(encounters):
	var index = randi()%encounters.size()
	var encounter = encounter_scene.instance()
	encounter.setup_encounter(encounters[index])
	get_tree().root.add_child(encounter)

func setup_location(data):
	location_data = data
	$CardArt.texture = data.location_texture
