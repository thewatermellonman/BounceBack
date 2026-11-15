extends Sprite2D

var alive: int = 1

@export var min_wait: float = 1.0
@export var max_wait: float = 5.0

const FIRST_TEXTURE = preload("res://Slime King Weak.png")
const READY_TEXTURE = preload("res://Slime King Charge.png")
const EAT_TEXTURE = preload("res://Slime King Nom Nom.png")
const LAST_TEXTURE = preload("res://Slime King KO.png")

signal chomp()
signal no_chomp()

func _ready() -> void:
	random_sprite_loop()

func swap_texture() -> void:
	texture = FIRST_TEXTURE

func random_sprite_loop() -> void:
	while is_inside_tree() and alive == 1:
		var delay = randf_range(min_wait, max_wait)
		await get_tree().create_timer(delay).timeout
		if alive != 1: break
			
		texture = READY_TEXTURE
		await get_tree().create_timer(2.0).timeout
		if alive != 1: break
			
		texture = EAT_TEXTURE
		chomp.emit()
		await get_tree().create_timer(4.0).timeout
		if alive != 1: break
			
		texture = FIRST_TEXTURE
		no_chomp.emit()

func _on_player_dead() -> void:
	alive = 0
	texture = LAST_TEXTURE
