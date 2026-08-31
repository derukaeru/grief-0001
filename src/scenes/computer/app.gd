class_name AppButton extends TextureButton
@export var app_name: String = ""

func clicked() -> void:
	EventBus.open_app.emit(app_name)
