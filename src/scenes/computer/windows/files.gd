extends Control

@onready var password_label: LineEdit = $lockscreen/password
@onready var lockscreen_animation: AnimationPlayer = $lockscreen/AnimationPlayer
@onready var lockscreen: ColorRect = $lockscreen

@onready var folders: Dictionary[String, ColorRect] = {
	"main_files": $main_files,
	"new_folder": $new_folder
}

var password: String = "12202008"

func _ready() -> void:
	EventBus.open_folder.connect(open_folder)
	EventBus.open_file.connect(open_file)
	EventBus.close_folder.connect(close_folder)
	
	password_label.max_length = password.length()
	if GameManager.file_manager_open:
		lockscreen.hide()

func open_file(file_name: String) -> void:
	if Registry.APPS.has(file_name):
		EventBus.open_app.emit(file_name)
	elif Registry.UID.has(file_name):
		GameManager.current_map = file_name
		SceneChanger.change_scene_immediate("main")

func open_folder(folder_name: String) -> void:
	if not folders.has(folder_name): 
		return push_error("Folders does not have record of %s" % folder_name)
	folders[folder_name].show()

func close_folder(folder_name: String) -> void:
	if not folders.has(folder_name): 
		return push_error("Folders does not have record of %s" % folder_name)
	
	folders[folder_name].hide()

func unlock(new_pass: String = password_label.text) -> void:
	if new_pass == password:
		lockscreen_animation.play("open")
		password_label.text = ""
		GameManager.file_manager_open = true
		await lockscreen_animation.animation_finished
		lockscreen.hide()
		
	else:
		lockscreen_animation.play("wrong")
		password_label.text = ""
