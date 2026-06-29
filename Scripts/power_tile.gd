extends StaticBody2D

var hits = 0
const MAX_HITS = 3
const POINTS_PER_HIT = 100

func hit():
	if hits >= MAX_HITS:
		return

	hits += 1
	GameState.score += POINTS_PER_HIT

	var tween = create_tween()
	tween.tween_property(self, "position:y", position.y - 8.0, 0.05)
	tween.tween_property(self, "position:y", position.y, 0.05)

	if hits >= MAX_HITS:
		$Sprite2D.modulate = Color(0.4, 0.4, 0.4)

func _on_bottom_detector_body_entered(body):
	if body.name == "Player" and body.global_position.y > global_position.y:
		hit()
