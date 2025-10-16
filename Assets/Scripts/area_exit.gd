extends Area2D

# check body collision
func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.next_area()
