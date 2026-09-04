extends Control

@onready var notes_label: TextEdit = $notes

func _ready() -> void:
	notes_label.text = Dialogues.NOTES

func edited(_fl: int, _tl: int) -> void:
	Dialogues.NOTES = notes_label.text
