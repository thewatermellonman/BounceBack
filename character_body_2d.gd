extends CharacterBody2D
@export var speed: float = 100.0
@export var jump_force: float = -450.0
@export var bounce_force: float = -1500.0
@export var gravity: float = 1200.0

var slime = 0


func _physics_process(delta: float) -> void:
	
	velocity.y -= bounce_force
	velocity.y = min(velocity.y,-bounce_force)
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	
	velocity.x = lerp(velocity.x,0.0,delta *5)
	
	move_and_slide()

func _on_pickuparea_area_entered(area):
	if area.is_in_group("slime"):
		area.queue_free()
		slime += 1
		$CanvasLayer/SlimeCount.text = "Slimes Collected: " + str(slime)


func _on_pickup_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("bounce"):
		for i in 20:
			velocity.y = bounce_force * 2
			await get_tree().process_frame
			velocity.y = bounce_force * 2
	
