extends CharacterBody2D
signal dead_man
const SPEED = 200
const GRAVITY = 600
const JUMP_FORCE = -400
var isAttacking:bool = false
@onready var anim = $AnimatedSprite2D

func _ready():
	set_physics_process(false)
	hide()

func _physics_process(delta):
	# Input handling
	var input_direction = Vector2()
	input_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if Input.is_action_just_pressed("attack"):
		isAttacking = true
	# Move the character
	velocity.x = input_direction.x * SPEED
	
	if velocity.x !=0:
		anim.play("walk")
		$AnimatedSprite2D.flip_h = velocity.x < 0
		$CPUParticles2D.emitting = true
		
	else:
		anim.play("idle")
		$CPUParticles2D.emitting = false


	# Apply gravity
	velocity.y += GRAVITY * delta * 1.7

	move_and_slide()
	if Input.is_action_just_pressed("ui_accept") && is_on_floor():
		anim.play("jump")
		$JumpSound.play()
		velocity.y = JUMP_FORCE
	# Jumping



func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "attack":
		isAttacking = false


func _on_area_2d_area_entered(area):
	if area.is_in_group("arrow"):
		$Death.play()
		await $Death.finished
		emit_signal("dead_man")


