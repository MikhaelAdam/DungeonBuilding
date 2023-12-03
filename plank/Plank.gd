extends Node2D
class_name Plank

var is_draging:bool = false
@onready var spin_box_x = $PlankControl/HBoxContainer/xspin

var button_press_count:int = 0


func _process(delta):
	var spin_box_xvalue:int = spin_box_x.value
	$StaticBody2D.scale.x = spin_box_xvalue
	if is_draging == true:
		position = get_global_mouse_position()

func _on_Button_button_down():
	is_draging = true


func _on_Button_button_up():
	is_draging = false
	



	
func set_min(value:int):
	spin_box_x.max_value = value
	


func hide_ui():
	$PlankControl.visible = false
		
func show_ui():
	$PlankControl.visible = true
