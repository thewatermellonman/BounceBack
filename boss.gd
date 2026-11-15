extends Area2D

signal boss_hit()

func _on_body_entered(body):
	if body is CharacterBody2D and not body.is_on_floor():
		boss_hit.emit()
