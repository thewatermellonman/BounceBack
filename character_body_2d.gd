extends CharacterBody2D
@export var speed = 100

var slime = 0

func _physics_process(delta: float) -> void:
	
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
