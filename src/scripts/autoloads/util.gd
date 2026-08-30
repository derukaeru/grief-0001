extends Node

func get_player() -> Node3D:
	return get_tree().get_first_node_in_group("player")
	
func get_main() -> Node3D:
	return get_tree().current_scene

func get_group_node(group):
	return get_tree().get_first_node_in_group(group)

func mouse_visible():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func mouse_captured():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
