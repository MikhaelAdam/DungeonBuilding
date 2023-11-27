extends Node2D
class_name EnemyPlank
var is_draging:bool = false
@onready var enemy_node = preload("res://object/enemy/enemy.tscn")
@onready var mob_spawn_location = $StaticBody2D/Path2D/PathFollow2D
@onready var spin_box_x = $HBoxContainer/xspin
var button_press_count:int = 0
var enemy_count:int = 0
func _physics_process(delta):
	var spin_box_xvalue = spin_box_x.value
	$StaticBody2D.scale.x = spin_box_xvalue
	if is_draging == true:
		position = get_global_mouse_position()

func _on_button_button_down():
	is_draging = true


func _on_button_button_up():
	is_draging = false
	

func _on_button_pressed():
	$Timer.start()
	button_press_count+=1
	if button_press_count == 2:
		queue_free()

func _on_Timer_timeout():
	button_press_count = 0 

func _on_xspin_value_changed(value):
	var enemy = enemy_node.instantiate()
	
	mob_spawn_location.progress_ratio = randf()
	enemy.position = mob_spawn_location.position
	add_child(enemy)


func _on_reset_button_pressed():
	spin_box_x.value = 1
