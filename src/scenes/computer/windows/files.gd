extends Control

@onready var folders: Dictionary[String, VBoxContainer] = {
	"main_files": $main_files,
	"new_folder": $new_folder
}

func _ready() -> void:
	EventBus.open_folder.connect(open_folder)
	EventBus.open_file.connect(open_file)

func open_file(file_name: String) -> void:
	if Registry.APPS.has(file_name):
		EventBus.open_app.emit(file_name)
	elif Registry.UID.has(file_name):
		GameManager.current_map = file_name
		SceneChanger.change_scene_immediate("main")

func open_folder(folder_name: String) -> void:
	if not folders.has(folder_name): 
		return push_error("Folders does not have record of %s" % folder_name)
	
	for entry in folders.values():
		entry.hide()
	
	folders[folder_name].show()

func open_zip() -> void:
	pass
