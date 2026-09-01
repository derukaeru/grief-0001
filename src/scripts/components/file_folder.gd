@tool

class_name FileFolder extends Button
@export var folder_name: String = ""

func _ready() -> void:
	flat = true
	set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	pressed.connect(func() -> void: EventBus.open_folder.emit(folder_name))
