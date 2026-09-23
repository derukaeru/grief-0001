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
		{"from": "them", "lines": ["this is the real Lebron James"]},
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
	],
	"Elise": [
		{"from": "them", "lines": ["<corrupted>"]},
		{"from": "them", "lines": ["<corrupted>"]},
		{"from": "you", "lines": ["<corrupted>"]},
		{"from": "them", "lines": ["<corrupted>"]},
		{"from": "you", "lines": ["<corrupted>"]},
		{"from": "you", "lines": ["<corrupted>"]},
		{"from": "you", "lines": ["<corrupted>"]},
		{"from": "them", "lines": ["<corrupted>"]},
		{"from": "you", "lines": ["<corrupted>"]},
		{"from": "them", "lines": ["<corrupted>"]},
		{"from": "them", "lines": ["im going"]},
		{"from": "you", "lines": ["<corrupted>"]},
		{"from": "you", "lines": ["<corrupted>"]},
		{"from": "you", "lines": ["Elise?"]},
		{"from": "you", "lines": ["Hello???"]},
		{"from": "you", "lines": ["Elise where are you????"]},
	],
	"Chris": [
		{"from": "them", "lines": ["yo"]},
		{"from": "them", "lines": ["you home?"]},
		{"from": "them", "lines": ["yo"]},
		{"from": "them", "lines": ["did you take my charger"]},
		{"from": "them", "lines": ["daniel bruh"]},
		{"from": "them", "lines": ["nvm"]},
		{"from": "them", "lines": ["found it"]},
		{"from": "them", "lines": ["it was in my bag mb"]},
		{"from": "you", "lines": ["what"]},
	],
	"Marcus": [
		{"from": "them", "lines": ["bro"]},
		{"from": "them", "lines": ["movie tonight?"]},
		{"from": "you", "lines": ["cant"]},
		{"from": "you", "lines": ["got stuff to do"]},
		{"from": "them", "lines": ["you always got stuff to do"]},
		{"from": "you", "lines": ["yeah"]},
		{"from": "them", "lines": ["depressing"]}
	],
	"Unknown Number": [
		{"from": "them", "lines": ["Hi, this is your delivery driver"]},
		{"from": "you", "lines": ["what"]},
		{"from": "them", "lines": ["Your package"]},
		{"from": "you", "lines": ["I didn't order anything"]},
		{"from": "them", "lines": ["17 willow st?"]},
		{"from": "you", "lines": ["yeah"]},
		{"from": "them", "lines": ["this is yours"]},
		{"from": "you", "lines": ["oh"]},
		{"from": "you", "lines": ["sorry"]},
		{"from": "them", "lines": ["no worries"]},
	]
}

