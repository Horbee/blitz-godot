extends Area2D

var direction = Vector2.UP
var speed = 300.0
var start_pos = 0

const MAX_DISTANCE = 1000

func _ready():
	start_pos = global_transform.origin


func _process(delta):
	position += speed * direction * delta
	
	var dist = global_transform.origin.distance_to(start_pos)
	if dist >= MAX_DISTANCE:
		print(dist)
		queue_free()
