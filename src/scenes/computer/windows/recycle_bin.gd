extends Control

@onready var files: VBoxContainer = $files

func _ready() -> void:
	EventBus.open_file.connect(open_file)

func open_file(file_name: String, from: String) -> void:
	if from != "recycle_bin": return
	if Registry.APPS.has(file_name):
		EventBus.open_app.emit(file_name)
