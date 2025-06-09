extends CharacterBody2D


const gravity : float = 9.8
@export var gravity_multiplier : float = 15
@export var jump_force : float = 100

var max_rotation : float = -PI * 0.4
var min_rotation : float = PI * 0.4
var velocity_cap : float = 100.0


var current_velocity : Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	current_velocity.y +=  gravity * delta * gravity_multiplier
	
	if(Input.is_action_just_pressed("jump")):
		current_velocity.y = -jump_force
	
	var interpolator : float = ((current_velocity.y / jump_force) + 1) / 2
	var desired_rotation = lerp_angle(max_rotation, min_rotation, clampf(interpolator, 0, 1))
	rotation = rotate_toward(rotation, desired_rotation, 10 * delta)
	
	velocity = current_velocity
	move_and_slide()
	current_velocity = velocity
