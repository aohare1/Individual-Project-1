extends CanvasLayer

@onready var story_text = $Panel/VBoxContainer/StoryText
@onready var continue_button = $Panel/VBoxContainer/ContinueButton

func _ready():
	continue_button.pressed.connect(_on_continue_pressed)

func _on_continue_pressed():
	get_tree().change_scene_to_file("res://Scenes/1_1.tscn")
