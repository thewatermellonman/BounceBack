extends Sprite2D

var textures: Array[Texture2D] = [
	preload("res://Red Slime.png"),
	preload("res://Slime Blue.png"),
	preload("res://Slime Green.png"),
	preload("res://Slime Yellow.png"),
	preload("res://pixil-frame-0 (1).png"),
	preload("res://Teal Slime.png")
]

func _ready() -> void:
	texture = textures.pick_random()
