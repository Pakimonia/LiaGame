# DialogManager.gd
extends Node

# Словник з діалогами
var dialogs: Dictionary = {
	"npc_1": [
		"Привіт, як справи?",
		"Мені потрібно дещо сказати.",
		"Щасти тобі!"
	],
	"npc_2": [
		"Це небезпечна територія.",
		"Будь обережний!"
	]
}

# Функція для отримання діалогу за ключем
func get_dialog(npc_id: String) -> Array:
	if npc_id in dialogs:
		return dialogs[npc_id]
	else:
		return []  # Повернути порожній масив, якщо діалогу немає
