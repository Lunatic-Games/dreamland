extends "res://interactable/interactable.gd"

var character_data: CharacterData = preload("res://_resources/characters/mr_davis.tres")
var current_affection: int = 0
var collected_rewards: Array = []

onready var positive_affection_bar: ProgressBar = $PositiveAffectionBar
onready var negative_affection_bar: ProgressBar = $NegativeAffectionBar


# Play card on character
func interact(card_data: CardData) -> void:
	match character_data.affection_type:
		character_data.AffectionTypes.ATHLETICS:
			_resolve_result(card_data.athletics_modifier)
		
		character_data.AffectionTypes.STRENGTH:
			_resolve_result(card_data.strength_modifier)
			
		character_data.AffectionTypes.INTELLIGENCE:
			_resolve_result(card_data.intelligence_modifier)
			
		character_data.AffectionTypes.CHARISMA:
			_resolve_result(card_data.charisma_modifier)

# Determine if they pass the check
func _resolve_result(value: int) -> void:
	if _succeeded_stat_test(character_data.affection_difficulty_check, value):
		_alter_affection(1)

	else:
		_alter_affection(-1)


# Increase/decrease affection and check for threshold rewards
func _alter_affection(amount: int) -> void:
	current_affection = int(clamp(current_affection + amount, 
		character_data.min_affection, character_data.max_affection))
	
	_check_threshold_rewards()
	
	_update_positive_affection_bar()
	_update_negative_affection_bar()


# Update positive affection bar (empty if overall negative affection)
func _update_positive_affection_bar() -> void:
	if current_affection <= 0:
		positive_affection_bar.value = 0
	else:
		positive_affection_bar.value = (float(current_affection) / float(character_data.max_affection)) * positive_affection_bar.max_value


# Update negative affection bar (empty if overall positive affection)
func _update_negative_affection_bar() -> void:
	if current_affection >= 0:
		negative_affection_bar.value = 0
	else:
		negative_affection_bar.value = -(float(current_affection) / float(character_data.max_affection)) * negative_affection_bar.max_value


# Check if the player has passed a new threshold (positive or negative)
func _check_threshold_rewards() -> void:
	var positive_thresholds: Dictionary = character_data.positive_affection_reward_thresholds
	
	if current_affection > 0:
		for key in positive_thresholds:
			if !(key in collected_rewards) && current_affection >= key:
				_collect_reward(key, positive_thresholds[key])
	
	var negative_thresholds: Dictionary = character_data.negative_affection_reward_thresholds
	if current_affection < 0:
		for key in negative_thresholds:
			if !(key in collected_rewards) && current_affection <= key:
				_collect_reward(key, negative_thresholds[key])


# Add rewards to the player's deck
# Key is the threshold (..., -4, -2, 0, 2, 4, ...)
func _collect_reward(key: int, rewards: Array) -> void:
	collected_rewards.append(key)
	for reward in rewards:
		var _card_data: CardData = load(reward)
		# TODO: Add them to the players deck
