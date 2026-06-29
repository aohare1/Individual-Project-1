extends CharacterBody2D

const SPEED = 300
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = direction * SPEED
	move_and_slide()

	if is_on_wall():
		direction *= -1
		$Sprite2D.flip_h = direction < 0

func _on_stomp_detector_body_entered(body):
	if body.name == "Player":
		body.velocity.y = -400
		GameState.score += 200

		set_physics_process(false)
		$CollisionShape2D.set_deferred("disabled", true)
		$StompDetector/CollisionShape2D.set_deferred("disabled", true)
		$HurtDetector/CollisionShape2D.set_deferred("disabled", true)

		var tween = create_tween()
		tween.tween_property($Sprite2D, "scale", Vector2(1.0, 0.2), 0.0)
		tween.parallel().tween_property($Sprite2D, "position:y", 20.0, 0.0)
		tween.tween_callback(queue_free)


func _on_hurt_detector_body_entered(body):
	if body.name == "Player":
		body.die()
