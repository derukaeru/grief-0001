class_name MessageBubble extends PanelContainer
@onready var label: RichTextLabel = $label

const MAX_WIDTH := 200.0
var them := false

func set_text(text: String = "") -> void:
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.fit_content = true
	
	var font := label.get_theme_font("font")
	var font_size := label.get_theme_font_size("font_size")
	
	var natural_width := font.get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x
	#label.custom_minimum_size.x = min(natural_width, MAX_WIDTH)
	custom_minimum_size.x = min(natural_width, MAX_WIDTH)
	
	var style := get_theme_stylebox("panel").duplicate()
	
	if not them:
		style.bg_color = Color("6b8f5dff")
		style.border_color = Color("6b8f5dff")
	
	add_theme_stylebox_override("panel", style)
