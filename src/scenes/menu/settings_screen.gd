class_name SettingsScreen extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var music_slider: HSlider = $music_slider
@onready var sfx_slider: HSlider = $sfx_slider

func open() -> void:
	show()
	music_slider.value = SettingsManager.music_strength
	sfx_slider.value = SettingsManager.sound_effect_strength

func close() -> void:
	hide()

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

func music_changed(value_changed: bool) -> void:
	if not value_changed: return
	SettingsManager.set_music(music_slider.value)

func sfx_changed(value_changed: bool) -> void:
	if not value_changed: return
	SettingsManager.set_sfx(sfx_slider.value)
