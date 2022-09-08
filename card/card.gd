extends TextureRect


signal drag_started
signal drag_succeeded
signal drag_failed

const HOVER_SCALE_MODIFIER: float = 1.5

var is_being_dragged: bool = false
var data: CardData = preload("res://_resources/cards/pencil.tres") setget set_data

onready var base_scale: Vector2 = rect_scale
onready var button: Button = $Button
onready var card_area: Area2D = $CardArea


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
	var hovered_interactable = get_hovered_interactable()
	if hovered_interactable:
		hovered_interactable.get_parent().interact(data)
		emit_signal("drag_succeeded")
		Globals.discard.add(data)
		queue_free()
	else:
		is_being_dragged = false
		emit_signal("drag_failed")


# Get the hovered interactable, or null if there is none
func get_hovered_interactable() -> Control:
	for area in card_area.get_overlapping_areas():
		if area.is_in_group("interactable_area"):
			return area
	return null


# Setter function
func set_data(card_data: CardData):
	data = card_data
	texture = data.texture
