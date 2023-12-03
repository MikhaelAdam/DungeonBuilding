extends StaticBody2D
class_name Shoottrap
@onready var bullet:PackedScene = preload("res://traps/arrow/arrow.tscn")



func _on_timer_timeout():
	var arrows = bullet.instantiate() 
	add_child(arrows)
	arrows.position = $Marker2D.position
	arrows.rotation_degrees = $".".rotation_degrees
	$Shoot.play()
