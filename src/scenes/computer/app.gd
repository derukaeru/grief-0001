class_name AppButton extends Button
@export var app_name: String = ""

func clicked() -> void:
	EventBus.open_app.emit(app_name)
