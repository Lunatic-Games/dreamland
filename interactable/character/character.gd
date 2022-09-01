extends "res://interactable.gd"

var character_data
var affection_bar
var current_affection = 0
var test_card

onready var positive_affection_bar = $PositiveAffectionBar
onready var negative_affection_bar = $NegativeAffectionBar

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		interact(test_card)

func interact(card_data):
	match character_data.affection_types:
		character_data.affection_types.strength:
			_resolve_result(card_data.strength)
		character_data.affection_types.athletics:
			_resolve_result(card_data.athletics)
		character_data.affection_types.intelligence:
			_resolve_result(card_data.intelligence)
		character_data.affection_types.charisma:
			_resolve_result(card_data.charisma)

func _resolve_result(value):
	if value > character_data.affection_threshold:
		print("That worked!")
		_update_affection(1)

func _update_affection(amount):
	current_affection += amount
	
	_update_positive_affection_bar()
	_update_negative_affection_bar()

func _update_positive_affection_bar():
	if current_affection <= 0:
		positive_affection_bar.value = 0
	else:
		positive_affection_bar.value = (current_affection / character_data.max_affection) * positive_affection_bar.max_value

func _update_negative_affection_bar():
	if current_affection >= 0:
		negative_affection_bar.value = 0
	else:
		negative_affection_bar.value = (current_affection / character_data.max_affection) * negative_affection_bar.max_value
