class_name MapSwitcher extends InteractableComponent

@export var from: String
@export var to: String

func _ready() -> void:
	interacted.connect(switch)

func switch() -> void:
	pass
