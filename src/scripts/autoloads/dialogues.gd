extends Node

var dialogue: Dictionary = {
	"name": {
		"dialogue_1": ["line 1", "line 2"]
	}
}

# structured as messages are alternating, the arrays in the id are for double or multiple texts for the same person
var MESSAGES: Dictionary[String, Array] = {
	"Lebon James": [
		["hello", "this is the real lebron james"],
		["this is a scam", "who are you"],
		["this is the real lebron james"],
	]
}
