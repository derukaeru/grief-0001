@tool
class_name File extends Button

@export var file_name: String = ""

func _ready() -> void:
	flat = true
	set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	pressed.connect(func() -> void: EventBus.open_file.emit(file_name))
