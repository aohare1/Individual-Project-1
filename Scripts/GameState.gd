extends Node

var lives = 3
var score = 0
var respawn_position = Vector2.ZERO

func take_damage():
	lives -= 1
	if lives <= 0:
		lives = 3
		score = 0
	call_deferred("_reload")

func _reload():
	get_tree().reload_current_scene()
