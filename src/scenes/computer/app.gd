class_name AppButton extends Button
@export var app_name: String = ""

var open: bool = false

func _ready() -> void:
	EventBus.opened_app.connect(func(apn: String) -> void: open = true if app_name == apn else open)
	EventBus.closed_app.connect(func(apn: String) -> void: open = false if app_name == apn else open)

func clicked() -> void:
	if open: return
	EventBus.open_app.emit(app_name)
