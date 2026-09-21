@tool
class_name File extends Button

enum FILE_TYPES {
	IMAGE,
	AUDIO,
	DOC,
	APP,
	EXE,
	ZIP
}

@export var file_name: String = "" 
@export var file_type: FILE_TYPES = FILE_TYPES.APP
@export var file_extension: String = ""

func _ready() -> void:
	set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	pressed.connect(func() -> void: EventBus.open_file.emit(file_name, file_type, file_extension))
