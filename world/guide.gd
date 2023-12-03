extends Node2D

func _ready():
	$Player.show()
	$Player.set_physics_process(true)
func _on_back_pressed():
	get_tree().change_scene_to_file("res://world/main_menu.tscn")


func _on_player_dead_man():
	$Player.position = $Marker2D2.position


func _on_visible_on_screen_notifier_2d_screen_exited():
	$Player.position = $Marker2D2.position
