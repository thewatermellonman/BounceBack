extends Sprite2D

const FIRST_TEXTURE = preload("res://Heart Full.png")
const LAST_TEXTURE = preload("res://Heart Empty.png")

func swap_texture():
	texture = FIRST_TEXTURE

func _on_player_dead() -> void:
	texture = LAST_TEXTURE
