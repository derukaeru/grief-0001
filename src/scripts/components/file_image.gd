@tool

class_name FileImage extends Button
@export var image_name: String = ""

func _ready() -> void:
	flat = true
	set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	pressed.connect(func() -> void: EventBus.open_image.emit(image_name))
