extends Area2D
class_name AreaExit


#@export var sprite : Sprite2D
@export var animation_player : AnimationPlayer
@export var sfx_capture : AudioStreamPlayer2D
var isUnlocked = false


func _ready():
	# initialize portal
	locked()


func unlocked():
	isUnlocked = true
	animation_player.play("unlocked_animation")


func locked():
	isUnlocked = false
	animation_player.play("locked_animation")


# check body collision
func _on_body_entered(body: Node2D) -> void:
	if isUnlocked && body is PlayerController:
		sfx_capture.play()
		await sfx_capture.finished
		
		GameManager.next_area()
