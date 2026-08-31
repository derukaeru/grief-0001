class_name AppWindow extends Control

@export var app_name: String = ""
@export var draggable: bool = true

var dragging: bool = false

func _ready() -> void:
	open()

func open() -> void:
	EventBus.opened_app.emit(app_name)
	show()

func close() -> void:
	EventBus.closed_app.emit(app_name)
	queue_free()

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
