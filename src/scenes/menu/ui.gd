class_name UI extends CanvasLayer
@onready var pause_screen: PauseScreen = $pause_screen

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if not visible: return
	
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().paused = false
			pause_screen.open()
		else:
			get_tree().paused = true
			pause_screen.close()
