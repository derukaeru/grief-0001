class_name UI extends CanvasLayer
@onready var pause_screen: PauseScreen = $pause_screen
@onready var map_transition: ColorRect = $map_transition
@onready var map_animation: AnimationPlayer = $map_transition/map_animation

@onready var display: Control = $display
@onready var move_buttons: Control = $display/move_buttons

@onready var crosshair: TextureRect = $crosshair

var crosshair_sprite: CompressedTexture2D = load(Registry.UID.crosshair)
var crosshair_interact_sprite: CompressedTexture2D = load(Registry.UID.crosshair_interact)

func _process(_delta: float) -> void:
	if not visible: return
	
	if Input.is_action_just_pressed("ui_cancel") and GameManager.current_view == "3d":
		if get_tree().paused:
			get_tree().paused = false
			Util.mouse_captured()
			pause_screen.close()
		else:
			get_tree().paused = true
			pause_screen.open()
			Util.mouse_visible()

func show_map_transition() -> void:
	map_transition.show()
	map_animation.play("toggle")

func hide_map_transition() -> void:
	map_animation.play_backwards("toggle")
	await map_animation.animation_finished
	
	map_transition.hide()
