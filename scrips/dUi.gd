extends Control

var current_dialog: Array = []
var current_index: int = 0

# Отримання ноди після завантаження
@onready var dialog_label: Label = $Label  # Нода для відображення тексту

func show_dialog(dialog_lines: Array):
	current_dialog = dialog_lines
	current_index = 0
	if current_dialog.size() > 0:
		dialog_label.text = current_dialog[current_index]
		visible = true  # Показати UI

func next_line():
	current_index += 1
	if current_index < current_dialog.size():
		dialog_label.text = current_dialog[current_index]
	else:
		close_dialog()

func close_dialog():
	visible = false  # Приховати UI
