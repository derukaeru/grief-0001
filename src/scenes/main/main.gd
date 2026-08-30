extends Node3D

@onready var map_container: Node3D = $map_container
var current_map: String = ""

func _ready() -> void:
	EventBus.move_to.connect(change_map)
	
	GameManager.ui.pause_screen.close()
	GameManager.ui.show()
	
	Util.mouse_captured()

func change_map(to: String, from: String = current_map) -> void:
	for entry in map_container.get_children():
		entry.queue_free()
	
	EventBus.moved.emit(to, from)
	current_map = to
