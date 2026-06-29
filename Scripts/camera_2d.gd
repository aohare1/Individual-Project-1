extends Camera2D

@export var player: NodePath
var _player: CharacterBody2D

func _ready():
	_player = get_node(player)

func _process(_delta):
	global_position.x = _player.global_position.x
