extends Node

var dialogue: Dictionary = {
	"name": {
		"dialogue_1": ["line 1", "line 2"]
	}
}

# structured as messages are alternating, the arrays in the id are for double or multiple texts for the same person
var MESSAGES: Dictionary[String, Array] = {
	"Lebon James": [
		{"from": "them", "lines": ["hello", "this is the real lebron james"]},
		{"from": "you",  "lines": ["this is a scam", "who are you"]},
		{"from": "them", "lines": ["this is the real lebron james"]},
	],
}

var NOTES: String = ""

var DOCS: Dictionary[String, String] = {
	
}
