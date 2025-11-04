extends Node2D
class_name NewPlayerAnim

# export variables
@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

var player_index = 0
var player_color = "beige"


func _ready():
	random_player_color()
	
func random_player_color():
	player_index = randi_range(0,4)

# process function
func _process(_delta):
	#get player color
	get_player_color(player_index)
	
	# player sprite flip
	if player_controller.direction == 1:
		sprite.flip_h = false
	elif player_controller.direction == -1:
		sprite.flip_h = true
	
	# player walk animation
	if abs(player_controller.velocity.x) > 0.0:
		animation_player.play(player_color + "_walk")
	elif player_controller.isDucked == true:
		#animation_player.play("duck_animation")
		animation_player.play(player_color + "_duck")
	else:
		animation_player.play(player_color + "_idle")
	
	# player jump animation
	if player_controller.velocity.y < 0.0:
		animation_player.play(player_color + "_jump")
	elif player_controller.velocity.y > 0.0:
		animation_player.play(player_color + "_fall")
		

# player color
func get_player_color(index):
	if index == 0:
		player_color = "beige"
	elif index == 1:
		player_color = "green"
	elif index == 2:
		player_color = "purple"
	elif index == 3:
		player_color = "red"
	elif index == 4:
		player_color = "yellow"
		
	return player_color
