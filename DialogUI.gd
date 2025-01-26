extends Control

var dialog_lines = []  # Масив діалогових рядків
var current_index = 0  # Поточний індекс діалогу

@onready var dialog_label = $DialogText
@onready var next_button = $NextButton

func _ready():
	hide()
	next_button.pressed.connect(show_next_line)

func show_dialog(lines: Array):
	dialog_lines = lines
	current_index = 0
	show_next_line()
	show()

func show_next_line():
	if current_index < dialog_lines.size():
		dialog_label.text = dialog_lines[current_index]
		current_index += 1
	else:
		hide()
