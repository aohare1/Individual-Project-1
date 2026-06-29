extends CanvasLayer

@onready var lives_label = $VBoxContainer/LivesLabel
@onready var score_label = $VBoxContainer/ScoreLabel

func _process(_delta):
	lives_label.text = "LIVES: " + str(GameState.lives)
	score_label.text = "SCORE: " + str(GameState.score)
