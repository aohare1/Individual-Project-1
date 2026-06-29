extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -1000

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta * 2.5

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * SPEED
		$Sprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if global_position.y > 700:
		die()

func _ready():
	GameState.respawn_position = $"../SpawnPoint".global_position

func die():
	if is_dead:
		return
	is_dead = true
	GameState.take_damage()
