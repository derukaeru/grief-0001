class_name Computer extends Control
@onready var windows_container: Control = $windows

func _ready() -> void:
	EventBus.open_app.connect(open_app)

func open_app(app_name: String) -> void:
	if not Registry.APPS.has(app_name):
		return push_error("Registry does not have record of this app %d" % app_name)
	
	var window: AppWindow = load(Registry.APPS[app_name]).instantiate()
	windows_container.add_child(window)
	
