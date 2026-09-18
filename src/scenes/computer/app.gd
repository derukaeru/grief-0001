class_name AppButton extends TextureButton

@export var app_name: String = ""
@export var type: File.FILE_TYPES

func clicked() -> void:
	EventBus.open_app.emit(app_name)
