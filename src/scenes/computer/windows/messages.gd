extends Control

@onready var messages_container: VBoxContainer = $messages
@onready var message: Control = $message
@onready var messenger_name: Label = $message/top_bar/name

@onready var message_bubbles_container: VBoxContainer = $message/ScrollContainer/message_bubble_container

var messages: Array = [
	"Lebon James",
]

func _ready() -> void:
	for entry in messages:
		if not Dialogues.MESSAGES.has(entry): return
		var dialogue: Array = Dialogues.MESSAGES[entry]
		
		var button: Button = Button.new()
		messages_container.add_child(button)
		
		var last_lines: Dictionary = dialogue[-1]
		var text: String = entry + ": " + last_lines["lines"][-1]
		
		text = text.substr(0, 26)
		
		button.text = text + "..."
		button.set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
		button.pressed.connect(func() -> void: open_message(entry))
		button.text_direction = Control.TEXT_DIRECTION_LTR

func open_message(id: String) -> void:
	var thread: Array = Dialogues.MESSAGES[id]
	messenger_name.text = id
	
	for child in message_bubbles_container.get_children():
		child.queue_free()
	
	for group in thread:
		var is_them: bool = group["from"] == "them"
		for line in group["lines"]:
			var bubble: PanelContainer = load(Registry.UID["message_bubble"]).instantiate()
			bubble.them = is_them
			
			message_bubbles_container.add_child(bubble)
			bubble.set_text(line)
	
	await get_tree().process_frame
	var scroll: ScrollContainer = $message/ScrollContainer
	scroll.scroll_vertical = int(scroll.get_v_scroll_bar().max_value)
	
	message.show()

func back() -> void:
	message.hide()
