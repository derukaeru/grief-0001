class_name Player extends CharacterBody3D

@onready var raycast: RayCast3D = $RayCast3D
@onready var camera: Camera3D = $Camera3D
@export var gravity: float = 9.8

var mouse_sensitivity: float = 0.002
const speed: float = 4.0
var can_move: bool = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input = Vector2(Input.get_axis("left", "right"), Input.get_axis("forward", "backward"))
	if can_move:
		var direction = (camera.global_transform.basis * Vector3(input.x, 0, input.y)).normalized()
		direction.y = 0
		
		if direction.length() > 0.1:
			direction = direction.normalized()
			
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = 0
			velocity.z = 0
	
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camera.global_rotation.x -= event.relative.y * mouse_sensitivity
		camera.global_rotation.x = clamp(camera.global_rotation.x, -1.3, 1)
		camera.global_rotation.y -= event.relative.x * mouse_sensitivity

func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed and not GameManager.has_interacted:
			GameManager.has_interacted = true
			_interact()
	
	if raycast.is_colliding():
		var collider: Node = raycast.get_collider()
		if not collider is InteractableComponent: 
			raycast.add_exception(collider)
			return
		
		if collider is InteractableComponent:
			collider.interact()
			GameManager.ui.crosshair.texture = GameManager.ui.crosshair_interact_sprite
		else:
			GameManager.ui.crosshair.texture = GameManager.ui.crosshair_sprite

func _interact() -> void:
	var hit: Node = raycast.get_collider()
	if not hit: return

	if hit is InteractableComponent:
		hit.interact()

func stop_movement() -> void:
	can_move = false
	velocity = Vector3.ZERO

func set_movement() -> void:
	can_move = true
