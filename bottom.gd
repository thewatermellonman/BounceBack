extends Area2D

@export var resetNum = 0

func _on_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
	if Globalvars.stage == 3:
		Globalvars.slime = 15
