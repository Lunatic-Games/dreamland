extends Node


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
