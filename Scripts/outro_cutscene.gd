extends CanvasLayer

@onready var outro_text = $Panel/VBoxContainer/OutroText
@onready var restart_button = $Panel/VBoxContainer/RestartButton

func _ready():
	restart_button.pressed.connect(_on_restart_pressed)

func _on_restart_pressed():
	GameState.lives = 3
	GameState.score = 0
	get_tree().change_scene_to_file("res://Scenes/intro_cutscene.tscn")
