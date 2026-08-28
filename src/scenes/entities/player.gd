extends CharacterBody2D
var speed: float = 100.0

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction.length() != 0:
		var potential_speed: Vector2 = direction * speed
		velocity = lerp(velocity, potential_speed, 0.2)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.2)
	
	move_and_slide()
