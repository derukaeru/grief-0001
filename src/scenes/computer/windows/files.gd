extends Control

@onready var password_label: LineEdit = $lockscreen/password
@onready var lockscreen_animation: AnimationPlayer = $lockscreen/AnimationPlayer
@onready var lockscreen: ColorRect = $lockscreen

@onready var folders: Dictionary[String, ColorRect] = {
	"main_files": $main_files,
	"new_folder": $new_folder
}

var password: String = "12202008"
var regex = RegEx.new()

func _ready() -> void:
	regex.compile("^[0-9]*$")
	EventBus.open_folder.connect(open_folder)
	EventBus.close_folder.connect(close_folder)
	
	password_label.max_length = password.length()
	if GameManager.file_manager_open:
		lockscreen.hide()

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

func _on_text_changed(new_text: String) -> void:
	if not regex.isValid(new_text):
		var current_caret = password_label.caret_column
		
		var filtered_text = ""
		for i in range(new_text.length()):
			if regex.isValid(new_text[i]):
				filtered_text += new_text[i]
		
		password_label.text = filtered_text
		password_label.caret_column = current_caret - 1
