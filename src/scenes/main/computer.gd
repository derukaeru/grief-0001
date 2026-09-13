class_name Computer extends Control
@onready var windows_container: Control = $windows

@onready var password_label: LineEdit = $lock_screen/password
@onready var lockscreen: Control = $lock_screen
@onready var lockscreen_animation: AnimationPlayer = $lock_screen/AnimationPlayer

@onready var time_label: Label = $action_bar/time
@onready var computer_open_sfx: AudioStreamPlayer = $computer_open

@onready var tabs: HBoxContainer = $action_bar/tabs_scroll/tabs

var password: String = "griefed"
var windows: Dictionary = {}
var window_tabs: Dictionary = {}

func _ready() -> void:
	EventBus.open_app.connect(open_app)
	EventBus.open_window.connect(open_window)
	EventBus.closed_window.connect(closed_window)
	
	EventBus.open_zip.connect(open_zip)
	
	EventBus.open_audio.connect(open_audio)
	EventBus.open_image.connect(open_image)
	
	EventBus.open_file.connect(open_file)
	
	GameManager.ui.pause_screen.close()
	GameManager.ui.hide()
	
	Util.mouse_visible()
	GameManager.current_view = "computer"
	
	password_label.max_length = password.length()
	if GameManager.computer_open:
		lockscreen.hide()

func open_app(app_name: String) -> void:
	if not Registry.APPS.has(app_name):
		return push_error("Registry does not have record of this app %s" % app_name)
	
	if windows.has(app_name):
		windows[app_name].open()
	else:
		var window: AppWindow = load(Registry.APPS[app_name]).instantiate()
		windows_container.add_child(window)
		windows.set(window.app_name, window)
		
		add_tab(app_name, File.FILE_TYPES.APP)

func open_window(window_name: String) -> void:
	windows[window_name].open()

func closed_window(app_name: String) -> void:
	windows.erase(app_name)
	
	remove_tab(app_name)

func open_file(file_name: String, file_type: File.FILE_TYPES) -> void:
	match file_type:
		File.FILE_TYPES.APP:
			open_app(file_name)
		File.FILE_TYPES.DOC:
			open_doc(file_name)
		File.FILE_TYPES.AUDIO:
			open_audio(file_name)
		File.FILE_TYPES.IMAGE:
			open_image(file_name)
		File.FILE_TYPES.EXE:
			if Registry.UID.has(file_name):
				GameManager.current_map = file_name
				SceneChanger.change_scene_immediate("main")
			else:
				push_error("Registry.UID does not have a record of the exe file: %s" % file_name)
	
	add_tab(file_name, file_type)

func open_zip(zip_name: String) -> void:
	if not Registry.ZIPS.has(zip_name):
		return push_error("Registry does not have record of this zip %s" % zip_name)
	
	if windows.has(zip_name):
		windows[zip_name].open()
	else:
		var window: ZipFolderWindow = load(Registry.ZIPS[zip_name]).instantiate()
		windows_container.add_child(window)
		
		windows.set(zip_name, window)
		add_tab(zip_name, File.FILE_TYPES.ZIP)

func open_image(image_name: String) -> void:
	if not Registry.IMAGES.has(image_name):
		return push_error("Registry does not have record of this image %s" % image_name)
	
	if windows.has(image_name):
		windows[image_name].open()
	else:
		var image_window: ImageFileWindow = load(Registry.UID.image_file_window).instantiate()
		windows_container.add_child(image_window)
		
		image_window.app_name = image_name
		image_window.app_name_label.text = image_name
		image_window.image.texture = load(Registry.IMAGES[image_name])
		
		windows.set(image_name, image_window)

func open_audio(audio_name: String) -> void:
	if not Registry.AUDIOS.has(audio_name):
		return push_error("Registry does not have record of this audio %s" % audio_name)
	
	if windows.has(audio_name):
		windows[audio_name].open()
	else:
		var audio_window: AudioFileWindow = load(Registry.UID.audio_file_window).instantiate()
		windows_container.add_child(audio_window)
		
		audio_window.app_name = audio_name
		audio_window.app_name_label.text = audio_name
		audio_window.audio = load(Registry.AUDIOS[audio_name])
		
		windows.set(audio_window.app_name, audio_window)

func open_doc(doc_name: String) -> void:
	if not Registry.DOCS.has(doc_name):
		return push_error("Registry does not have record of this document %s" % doc_name)
	
	if windows.has(doc_name):
		windows[doc_name].open()
	else:
		var doc_window: DocFileWindow = load(Registry.UID.doc_file_window).instantiate()
		windows_container.add_child(doc_window)
		
		doc_window.app_name = doc_name
		doc_window.app_name_label.text = doc_name
		doc_window.label.text = Registry.DOCS[doc_name]
		
		windows.set(doc_window.app_name, doc_window)

func add_tab(file_name: String, file_type: File.FILE_TYPES) -> void:
	if window_tabs.has(file_name):
		return
		
	var tab_button: TabButton = load(Registry.UID.tab_button).instantiate()
	tab_button.window_name = file_name
	tab_button.window_type = file_type
	
	tabs.add_child(tab_button)
	window_tabs.set(file_name, tab_button)
	
	print(file_name)

func remove_tab(tab_name: String) -> void:
	window_tabs[tab_name].queue_free()
	window_tabs.erase(tab_name)

func unlock(_text: String = "") -> void:
	if password == password_label.text:
		lockscreen_animation.play("open")
		password_label.text = ""
		GameManager.computer_open = true
		computer_open_sfx.play()
		
		await lockscreen_animation.animation_finished
		lockscreen.hide()
	else:
		password_label.text = ""
		lockscreen_animation.play("wrong")

func _process(_delta: float) -> void:
	time_label.text = str(Time.get_time_string_from_system()).left(5)
