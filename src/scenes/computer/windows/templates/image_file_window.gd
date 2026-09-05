class_name ImageFileWindow extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var app_name_label: Label = $top_bar/app_name
@onready var image: TextureRect = $content/image

@export var app_name: String = ""
@export var draggable: bool = true
@export var texture: Texture2D = null

const min_image_size: Vector2 = Vector2(96, 96)
const max_image_size: Vector2 = Vector2(320, 320)

var dragging: bool = false
var opened: bool = false

func _ready() -> void:
	if texture: 
		image.texture = texture
		resize()
	open()

func resize() -> void:
	# TODO: ts might need fixing
	
	var natural_size: Vector2 = texture.get_size()
	var target_size: Vector2 = natural_size.clamp(min_image_size, max_image_size)
	
	var scale_factor: float = min(target_size.x / natural_size.x, target_size.y / natural_size.y)
	var final_size: Vector2 = natural_size * scale_factor
	final_size = final_size.clamp(min_image_size, max_image_size)
	
	size = final_size
	size.y += 11.0
	
	image.custom_minimum_size = final_size

func open() -> void:
	if opened: return
	EventBus.opened_app.emit(app_name)
	show()
	animation.play("open")
	opened = true

func close() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	queue_free()
	EventBus.closed_app.emit(app_name)
	opened = false

func minimize() -> void:
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
		clamp_to_bounds()

func focus() -> void:
	get_parent().move_child(self, get_parent().get_child_count() - 1)

func clamp_to_bounds() -> void:
	var bounds: Rect2 = get_parent().get_rect()
	global_position.x = clamp(global_position.x, bounds.position.x, bounds.position.x + bounds.size.x - size.x)
	global_position.y = clamp(global_position.y, bounds.position.y, bounds.position.y + bounds.size.y - size.y)
