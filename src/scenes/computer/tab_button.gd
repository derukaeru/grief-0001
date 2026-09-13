class_name TabButton extends TextureButton
@onready var indicator: ColorRect = $indicator

var window_name: String
var window_type: File.FILE_TYPES

func _ready() -> void:
	var icon
	match window_type:
		File.FILE_TYPES.IMAGE:
			icon = load(Registry.APP_ICONS.image)
		File.FILE_TYPES.DOC:
			icon = load(Registry.APP_ICONS.doc)
		File.FILE_TYPES.AUDIO:
			icon = load(Registry.APP_ICONS.audio)
		File.FILE_TYPES.EXE:
			icon = load(Registry.APP_ICONS.exe)
		File.FILE_TYPES.APP:
			if not Registry.APP_ICONS.has(window_name):
				icon = load(Registry.APP_ICONS.app)
			else:
				icon = load(Registry.APP_ICONS[window_name])
		_:
			icon = load(Registry.APP_ICONS.app)
	
	texture_normal = icon
	
	EventBus.minimized_window.connect(minimize)
	EventBus.opened_window.connect(opened)

func opened(owindow_name: String) -> void:
	if window_name == owindow_name:
		indicator.show()

func minimize(owindow_name: String) -> void:
	if window_name == owindow_name:
		indicator.hide()

func pressed() -> void:
	EventBus.open_window.emit(window_name)
