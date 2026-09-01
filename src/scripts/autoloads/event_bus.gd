extends Node

signal moved(to: String, from: String)
signal move_to(map: String)
signal moving

signal open_app(app_name: String)
signal opened_app(app_name: String)
signal closed_app(app_name: String)

signal open_file(file_name: String)
signal open_folder(file_name: String)
