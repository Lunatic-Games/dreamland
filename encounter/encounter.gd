extends Control


var encounter_data: EncounterData

onready var splash_background: TextureRect = $SplashBackground
onready var dialog: Control = $Dialog


# Set up the encounter
func setup(new_encounter_data: EncounterData) -> void:
	encounter_data = new_encounter_data
	splash_background.texture = encounter_data.splash_background
	dialog.setup(encounter_data.dialog_text, encounter_data.confirmation_text)


# Determine what to do on dialogue confirmation
func _on_DialogNextButton_pressed() -> void:
	if encounter_data.rewards:
		_give_rewards(encounter_data.rewards)
	
	if encounter_data.next_dialog:
		setup(encounter_data.next_dialog)
	else:
		queue_free()


# Give any encounter rewards to the player
func _give_rewards(_rewards: Array) -> void:
	pass
