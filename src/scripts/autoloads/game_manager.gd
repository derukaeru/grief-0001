extends Node

@onready var ui: UI = load(Registry.UID.ui).instantiate()
var canvas_layer = CanvasLayer.new()

func _ready() -> void:
	add_child(canvas_layer)
	canvas_layer.layer = 5
	canvas_layer.add_child(ui)
	
	ui.hide()
	process_mode = Node.PROCESS_MODE_ALWAYS
