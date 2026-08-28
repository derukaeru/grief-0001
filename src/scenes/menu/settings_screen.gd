class_name SettingsScreen extends Control
@onready var animation: AnimationPlayer = $AnimationPlayer

func open() -> void:
	pass

func close() -> void:
	pass

func mouse_entered(source: Button) -> void:
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(source, "scale", Vector2(1.1, 1.1), 0.15)

func mouse_exited(source: Button) -> void:
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(source, "scale", Vector2(1.0, 1.0), 0.15)

func mouse_pressed(source: Button) -> void:
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(source, "scale", Vector2(0.9, 0.9), 0.15)
	tw.tween_property(source, "scale", Vector2(1.0, 1.0), 0.15)
