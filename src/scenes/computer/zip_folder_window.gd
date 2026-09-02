class_name ZipFolderWindow extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var lock_cover: ColorRect = $content/lock_cover
@onready var password_label: LineEdit = $content/lock_cover/password
@onready var lockscreen_animation: AnimationPlayer = $content/lock_cover/AnimationPlayer

@export var app_name: String = ""
@export var draggable: bool = true

@export var locked: bool = false
@export var password: String = ""

func _ready() -> void:
	open()
	
	if locked:
		lock_cover.show()
	password_label.max_length = password.length()

var dragging: bool = false

func open() -> void:
	EventBus.opened_app.emit(app_name)
	show()
	animation.play("open")

func close() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	queue_free()
	EventBus.closed_app.emit(app_name)

func minimize() -> void:
	hide()

func top_bar_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
			else:
				dragging = false
	
	if not draggable: return
	if event is InputEventMouseMotion and dragging:
		global_position += event.relative

func submit(new_text: String = password_label.text) -> void:
	if password == new_text:
		lockscreen_animation.play("open")
		await lockscreen_animation.animation_finished
		lock_cover.hide()
	else:
		password_label.text = ""
		lockscreen_animation.play("wrong")
