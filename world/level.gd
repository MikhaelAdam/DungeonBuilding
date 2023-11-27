extends Node2D

@export var level_placeable:placeable
@onready var normal_plank_node = preload("res://plank/Plank.tscn")
@onready var enemy_plank_node = preload("res://plank/EnemyPlank.tscn")
var n_planks:int
var e_planks:int
func _ready():
	$Control/HBoxContainer/NPlank/PLabel.text = str(level_placeable.normal_plank_total)
	$Control/HBoxContainer/EPlank/ELabel.text = str(level_placeable.enemy_plank_total)
	n_planks = level_placeable.normal_plank
	e_planks = level_placeable.enemy_plank

func _on_n_plank_pressed():
	if n_planks > 0:
		n_planks -= 1
		var n_plank_instance = normal_plank_node.instantiate()
		add_child(n_plank_instance)
		n_plank_instance.position = $Marker2D.position
		$Control/HBoxContainer/NPlank/PLabel.text = str(n_planks)
	else:
		pass

func _on_e_plank_pressed():
	if e_planks > 0:
		e_planks -= 1
		var e_plank_instance = enemy_plank_node.instantiate()
		add_child(e_plank_instance)
		e_plank_instance.position = $Marker2D.position
		$Control/HBoxContainer/NPlank/PLabel.text = str(e_planks)
	else:
		pass
