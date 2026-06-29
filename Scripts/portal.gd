extends Area2D

const SCORE_REQUIRED = 2000

func _ready():
	visible = false
	monitoring = false

func _process(_delta):
	if GameState.score >= SCORE_REQUIRED and not visible:
		visible = true
		monitoring = true

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/outro_cutscene.tscn")
