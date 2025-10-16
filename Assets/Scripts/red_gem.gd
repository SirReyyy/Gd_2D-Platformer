extends Area2D


@export var animation_player : AnimationPlayer
@export var isReversed = false


func _ready():
	if isReversed:
		animation_player.play_backwards("idle_animation")
	else:
		animation_player.play("idle_animation")

# pick up logic
func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.increment_red_gem()
		queue_free()
