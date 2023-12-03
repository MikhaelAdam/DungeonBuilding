extends Node2D


func _on_start_button_pressed():

	$Plank.hide_ui()
	$Stair.hide_ui()
	$Player.set_physics_process(true)
	$Camera2D/Control/StartButton.hide()
	$Player.show()
	$Camera2D/Control/StartButton/Clicked.play()


func _on_visible_on_screen_notifier_2d_screen_exited():
	restart()
	
func restart():
	get_tree().change_scene_to_file("res://world/level1.tscn")


func _on_player_dead_man():
	restart()
