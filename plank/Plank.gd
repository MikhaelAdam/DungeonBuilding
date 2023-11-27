extends Node2D
class_name Plank

var is_draging:bool = false
@onready var spin_box_x = $PlankControl/HBoxContainer/xspin
@onready var spin_box_y = $PlankControl/HBoxContainer/yspin
var button_press_count:int = 0

func _process(delta):
	var spin_box_xvalue = spin_box_x.value
	var spin_box_yvalue = spin_box_y.value
	
	$StaticBody2D.scale.x = spin_box_xvalue
	$StaticBody2D.rotation_degrees = spin_box_yvalue

	if is_draging == true:
		position = get_global_mouse_position()

func _on_Button_button_down():
	is_draging = true


func _on_Button_button_up():
	is_draging = false
	

func _on_Button_pressed():
	$Timer.start()
	button_press_count+=1
	if button_press_count == 2:
		queue_free()

func _on_Timer_timeout():
	button_press_count = 0 
	






