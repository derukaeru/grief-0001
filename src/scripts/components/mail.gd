@tool
class_name MailButton extends Button

@export var mail_name: String = ""

func _ready() -> void:
	pressed.connect(open_mail)
	set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)

func open_mail() -> void:
	EventBus.open_mail.emit(mail_name)
