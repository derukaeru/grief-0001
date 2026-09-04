extends Control

@onready var messages_container: VBoxContainer = $messages
@onready var message: Control = $message

var messages: Array = [
	"Lebon James",
]

func _ready() -> void:
	for entry in messages:
		if not Dialogues.MESSAGES.has(entry): return
		var dialogue: Array = Dialogues.MESSAGES[entry]
		
		var button: Button = Button.new()
		messages_container.add_child(button)
		
		var text: String = entry + ": " + dialogue[-1][-1]
		text = text.substr(0, 26)
		
		button.text = text + "..."
		button.set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
		button.pressed.connect(func() -> void: open_message(entry))
		button.text_direction = Control.TEXT_DIRECTION_LTR

func open_message(id: String) -> void:
	var dialogue: Array = Dialogues.MESSAGES[id]
	
	# todo here
	
	message.show()

func back() -> void:
	message.hide()
