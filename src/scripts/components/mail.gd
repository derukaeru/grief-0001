@tool
class_name MailButton extends Button

@export var mail_name: String = ""

func _ready() -> void:
	pressed.connect(open_mail)

func open_mail() -> void:
	EventBus.open_mail.emit(mail_name)