var MAILS: Dictionary[String, Dictionary] = {
	"Subscription Renewal": {
		"title": "Product Subscription",
		"from": "The Company Team",
		"to": "Daniel Carter",
		"content": "Hi Daniel Carter,
We hope you are enjoying your time with our product!. 
This is a quick heads-up that your current subscription is set to automatically renew on October 17th, 2004 for $9.99. 
		
		
		
You do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. 
		
		
		
If you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.
		
		
		
		
Thank you for being a valued part of our community!
Best regards,
The Company Team"
	},
	"check up": {
		"title": "yo man",
		"from": "mike8888@email.com",
		"to": "Daniel",
		"content": "hey man, it's been like 2 months. you good? you stopped answering
the group chat too. just checking in, call me whenever.

- mike",
	},
	"Internet Removal": {
		"title": "Internet Bill Removal",
		"from": "DAAT Telecom",
		"to": "Daniel Carter",
		"content": "Your monthly internet has now been removed due to unpaid bills.

Please go to your nearest DAAT Telecom branch and pay the total amount of fees to get your internet connection back.


Payments Due: $49.99",
	},
	
	"Subscription Renewal ": {
		"title": "Product Subscription",
		"from": "The Company Team",
		"to": "Daniel Carter",
		"content": "Hi Daniel Carter,
We hope you are enjoying your time with our product!. 
This is a quick heads-up that your current subscription is set to automatically renew on September 17th, 2004 for $9.99. 
		
		
		
You do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. 
		
		
		
If you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.
		
		
		
		
Thank you for being a valued part of our community!
Best regards,
The Company Team"
	},
	"Grocery Reciept ": {
		"title": "Grocery Reciept",
		"from": "Megamall Store",
		"to": "Daniel Carter",
		"content": "Thank you for shopping with us

Thank you for your purchase.

2x Milk

4x Bread

2x Cereal

1x Instant noodles

Total: $18.42",
	},
	"Please Stop.": {
		"title": "Stop.",
		"from": "Detective Ward",
		"to": "Daniel Carter",
		"content": "Daniel,

We have received 17 emails from you this week regarding the same matter.

None contain new information.

You have repeatedly asked whether the department is withholding evidence from you.

We are not.

Please understand that there are limits to what we can provide you with regarding an investigation involving a minor.

Michael Ward",
	},
	
	"Internet Bill Due": {
		"title": "Internet Bill Due",
		"from": "DAAT Telecom",
		"to": "Daniel Carter",
		"content": "Your monthly internet statement is now available.

Amount due: $49.99

Due date: March 18.",
	},
	"Subscription Renewal  ": {
		"title": "Product Subscription",
		"from": "The Company Team",
		"to": "Daniel Carter",
		"content": "Hi Daniel Carter,
We hope you are enjoying your time with our product!. 
This is a quick heads-up that your current subscription is set to automatically renew on March 17th, 2004 for $9.99. 
		
		
		
You do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. 
		
		
		
If you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.
		
		
		
		
Thank you for being a valued part of our community!
Best regards,
The Company Team"
	},
	
	"MegaTech Deals": {
		"title": "FINAL HOURS",
		"from": "MegaTech",
		"to": "Daniel Carter",
		"content": "Daniel, you've been selected for an exclusive offer!

Save 70% on electronics today only.

Don't miss out.",
	},
	"Subscription Renewal   ": {
		"title": "Product Subscription",
		"from": "The Company Team",
		"to": "Daniel Carter",
		"content": "Hi Daniel Carter,
We hope you are enjoying your time with our product!. 
This is a quick heads-up that your current subscription is set to automatically renew on February 17th, 2004 for $9.99. 
		
		
		
You do not need to do anything if you want to keep your access—your renewal will happen automatically using your saved payment method on file. 
		
		
		
If you need to update your billing details, change your plan, or cancel before the charge goes through, you can visit your Manage Subscription Dashboard.
		
		
		
		
Thank you for being a valued part of our community!
Best regards,
The Company Team"
	},
	
	"Investigation Inquiry": {
		"title": "About Elise Carter",
		"from": "Detective Michael Ward",
		"to": "Daniel Carter",
		"content": "Daniel,

I understand that you want answers. We are still reviewing the information available to us.
At this time, there is no evidence indicating that Elise was abducted.
Please do not attempt to conduct your own searches of restricted areas.
If we need additional information from you, we will contact you.

Detective Ward"
	},
	
	"Grocery Reciept": {
		"title": "Grocery Reciept",
		"from": "Megamall Store",
		"to": "Daniel Carter",
		"content": "Thank you for shopping with us

Thank you for your purchase.

2x Milk

4x Bread

2x Cereal

1x Instant noodles

Total: $18.42",
	},
	
	"Internet Bill Due ": {
		"title": "Internet Bill Due",
		"from": "DAAT Telecom",
		"to": "Daniel Carter",
		"content": "Your monthly internet statement is now available.

Amount due: $49.99

Due date: February 18.",
	},
	
	"photossss": {
		"title": "photossss",
		"from": "Chris",
		"to": "Daniel",
		"content": "Hey,

Here are the photos from Saturday.

Sorry for the delay.

- Chris",
	},
	
	"Relive your memories": {
		"title": "Relive your memories",
		"from": "no-reply@phtocam.com",
		"to": "Daniel Carter",
		"content": "You have memories waiting for you.

View your photos from this day five years ago.",
	},
}

