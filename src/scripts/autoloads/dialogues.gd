extends Node

var NOTES: String = ""

var dialogue: Dictionary = {
	"name": {
		"dialogue_1": ["line 1", "line 2"]
	}
}

var MESSAGES: Dictionary[String, Array] = {
	"Lebon James": [
		{"from": "them", "lines": ["hello", "this is the real lebron james"]},
		{"from": "you",  "lines": ["this is a scam", "who are you"]},
		{"from": "them", "lines": ["this is the real lebron james"]},
	],
	"Unknown Contact": [
		{"from": "them", "lines": ["hey", "you got that file i sent you?"]},
		{"from": "you",  "lines": ["yeah", "just downloaded it last night"]},
		{"from": "them", "lines": ["good"]},
		{"from": "you",  "lines": ["what was it about?", "i cant even open it"]},
		{"from": "you",  "lines": ["...", "hello?"]},
		{"from": "them", "lines": ["HIM"]},
		{"from": "them", "lines": ["dzqaktll_612"]},
		{"from": "you",  "lines": ["what?"]},
	]
}

var MAILS: Dictionary[String, Dictionary] = {
	"rejection mail": {
		"title": "LMAO",
		"from": "idk",
		"to": "you",
		"content": "yeah u not getting this job"
	}
}

var DOCS: Dictionary[String, String] = {
	
}
