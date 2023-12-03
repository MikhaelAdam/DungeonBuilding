extends Node2D


func _on_play_pressed():
	$Control/VBoxContainer/PClicked.play()
	await $Control/VBoxContainer/PClicked.finished
	get_tree().change_scene_to_file("res://world/level1.tscn")


func _on_quit_pressed():
	
	$Control/VBoxContainer/PClicked.play()
	await $Control/VBoxContainer/PClicked.finished
	get_tree().quit()

func _ready():
	$MainMenuOst.play()
