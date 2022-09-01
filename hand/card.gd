extends TextureRect


signal drag_started
signal drag_ended

const HOVER_SCALE_MODIFIER = 1.5

var is_being_dragged: bool = false
var data: CardData = null

onready var base_scale: Vector2 = rect_scale
onready var button: Button = $Button


func _process(_delta: float) -> void:
	if is_being_dragged:
		rect_global_position = get_global_mouse_position() - rect_size / 2.0
	
	
func is_hovered():
	return button.is_hovered()


func scale_up():
	rect_scale = base_scale * HOVER_SCALE_MODIFIER


func scale_down():
	rect_scale = base_scale


func _on_Button_button_down():
	is_being_dragged = true
	emit_signal("drag_started")


func _on_Button_button_up():
	is_being_dragged = false
	emit_signal("drag_ended")
