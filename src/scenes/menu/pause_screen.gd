class_name PauseScreen extends Control
@onready var settings_screen: SettingsScreen = $settings_screen

func _on_resume_pressed() -> void:
	get_tree().paused = false
	
	if GameManager.current_view == "3d":
		Util.mouse_captured()
	else:
		Util.mouse_visible()
	
	hide()

func _on_settings_pressed() -> void:
	settings_screen.open()

func _on_exit_pressed() -> void:
	SceneChanger.change_scene("title_screen")

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

func open() -> void:
	show()

func close() -> void:
	hide()
