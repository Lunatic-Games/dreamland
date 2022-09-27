extends TextureRect

const REQUIRED_CHANCE_ROLL = 4
const DIE_FACES_MINUS_ONE = 5
const ENCOUNTER_SCENE = preload("res://encounter/encounter.tscn")

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


# Used when an interactable requires a stat to be tested
func _succeeded_stat_test(successes_needed: int, chances: int) -> bool:
	var successes = 0
	for chance in chances:
		var result = randi()%DIE_FACES_MINUS_ONE
		if result >= REQUIRED_CHANCE_ROLL:
			successes += 1
	
	if successes >= successes_needed:
		return true
	
	return false

# Spawn a randomly selected encounter
func _spawn_random_encounter(encounters: Array) -> void:
	_spawn_encounter(encounters[randi()%encounters.size()])

# Spawn a randomly selected encounter
func _spawn_encounter(encounter_data: EncounterData) -> void:
	var encounter = ENCOUNTER_SCENE.instance()
	get_tree().root.get_node("Game/Encounters").add_child(encounter)
	encounter.setup(encounter_data)
