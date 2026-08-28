extends Node2D
@onready var map_container: Node2D = $map_container

var current_map: String = ""

func _ready() -> void:
	GameManager.ui.show()
	EventBus.move_to.connect(move_to)

func move_to(map: String) -> void:
	EventBus.moved.emit(map, current_map)
