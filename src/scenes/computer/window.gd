class_name AppWindow extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var folders: Dictionary[String, VBoxContainer] = {
	"new_folder": $content/new_folder
}

@export var app_name: String = ""
@export var draggable: bool = true

var dragging: bool = false

func _ready() -> void:
	open()

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
			else:
				dragging = false
	
	if not draggable: return
	if event is InputEventMouseMotion and dragging:
		global_position += event.relative
