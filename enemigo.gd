extends CharacterBody2D

@onready var target = get_node("../Player")
const SPEED = 100.0
const JUMP_VELOCITY = -400.0

#func _ready():
	#print("enemigo activo")
	
func _physics_process(delta: float) -> void:
	if target == null:
		return
		
	#print(global_position)
	#print(target.global_position)
	
	var direction=(target.global_position  - global_position ).normalized()
	velocity = direction * SPEED
	#look_at(target.global_position )
	move_and_slide()
