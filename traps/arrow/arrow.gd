extends Area2D
const SPEED:float = 200.0

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction* delta

func _on_body_entered(body):
	queue_free()
