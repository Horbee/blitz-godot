extends Node2D

var laser_scene: PackedScene = preload("res://scenes/laser.tscn")


func _on_player_on_shoot(pos, dir):
	var laser = laser_scene.instantiate()
	laser.position = pos
	laser.direction = dir
	laser.rotation = dir.angle()
	$Projectiles.add_child(laser)
