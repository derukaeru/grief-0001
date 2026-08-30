extends CharacterBody3D

const speed: float = 100.0

func _ready() -> void:
	EventBus.turn_left.connect(turn_left)
	EventBus.turn_right.connect(turn_right)

func _physics_process(_delta: float) -> void:
	pass

func turn_left() -> void:
	pass
	
func turn_right() -> void:
	pass
