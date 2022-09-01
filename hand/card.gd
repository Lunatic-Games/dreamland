extends TextureRect


signal drag_started
signal drag_ended

const HOVER_SCALE_MODIFIER: float = 1.5

var is_being_dragged: bool = false
var data: CardData = null

onready var base_scale: Vector2 = rect_scale
onready var button: Button = $Button


# Follow mouse if being dragged
func _process(_delta: float) -> void:
	if is_being_dragged:
		rect_global_position = get_global_mouse_position() - rect_size / 2.0


# The card is being hovered if the card button is being hovered
func is_hovered():
	return button.is_hovered()


# Scale up card size while being hovered (and dragged, by extension)
func scale_up():
	rect_scale = base_scale * HOVER_SCALE_MODIFIER


# Scale back down to un-hovered size
func scale_down():
	rect_scale = base_scale


# Drag on button press
func _on_Button_button_down():
	is_being_dragged = true
	emit_signal("drag_started")


# End drag on button release
func _on_Button_button_up():
	is_being_dragged = false
	emit_signal("drag_ended")
