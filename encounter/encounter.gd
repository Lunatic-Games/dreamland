extends Control

const DIALOG_SCENE: PackedScene = preload("res://encounter/dialog/dialog.tscn")
const SKILL_TEST_SCENE: PackedScene = preload("res://encounter/skill_test/skill_test.tscn")

var encounter_data: EncounterData
var dialog: Node

onready var splash_background: TextureRect = $SplashBackground


# Set up the encounter
func setup(new_encounter_data: EncounterData) -> void:
	encounter_data = new_encounter_data
	splash_background.texture = encounter_data.splash_background
	
	if encounter_data.is_skill_test:
		dialog = SKILL_TEST_SCENE.instance()
	else:
		dialog = DIALOG_SCENE.instance()
	
	dialog.setup(encounter_data.dialog_text, encounter_data.confirmation_text, self)
	add_child(dialog)

# Give any encounter rewards to the player
func give_rewards(_rewards: Array) -> void:
	pass
