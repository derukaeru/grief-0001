extends Control

@onready var searchpage: Control = $search_page
@onready var homepage: Control = $homepage

@onready var homepage_searchbar: LineEdit = $homepage/search_bar
@onready var searchpage_searchbar: LineEdit = $search_page/search_bar

@onready var history_page: Control = $history

func search(_text: String = "") -> void:
	searchpage.show()
	homepage.hide()

func home_search(_text: String = "") -> void:
	searchpage_searchbar.text = homepage_searchbar.text if not _text else _text
	searchpage.show()
	homepage.hide()

func return_to_homepage() -> void:
	searchpage_searchbar.text = ""
	searchpage.hide()
	homepage.show()

func open_history() -> void:
	history_page.show()

func close_history() -> void:
	history_page.hide()

func search_history(source: Button) -> void:
	home_search(source.text)
