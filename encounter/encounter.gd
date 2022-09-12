extends Control


var encounter_data: EncounterData
var dialog: Object

onready var splash_background: TextureRect = $SplashBackground

onready var dialog_scene: PackedScene = preload("res://encounter/dialog/dialog.tscn")
onready var skill_test_scene: PackedScene = preload("res://encounter/skill_test/skill_test.tscn")


# Set up the encounter
func setup(new_encounter_data: EncounterData) -> void:
	encounter_data = new_encounter_data
	splash_background.texture = encounter_data.splash_background
	
	if encounter_data.is_skill_test:
		dialog = skill_test_scene.instance()
	else:
		dialog = dialog_scene.instance()
	
	dialog.setup(encounter_data.dialog_text, encounter_data.confirmation_text, self)
	add_child(dialog)

# Give any encounter rewards to the player
func give_rewards(_rewards: Array) -> void:
	pass
