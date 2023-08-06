extends CharacterBody2D

const SPEED = 150.0

var can_shoot = true

signal on_shoot(pos, dir)

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED

	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("fire") and can_shoot:
		var markers = $Pistols.get_children()
		var marker = markers[randi() % markers.size()] as Marker2D
		var dir = (get_global_mouse_position() - position).normalized()
		on_shoot.emit(marker.global_position, dir)
		can_shoot = false
		$ShootTimer.start()

func _on_shoot_timer_timeout():
	can_shoot = true
