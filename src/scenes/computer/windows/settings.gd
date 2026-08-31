extends Control

@onready var music_slider: HSlider = $music_slider
@onready var sfx_slider: HSlider = $sfx_slider

func _ready() -> void:
	pass

func music_changed(value_changed: bool) -> void:
	if not value_changed: return
	SettingsManager.set_music(music_slider.value)

func sfx_changed(value_changed: bool) -> void:
	if not value_changed: return
	SettingsManager.set_sfx(sfx_slider.value)
