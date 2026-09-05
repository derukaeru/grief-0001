class_name AudioFileWindow extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var app_name_label: Label = $top_bar/app_name

@onready var progress: ProgressBar = $content/progress
@onready var audiostream: AudioStreamPlayer = $content/AudioStreamPlayer

@export var app_name: String = ""
@export var audio: AudioStream = null

@export var draggable: bool = true

var dragging: bool = false
var seek_step: float = 2.5

func _ready() -> void:
	open()
	
	if audio:
		audiostream.stream = audio
	progress.max_value = audio.get_length() if audio else 0.0

func open() -> void:
	EventBus.opened_app.emit(app_name)
	show()
	animation.play("open")

func close() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	queue_free()
	EventBus.closed_app.emit(app_name)

func minimize() -> void:
	hide()

func top_bar_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				focus()
			else:
				dragging = false
	
	if not draggable: return
	if event is InputEventMouseMotion and dragging:
		global_position += event.relative

func focus() -> void:
	get_parent().move_child(self, get_parent().get_child_count() - 1)

func clamp_to_bounds() -> void:
	var bounds: Rect2 = get_parent().get_rect()
	global_position.x = clamp(global_position.x, bounds.position.x, bounds.position.x + bounds.size.x - size.x)
	global_position.y = clamp(global_position.y, bounds.position.y, bounds.position.y + bounds.size.y - size.y)

func toggle(on: bool) -> void: 
	if on:
		audiostream.play(progress.value)
	else:
		progress.value = audiostream.get_playback_position()
		audiostream.stop()

func rewind() -> void:
	var new_pos: float = max(audiostream.get_playback_position() - seek_step, 0.0)
	audiostream.seek(new_pos)
	progress.value = new_pos

func fast_forward() -> void:
	var new_pos: float = min(audiostream.get_playback_position() + seek_step, audio.get_length())
	audiostream.seek(new_pos)
	progress.value = new_pos
