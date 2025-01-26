extends Node

# Словник для збереження діалогів
var dialogs = {
	"npc_1": [
		"Привіт! Як справи?",
		"Я продавець у цьому місті.",
		"Бережи себе!"
	],
	"npc_2": [
		"Це небезпечне місце...",
		"Будь обережний!"
	]
}

# Отримання діалогу для конкретного NPC
func get_dialog(npc_id: String) -> Array:
	if npc_id in dialogs:
		return dialogs[npc_id]
	else:
		return []
