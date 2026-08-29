extends Node

@onready var dialogue_box: PackedScene = load(Registry.UID.dialogue_box)
var active_dialogue_box: DialogueBox

func say_dialogue(npc_name: String, paragraph: String) -> void:
	if not Dialogues.dialogue.has(npc_name): 
		return push_error("This entity: %d does not exist in the Dialogue Registry." % npc_name)
	var npc_dialogues: Array = Dialogues.dialogue[npc_name]
	if not npc_dialogues.has(""):
		return push_error("This paragraph: %d does not exist in Entity: %d dialogue list." % [paragraph, npc_name])
	var npc_paragraph: Array = npc_dialogues[0]
	
	if not active_dialogue_box:
		active_dialogue_box = dialogue_box.instantiate()
		GameManager.ui.add_child(active_dialogue_box)
	
	active_dialogue_box.say(npc_name, npc_paragraph)
