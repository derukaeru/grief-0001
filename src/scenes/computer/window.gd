class_name AppWindow extends Control

@export var app_name: String = ""
@export var draggable: bool = true

var dragging: bool = false

func _ready() -> void:
	EventBus.opened_app.emit(app_name)

func close() -> void:
	EventBus.closed_app.emit(app_name)

func open() -> void:
	pass

func minimize() -> void:
	pass

func gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
			else:
				dragging = false
	
	if event is InputEventMouseMotion:
		pass
		# drag the window here

func _process(_delta: float) -> void:
	if dragging:
		pass
