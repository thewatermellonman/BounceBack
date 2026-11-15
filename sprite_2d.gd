extends Sprite2D

@export var jump_height: float = 60.0
@export var jump_duration: float = 0.25
@export var min_wait: float = 1.0
@export var max_wait: float = 3.5

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_timer: float = 0.0

var textures: Array[Texture2D] = [
	preload("res://Red Slime.png"),
	preload("res://Slime Blue.png"),
	preload("res://Slime Green.png"),
	preload("res://Slime Yellow.png"),
	preload("res://pink slime.png"),
	preload("res://Teal Slime.png")
]

func _ready() -> void:
	texture = textures.pick_random()
	random_jump_loop()

func random_jump_loop() -> void:
	while is_inside_tree():
		var delay = randf_range(min_wait, max_wait)
		await get_tree().create_timer(delay).timeout
		
		var ground_y = position.y
		
		var tween = create_tween()
		tween.tween_property(self, "position:y", ground_y - jump_height, jump_duration)\
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "position:y", ground_y, jump_duration)\
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
			
		await tween.finished
