extends TextureRect


const HOVER_SCALE_MODIFIER = 2.0

var is_being_dragged: bool = false

onready var base_scale: Vector2 = rect_scale
onready var button = $Button


func _process(_delta: float) -> void:
	if is_being_dragged:
		rect_global_position = get_global_mouse_position()
	
	
func is_hovered():
	return button.is_hovered()


func scale_up():
	rect_scale = base_scale * HOVER_SCALE_MODIFIER


func scale_down():
	rect_scale = base_scale


func _on_Button_button_down():
	is_being_dragged = true


func _on_Button_button_up():
	is_being_dragged = false
