extends Area2D

const FILE_BEGIN = "res://world/level"

func _ready():
	$AnimatedSprite2D.play("default")


func _on_body_entered(body):
	if body.is_in_group("player"):
		$NextLevel.play()
		await $NextLevel.finished
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_num = current_scene_file.to_int() + 1
		var next_level_path = FILE_BEGIN + str(next_level_num) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
		if next_level_num > 10:
			get_tree().change_scene_to_file("res://world/main_menu.tscn")
