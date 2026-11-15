extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("start"):
		get_tree().change_scene_to_file("res://Stage 0.tscn")
