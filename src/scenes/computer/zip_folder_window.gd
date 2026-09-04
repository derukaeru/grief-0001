class_name ZipFolderWindow extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var lock_cover: ColorRect = $content/lock_cover
@onready var password_label: LineEdit = $content/lock_cover/password
@onready var lockscreen_animation: AnimationPlayer = $content/lock_cover/AnimationPlayer
@onready var app_name_label: Label = $top_bar/app_name

@export var app_name: String = ""
@export var draggable: bool = true

@export var locked: bool = false
@export var password: String = ""

var app_name_require: String = "- requires password"

func _ready() -> void:
	open()
	
	if locked:
		lock_cover.show()
		app_name_label.text = app_name_label.text + app_name_require
	
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
	animation.play_backwards("open")
	await animation.animation_finished
	hide()

func top_bar_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				focus()
			else:
				dragging = false
	
	if not draggable: return
	if event is InputEventMouseMotion and dragging:
		global_position += event.relative

func focus() -> void:
	get_parent().move_child(self, get_parent().get_child_count() - 1)

func submit(new_text: String = password_label.text) -> void:
	if password == new_text:
		app_name_label.text = app_name_label.text.trim_suffix(app_name_require)
		lock_cover.hide()
	else:
		password_label.text = ""
		lockscreen_animation.play("wrong")

func clamp_to_bounds() -> void:
	var bounds: Rect2 = get_parent().get_rect()
	global_position.x = clamp(global_position.x, bounds.position.x, bounds.position.x + bounds.size.x - size.x)
	global_position.y = clamp(global_position.y, bounds.position.y, bounds.position.y + bounds.size.y - size.y)
