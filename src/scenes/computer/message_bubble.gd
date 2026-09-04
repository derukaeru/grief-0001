class_name MessageBubble extends PanelContainer
@onready var label: Label = $label

const max_width: float = 200.0
var them: bool = true

func _ready() -> void:
	pass

func set_text(text: String = "") -> void:
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	
	var font: Font = label.get_theme_font("font")
	var font_size: int = label.get_theme_font_size("font_size")
	var natural_width: float = font.get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x
	
	if natural_width > max_width:
		label.custom_minimum_size.x = max_width
	else:
		label.custom_minimum_size.x = 0
	
