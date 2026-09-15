class_name Player extends CharacterBody3D

@onready var raycast: RayCast3D = $Camera3D/RayCast3D
@onready var camera: Camera3D = $Camera3D
@export var gravity: float = 9.8

var mouse_sensitivity: float = 0.002
const speed: float = 4.0
var can_move: bool = true

@export var camera_damping: float = 12.0
var target_rotation_x: float = 0.0
var target_rotation_y: float = 0.0

func _ready() -> void:
	target_rotation_x = camera.global_rotation.x
	target_rotation_y = camera.global_rotation.y

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
	
	camera.global_rotation.x = lerp_angle(camera.global_rotation.x, target_rotation_x, camera_damping * delta)
	camera.global_rotation.y = lerp_angle(camera.global_rotation.y, target_rotation_y, camera_damping * delta)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		target_rotation_x -= event.relative.y * mouse_sensitivity
		target_rotation_x = clamp(target_rotation_x, -1.3, 1)
		target_rotation_y -= event.relative.x * mouse_sensitivity

func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			_interact()
	
	if raycast.is_colliding():
		var collider: Node = raycast.get_collider()
		if not collider is InteractableComponent: 
			raycast.add_exception(collider)
			return
		
		if collider is InteractableComponent:
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
