extends Control

var encounter

# Setup the dialog box
func setup(text: String, confirmation_text: String, parent_encounter: Node) -> void:
	$DialogText.bbcode_text = "[center]" + text
	$NextButton.text = confirmation_text
	encounter = parent_encounter


# Determine what to do on dialogue confirmation
func _on_NextButton_pressed() -> void:
	var encounter_data = encounter.encounter_data
	if encounter_data.rewards:
		encounter.give_rewards(encounter_data.rewards)
	
	if encounter_data.success_dialog:
		encounter.setup(encounter_data.success_dialog)
		queue_free()
	else:
		encounter.queue_free()
