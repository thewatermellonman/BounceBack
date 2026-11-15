extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("start") and Globalvars.stage == 5:
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Boss.tscn")
