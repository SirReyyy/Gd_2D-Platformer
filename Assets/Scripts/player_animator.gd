extends Node2D

# export variables
@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

# process function
func _process(delta):
	# player sprite flip
	if player_controller.direction == 1:
		sprite.flip_h = false
	elif player_controller.direction == -1:
		sprite.flip_h = true
		
	# player walk animation
	if abs(player_controller.velocity.x) > 0.0:
		animation_player.play("walk_animation")
	elif player_controller.isDucked == true:
		animation_player.play("duck_animation")
	else:
		animation_player.play("idle_animation")
		
	# player jump animation
	if player_controller.velocity.y < 0.0:
		animation_player.play("jump_animation")
	elif player_controller.velocity.y > 0.0:
		animation_player.play("fall_animation")
