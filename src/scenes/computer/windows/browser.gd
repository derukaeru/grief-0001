extends Control

@onready var searchpage: Control = $search_page
@onready var homepage: Control = $homepage

@onready var homepage_searchbar: LineEdit = $homepage/search_bar
@onready var searchpage_searchbar: LineEdit = $search_page/search_bar

func search(_text: String = "") -> void:
	searchpage.show()
	homepage.hide()

func home_search(_text: String = "") -> void:
	searchpage_searchbar.text = homepage_searchbar.text
	searchpage.show()
	homepage.hide()

func return_to_homepage() -> void:
	searchpage_searchbar.text = ""
	searchpage.hide()
	homepage.show()
