extends Area2D

@export var sfx_dead : AudioStreamPlayer2D

# check collision
func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		sfx_dead.play()
		await sfx_dead.finished
		
		GameManager.reload_area()