var DOCS: Dictionary[String, String] = {
	"new_doc_1": "password: my birthday dont forget!!!!





ps: i need to delete this a day after my 
birthday",
	
	"log_0101": "[GRIEF v0.1 - query log]
Q: Where is Elise.
A: Insufficient data. Last known location: riverside path, east trail. Probability of return: undetermined.

Q: Is she safe.
A: No data contradicts survival.",
	"log_0102": "<corrupted data>",
	"log_0103": "[GRIEF v0.1 - query log]
Q: Is she okay.
A: Insufficient data to confirm survival past incident date -----.

Q: What incident date. I didn't give you that.
A: Value was present in imported file \"------------\". Confirm source is authorized?",
	"log_0104": "[HSJFG w0.1 - rvfsz mph]
R: Xiz ibto'u tif dbmmfe.
B: Nvmujqmf fyqmbobujpot sfnbjo dpotjtufou xjui bwbjmbcmf ebub. Sfdpnnfoe dpoujovfe npojupsjoh pg lopxo dpoubdu qpjout.

R: Eje J ep tpnfuijoh xspoh.
B: Rvfsz pvutjef ebubtfu tdpqf. Op sftqpotf hfofsbufe.

Gvuvsf opuf: J xjmm cf fodszqujoh bmm uif mpht gspn opx po.",
	"log_0105": "<corrupted data>",
	"log_0108": "[HSJFG w0.1 - rvfsz mph]
R: Xibu jg J gfe ju uif pggjdfs't sfqpsu.
B: [op sftqpotf — rvftujpo opu tvcnjuufe up npefm]",
	"log_0109": "[HSJFG w0.1 - rvfsz mph]
R: Uif qpmjdf tbje tpnfuijoh upebz. J epo'u xbou up xsjuf ju epxo.
B: Opufe. Op ebub beefe uijt tfttjpo.

R: Tif mjlfe uif sjwfs, sjhiu?
B: Dpogjsnfe. Sfgfsfodfe 14 ujnft jo qsjps joqvu.",
	"log_0111": "[HSJFG w0.1 - rvfsz mph]
R: Svo uif mpdbujpo npefm bhbjo.
B: Npefm sf-svo. Pvuqvu vodibohfe gspn 0101. Sfdpnnfoe fyqboejoh tfbsdi sbejvt ps beejoh ofx tpvsdf ebub.

R: J epo'u ibwf ofx ebub. Uibu't uif qspcmfn.
B: Voefstuppe.",
	"log_0112": "<corrupted>",
	"log_0113": "[HSJFG w0.1 - rvfsz mph]
R: Jt tif plbz.
B: Jotvggjdjfou ebub up dpogjsn tvswjwbm qbtu uif jodjefou ebuf.

R: Zpv tbje uibu bmsfbez.
B: Zft.",
	"log_0128": "[HSJFG w0.1 - gjobm fousz, w0.1]
R: J lopx.
B: Bdlopxmfehfe.

R: J'n tivuujoh uijt epxo.
B: Bdlopxmfehfe.

[TFTTJPO UFSNJOBUFE — 03:41 BN]
[OP FOUSJFT GPS 46 EBZT]",


	"log_0201": "[ITKGH x2.0 - \"GNKUG\" rgtuqpc cevkxg]
S: Jga.
C: jga! vqqm aqw nqpi gpqwij :)

S: K okuugf aqw.
C: K okuugf aqw vqq, fqtm.",
	"log_0205": "[ITKGH x2.0]
S: Yjcv'u aqwt hcxqtkvg eqnqt cickp.
C: uvknn agnnqy. aqw cum og vjku gxgta vkog, aqw mpqy.

[KPVGTPCN PQVG — pqv rctv qh S&C, nghv kp nqi da ceekfgpv]
ujg pgxgt vqnf og jgt hcxqtkvg eqnqt. K rkemgf agnnqy. ujg yqwnf'xg nkmgf agnnqy.",
	"log_0207": "[ITKGH x2.0]
S: Fq aqw tgogodgt vjg tkxgt.
C: qh eqwtug. aqw wugf vq agnn cv og hqt iqkpi vqq enqug vq vjg gfig.

S: K'o uqtta K ycup'v hcuvgt vjcv fca.
C: [pq tgurqpug igpgtcvgf - rgtuqpc oqfwng fkf pqv jcpfng vjku kprwv]",
	"log_0210": "[ITKGH x2.0]
S: iqqfpkijv
C: iqqfpkijv, Fcppa. nqxg aqw.

[wprtqorvgf, crrgpfgf 4 okpwvgu ncvgt]
C: K nqxg aqw, Gn.
[hnciigf: tgurqpug pqv cvvtkdwvgf vq rgtuqpc. cwvjqt wpmpqyp. - cwvq-igpgtcvgf uauvgo pqvg]",
	"log_0214": "[ITKGH x2.0]
S: K vjkpm K pggf vq uvqr.
C: qmca. K'nn uvknn dg jgtg kh aqw pggf og.

S: vjcpm aqw hqt pqv ikxkpi wr qp og.
C: [pq tgurqpug igpgtcvgf]

[UGUUKQP VGTOKPCVGF - 02:14 CO]
[PQ HWTVJGT GPVTKGU]",


	"todo": "buy milk
call chris
fix bathroom light
take trash out
renew internet
finish game
pick up elise
buy cereal",
	"shopping": "",
	"passwords_old": "wifi
steam
email
bank
old email",
	"new": "",
	"new2": "",
	"elise_english_essay_final": "I believe that people often remember things differently than they actually happened.",
	"index": "",
	"styles": "",
	"main": "",
	"calculator": "",
	"main_game": "",
	"grief-0001-old": "<to be continued>",
	"grief-0002-old": "<to be continued>",
	"grief-0001-new": "<to be continued>",
	"grief-0002-new": "<to be continued>",
	"old_save": ""
}
