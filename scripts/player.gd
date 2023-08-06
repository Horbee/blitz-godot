extends CharacterBody2D


const SPEED = 150.0


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED

	move_and_slide()
	
	look_at(get_global_mouse_position())