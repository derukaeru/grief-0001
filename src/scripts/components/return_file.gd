@tool
class_name ReturnFile extends Button

@export var folder_name: String = ""

func _ready() -> void:
	flat = true
	set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	pressed.connect(func() -> void: EventBus.close_folder.emit(folder_name))
