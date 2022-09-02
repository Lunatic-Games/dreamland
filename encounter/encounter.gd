extends Control

export (Resource) var test_encounter_data
var encounter_data

func setup_encounter(new_encounter_data):
	encounter_data = new_encounter_data
	$SplashBackground.texture = encounter_data.splash_background
	$Dialog.setup(encounter_data.dialog_text, encounter_data.confirmation_text)


func _on_NextButton_pressed():
	if encounter_data.has_rewards:
		_give_rewards(encounter_data.rewards)
	
	if encounter_data.has_more_dialog:
		setup_encounter(encounter_data.next_dialog)
	else:
		queue_free()

func _give_rewards(rewards):
	pass
