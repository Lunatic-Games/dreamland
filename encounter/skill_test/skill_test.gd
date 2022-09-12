extends "res://encounter/dialog/dialog.gd"

# Setup the dialog box
func setup(text: String, confirmation_text: String, parent_encounter: Object) -> void:
	$DialogText.bbcode_text = "[center]" + text
	$SkillTestSlot.encounter = parent_encounter
