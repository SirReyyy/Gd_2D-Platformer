extends Area2D


# check collision
func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.reload_area()
