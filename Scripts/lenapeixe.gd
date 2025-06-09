extends CharacterBody2D

@export var gravity : float = 130
@export var jump_force := 80
@export var rotation_speed: float = 20

var current_velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("jump"):
		current_velocity.y = -jump_force
	else: 
		current_velocity.y += gravity * delta
	
	if current_velocity.y > 0:
		if rotation < PI / 6:
				rotate(rotation_speed * delta)
		pass
	else: 
		if rotation > - PI / 6:  
			rotate(-rotation_speed * delta)
		pass
	
	velocity = current_velocity
	move_and_slide()
	current_velocity = velocity
