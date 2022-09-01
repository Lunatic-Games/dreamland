extends "res://interactable/interactable.gd"

#export (Resource) var test_card
#export (Resource) var test_card2

var affection_bar
var current_affection = 0

onready var positive_affection_bar = $PositiveAffectionBar
onready var negative_affection_bar = $NegativeAffectionBar
onready var character_data = preload("res://interactable/character/character_datas/mr_davis.tres")

#func _process(delta):
#	if (Input.is_action_just_pressed("ui_accept")):
#		interact(test_card)

func interact(card_data):
	match character_data.affection_type:
		character_data.affection_types.athletics:
			_resolve_result(card_data.athletics_modifier)
		
		character_data.affection_types.strength:
			_resolve_result(card_data.strength_modifier)
			
		character_data.affection_types.intelligence:
			_resolve_result(card_data.intelligence_modifier)
			
		character_data.affection_types.charisma:
			_resolve_result(card_data.charisma_modifier)

func _resolve_result(value):
	if value > character_data.affection_threshold:
		_update_affection(1)
	else:
		_update_affection(-1)

func _update_affection(amount):
	current_affection = clamp(current_affection+amount, character_data.min_affection, character_data.max_affection)
	
	_update_positive_affection_bar()
	_update_negative_affection_bar()

func _update_positive_affection_bar():
	if current_affection <= 0:
		positive_affection_bar.value = 0
	else:
		positive_affection_bar.value = (float(current_affection) / float(character_data.max_affection)) * positive_affection_bar.max_value

func _update_negative_affection_bar():
	if current_affection >= 0:
		negative_affection_bar.value = 0
	else:
		negative_affection_bar.value = -1 * (float(current_affection) / float(character_data.max_affection)) * negative_affection_bar.max_value
