extends CharacterBody2D
@export var speed = 400

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	move_and_slide()


func _on_pickuparea_area_entered(area):
	if area.is_in_group("slime"):
		area.queue_free()
