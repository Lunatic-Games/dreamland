extends Node

const REQUIRED_CHANCE_ROLL = 4

onready var interactable_area: Area2D = $InteractableArea
onready var outline: ColorRect = $Outline


# Show outline if card is dragged over
func _process(_delta: float) -> void:
	outline.hide()
	for area in interactable_area.get_overlapping_areas():
		if area.is_in_group("card_area"):
			outline.show()


# To be overriden by inherited interactables
func interact(_card_data: CardData) -> void:
	pass

func _succeeded_perform_chance_check(successes_needed, chances):
	var successes = 0
	for chance in chances:
		var result = randi()%5
		if result >= REQUIRED_CHANCE_ROLL:
			successes += 1
	
	if successes >= successes_needed:
		return true
	
	return false
