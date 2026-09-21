extends Node

signal moved(to: String, from: String)
signal move_to(map: String)
signal moving

signal open_window(window_name: String)
signal minimize_window(window_name: String)
signal opened_window(window_name: String)
signal closed_window(window_name: String)
signal minimized_window(window_name: String)

signal open_app(app_name: String)
signal open_file(file_name: String, file_type: File.FILE_TYPES, extension: String)
signal open_folder(file_name: String)
signal open_zip(zip_name: String)

signal open_image(image_name: String)
signal open_audio(audio_name: String)

signal open_mail(mail_name: String)

signal close_folder(folder_name: String)
