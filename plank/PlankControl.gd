extends Control

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		return
