extends CharacterBody2D

const SPEED = 200
const GRAVITY = 600
const JUMP_FORCE = -400
var isAttacking:bool = false
@onready var anim = $AnimatedSprite2D
@export var hitbox:HitboxComponent 

func _physics_process(delta):
	# Input handling
	var input_direction = Vector2()
	input_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if Input.is_action_just_pressed("attack"):
		isAttacking = true
	# Move the character
	velocity.x = input_direction.x * SPEED
	if isAttacking == false:
		if velocity.x !=0:
			anim.play("walk")
			$AnimatedSprite2D.flip_h = velocity.x < 0
			if Input.is_action_just_pressed("ui_accept") && is_on_floor():
				anim.play("jump")
				velocity.y = JUMP_FORCE
		else:
			
			anim.play("idle")
	else:
		velocity.x *= 0.15
		anim.play("attack")

	# Apply gravity
	velocity.y += GRAVITY * delta * 2
	# Move the character with gravity
	move_and_slide()

	# Jumping






func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "attack":
		isAttacking = false
