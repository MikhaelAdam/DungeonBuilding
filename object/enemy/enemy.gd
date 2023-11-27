extends RigidBody2D
class_name Enemy

@onready var e_anim = $AnimatedSprite2D
func _ready():
	e_anim.play("idle")

func _process(delta):
	pass
