extends Node3D

@onready var map_container: Node3D = $map_container
var current_map: String = ""

func _ready() -> void:
	EventBus.move_to.connect(change_map)
	
	GameManager.ui.pause_screen.close()
	GameManager.ui.show()
	
	Util.mouse_captured()
	GameManager.current_view = "3d"
	GameManager.ui.crosshair.show()
	
	if Registry.UID.has(GameManager.current_map):
		var map_name: String = GameManager.current_map
		for entry in map_container.get_children():
			entry.queue_free()
		
		var new_map: Node3D = load(Registry.UID[map_name]).instantiate()
		map_container.add_child(new_map)
		
		current_map = GameManager.current_map

func change_map(to: String, from: String = current_map) -> void:
	if not Registry.UID.has(to): 
		return push_error("Registry does not have a record of this map %s" % to) 
	
	for entry in map_container.get_children():
		entry.queue_free()
	
	GameManager.ui.show_map_transition()
	await GameManager.ui.map_transition_done
	
	var new_map: Node3D = load(Registry.MAPS[to]).instantiate()
	map_container.add_child(new_map)
	
	EventBus.moved.emit(to, from)
	current_map = to
	
	GameManager.ui.hide_map_transition()
