extends CharacterBody2D
@export var speed: float = 100.0
@export var jump_force: float = -450.0
@export var bounce_force: float = -1500.0
@export var gravity: float = 1200.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.y -= bounce_force
	velocity.y = min(velocity.y,-bounce_force)
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	
	velocity.x = lerp(velocity.x,0.0,delta *5)
	
	move_and_slide()

func _ready():
	$CanvasLayer/SlimeCount.text = "Slimes Collected: " + str(Globalvars.slime)

func _on_pickuparea_area_entered(area):
	if area.is_in_group("slime"):
		area.queue_free()
		Globalvars.slime +=1
		$CanvasLayer/SlimeCount.text = "Slimes Collected: " + str(Globalvars.slime)
		if Globalvars.slime == 9:
			Globalvars.stage += 1
			bounce_force = -1000.0
			get_tree().change_scene_to_file("res://Stage 2.tscn")
		elif Globalvars.slime == 15:
			Globalvars.stage += 1
			get_tree().change_scene_to_file("res://Stage 3.tscn")
			

func _on_pickup_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("bounce"):
		for i in 20:
			velocity.y = bounce_force * 2
			await get_tree().process_frame
			velocity.y = bounce_force * 2
	
