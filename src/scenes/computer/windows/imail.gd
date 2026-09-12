@tool
extends Control

@onready var mails: VBoxContainer = $ScrollContainer/mails
@onready var mail: Control = $mail

@onready var title_label: Label = $mail/title
@onready var from_label: Label = $mail/from
@onready var to_label: Label = $mail/to
@onready var content_label: Label = $mail/content

func _ready() -> void:
	for entry in Dialogues.MAILS:
		var mail_button: MailButton = MailButton.new()
		mail_button.mail_name = entry
		
		mails.add_child(mail_button)
	
	EventBus.open_mail.connect(open_mail)

func open_mail(mail_name: String) -> void:
	var mail_content: Dictionary = Dialogues.MAILS[mail_name]
	
	title_label.text = mail_content.title
	from_label.text = mail_content.from
	to_label.text = mail_content.to
	content_label.text = mail_content.content
	
	mail.show()
