extends Control


func hide_interactables():
	get_tree().call_group("interactable_area", "set_monitoring", false)
	get_tree().call_group("interactable_area", "set_monitorable", false)
	get_tree().call_group("interactable", "hide")


func show_interactables():
	get_tree().call_group("interactable_area", "set_monitoring", true)
	get_tree().call_group("interactable_area", "set_monitorable", true)
	get_tree().call_group("interactable", "show")
