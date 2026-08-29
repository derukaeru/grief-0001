class_name DialogueBox extends CanvasLayer

@onready var dialogue_label: Label = $dialogue_label

signal done_line
signal done

var typing: bool = false
var typing_interval: float = 0.2
var typing_time: float = typing_interval

var npc_name: String = ""
var npc_paragraph: Array = []
var npc_line: String = ""

var current_line_index: int = 0
var current_letter_index: int = 0

func _process(delta: float) -> void:
	if not typing: return
	typing_time -= delta
	
	if typing_time <= 0.0:
		letter()

func say(_name: String, _paragraph: Array) -> void:
	npc_name = _name
	npc_paragraph = _paragraph
	npc_line = npc_paragraph[0]
	
	current_letter_index = 0
	current_line_index = 0
	
	typing_time = typing_interval
	typing = true

func letter() -> void:
	dialogue_label.text += npc_line[current_letter_index]
	current_letter_index += 1
	
	if current_letter_index >= npc_line.length():
		current_letter_index = 0
		current_line_index += 1
		
		done_line.emit()
		typing = false
		
		if current_line_index >= npc_paragraph.size():
			typing = false
			done.emit()
			
			await get_tree().create_timer(2.0).timeout
			queue_free()
			
			return
		
		npc_line = npc_paragraph[current_line_index]
		await get_tree().create_timer(1.0).timeout
		
		typing = true
