extends Area2D


@export var animation_player : AnimationPlayer
@export var sfx_pickup : AudioStreamPlayer2D
@export var sprite : Sprite2D
@export var isReversed = false

func _ready():
	if isReversed:
		animation_player.play("rev_animation")
	else:
		animation_player.play("idle_animation")

# pick up logic
func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.increment_gem()
		sprite.visible = false
		
		sfx_pickup.play()
		await sfx_pickup.finished
		
		queue_free()
