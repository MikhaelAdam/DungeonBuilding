extends Node2D
class_name Stair

var is_draging:bool = false
@onready var spin_box_x = $PlankControl/HBoxContainer/xspin
var button_press_count:int = 0

func _process(delta):
	var spin_box_xvalue = spin_box_x.value
	
	$StaticBody2D.scale = Vector2(spin_box_xvalue, spin_box_xvalue)

	if is_draging == true:
		position = get_global_mouse_position()


func _on_button_button_down():
	is_draging = true
	$Clicked.play()


func _on_button_button_up():
	is_draging = false



func _on_timer_timeout():
	button_press_count = 0 
	
func set_min(value:int):
	spin_box_x.max_value = value
func hide_ui():
	$PlankControl.hide()
func show_ui():
	$PlankControl.show()


