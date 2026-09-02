class_name Computer extends Control
@onready var windows_container: Control = $windows

@onready var password_label: LineEdit = $lock_screen/password
@onready var lockscreen: Control = $lock_screen
@onready var lockscreen_animation: AnimationPlayer = $lock_screen/AnimationPlayer

@onready var time_label: Label = $action_bar/time

var password: String = "griefed"
var windows: Dictionary[String, AppWindow] = {}

func _ready() -> void:
	EventBus.open_app.connect(open_app)
	EventBus.closed_app.connect(closed_app)
	
	GameManager.ui.pause_screen.close()
	GameManager.ui.show()
	
	Util.mouse_visible()
	GameManager.current_view = "computer"
	GameManager.ui.crosshair.hide()
	
	password_label.max_length = password.length()

func open_app(app_name: String) -> void:
	if not Registry.APPS.has(app_name):
		return push_error("Registry does not have record of this app %s" % app_name)
	
	if windows.has(app_name):
		windows[app_name].open()
	else:
		var window: AppWindow = load(Registry.APPS[app_name]).instantiate()
		windows_container.add_child(window)
		
		windows.set(window.app_name, window)

func unlock(_text: String = "") -> void:
	if password == password_label.text:
		lockscreen_animation.play("open")
		await lockscreen_animation.animation_finished
		lockscreen.hide()
	else:
		password_label.text = ""
		lockscreen_animation.play("wrong")

func closed_app(app_name: String) -> void:
	windows.erase(app_name)

func _process(_delta: float) -> void:
	time_label.text = str(Time.get_time_string_from_system()).left(5)
