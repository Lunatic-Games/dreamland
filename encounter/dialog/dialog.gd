extends Control


# Setup the dialog box
func setup(text: String, confirmation_text: String) -> void:
	$DialogText.bbcode_text = "[center]" + text
	$NextButton.text = confirmation_text
