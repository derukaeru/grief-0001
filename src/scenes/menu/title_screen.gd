extends Control
@onready var settings_screen: SettingsScreen = $settings_screen

func _ready() -> void:
	Util.mouse_visible()
	get_tree().paused = false
	GameManager.ui.hide()

func mouse_entered(source: Button) -> void:
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(source, "scale", Vector2(1.05, 1.05), 0.15)

func mouse_exited(source: Button) -> void:
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(source, "scale", Vector2(1.0, 1.0), 0.15)

func mouse_pressed(source: Button) -> void:
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(source, "scale", Vector2(0.9, 0.9), 0.15)
	tw.tween_property(source, "scale", Vector2(1.0, 1.0), 0.15)

func start_pressed() -> void:
	SceneChanger.change_scene("computer")

func settings_pressed() -> void:
	settings_screen.open()

func exit_pressed() -> void:
	get_tree().quit()
