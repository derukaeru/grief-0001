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
	},
	"subscription renewal": {
		"title": "idk subscription",
		"from": "the team",
		"to": "you",
		"content": "Hi -------- ,We hope you are enjoying your time with our product!. \n\nThis is a quick heads-up that your current subscription is set to automatically renew on September 17th, 2004 for $9.99. \n\n\n\nYou do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. \n\n\n\nIf you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.\n\n\n\n\nThank you for being a valued part of our community!Best regards,\nThe Company Team"
	},
	"subscription renewal ": {
		"title": "idk subscription",
		"from": "the team",
		"to": "you",
		"content": "Hi -------- ,We hope you are enjoying your time with our product!. \n\nThis is a quick heads-up that your current subscription is set to automatically renew on September 17th, 2004 for $9.99. \n\n\n\nYou do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. \n\n\n\nIf you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.\n\n\n\n\nThank you for being a valued part of our community!Best regards,\nThe Company Team"
	},
	"subscription renewal   ": {
		"title": "idk subscription",
		"from": "the team",
		"to": "you",
		"content": "Hi -------- ,We hope you are enjoying your time with our product!. \n\nThis is a quick heads-up that your current subscription is set to automatically renew on September 17th, 2004 for $9.99. \n\n\n\nYou do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. \n\n\n\nIf you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.\n\n\n\n\nThank you for being a valued part of our community!Best regards,\nThe Company Team"
	},
	"subscription renewal  ": {
		"title": "idk subscription",
		"from": "the team",
		"to": "you",
		"content": "Hi -------- ,We hope you are enjoying your time with our product!. \n\nThis is a quick heads-up that your current subscription is set to automatically renew on September 17th, 2004 for $9.99. \n\n\n\nYou do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. \n\n\n\nIf you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.\n\n\n\n\nThank you for being a valued part of our community!Best regards,\nThe Company Team"
	},
	"subscription renewal    ": {
		"title": "idk subscription",
		"from": "the team",
		"to": "you",
		"content": "Hi -------- ,We hope you are enjoying your time with our product!. \n\nThis is a quick heads-up that your current subscription is set to automatically renew on September 17th, 2004 for $9.99. \n\n\n\nYou do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. \n\n\n\nIf you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.\n\n\n\n\nThank you for being a valued part of our community!Best regards,\nThe Company Team"
	},
}

var DOCS: Dictionary[String, String] = {
	
}
