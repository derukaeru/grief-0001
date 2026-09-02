@tool

class_name ZipFile extends Button
@export var zip_name: String = ""

func _ready() -> void:
	flat = true
	set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	pressed.connect(func() -> void: EventBus.open_zip.emit(zip_name))
