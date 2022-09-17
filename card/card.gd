extends TextureRect


signal drag_started
signal drag_succeeded
signal drag_failed

const HOVER_SCALE_MODIFIER: float = 1.3

var is_being_dragged: bool = false
var data: CardData = preload("res://_resources/cards/pencil.tres") setget set_data

onready var base_scale: Vector2 = rect_scale
onready var button: Button = $Button
onready var card_area: Area2D = $CardArea
onready var title: Label = $TitleBackground/Title
onready var athletics_box = $Stats/Athletics
onready var charisma_box = $Stats/Charisma
onready var intelligence_box = $Stats/Intelligence
onready var strength_box = $Stats/Strength


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
	title.text = data.display_name
	_update_stat_boxes()


func _update_stat_boxes():
	_update_stat_box(athletics_box, data.athletics_modifier)
	_update_stat_box(charisma_box, data.charisma_modifier)
	_update_stat_box(intelligence_box, data.intelligence_modifier)
	_update_stat_box(strength_box, data.strength_modifier)


func _update_stat_box(box, value):
	box.visible = value != 0
	var label = box.get_node("HBoxContainer/Amount")
	label.text = "+" + str(value) if value > 0 else str(value)
