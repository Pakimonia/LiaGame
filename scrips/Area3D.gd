extends Area3D

func _on_body_entered(body):
	if body.name == "player":
		if body.has_method("start_dialog"):
			body.start_dialog(body)
			$CollisionShape3D3.hide()
