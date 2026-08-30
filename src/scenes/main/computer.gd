class_name Computer extends Control
@onready var windows_container: Control = $windows

@onready var password_label: LineEdit = $lock_screen/password
@onready var lockscreen: Control = $lock_screen
@onready var lockscreen_animation: AnimationPlayer = $lock_screen/AnimationPlayer

var password: String = "grief"

func _ready() -> void:
	EventBus.open_app.connect(open_app)

func open_app(app_name: String) -> void:
	if not Registry.APPS.has(app_name):
		return push_error("Registry does not have record of this app %d" % app_name)
	
	var window: AppWindow = load(Registry.APPS[app_name]).instantiate()
	windows_container.add_child(window)
	
func unlock() -> void:
	if password == password_label.text:
		lockscreen_animation.play("open")
		await lockscreen_animation.animation_finished
		lockscreen.hide()
	else:
		password_label.text = ""
		lockscreen_animation.play("wrong")
