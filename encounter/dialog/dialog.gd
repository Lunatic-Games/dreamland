extends Control

func setup(text, confirmation_text):
	$DialogText.bbcode_text = "[center]" + text
	$NextButton.text = confirmation_text

func _on_NextButton_pressed():
	pass # Replace with function body.
