extends CharacterBody2D

@export var speed:= 100
@export var aceleracion:= 50

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const  max_jumps = 3

@onready var animationPlayer = $AnimationPlayer
@onready var sprite2D = $Sprite2D
var  jump_count = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor():
		jump_count = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count<max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count+=1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	var target_velocity := direction*speed
	
	if direction:
		velocity.x = direction * speed
	else:
		#efecto de jabon y velocidad 
		velocity.x = move_toward(velocity.x, target_velocity,aceleracion * delta)

	move_and_slide()
	animacionPersonaje(direction)
	
	if direction == 1:
		sprite2D.flip_h = false
	elif direction == -1:
		sprite2D.flip_h = true
		
func animacionPersonaje(direction):
	if is_on_floor():
		if direction == 0:
			animationPlayer.play("Idle")
		else:
			animationPlayer.play("Run")
	else:
		if velocity.y < 0:
			animationPlayer.play("jump")
		elif velocity.y > 0:
			animationPlayer.play("fall")
