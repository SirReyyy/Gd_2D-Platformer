extends CharacterBody2D
class_name PlayerController



@export var speed = 20.0
@export var jump_power = 35.0
@export var jump_sfx : AudioStreamPlayer2D

var speed_multiplier = 20.0
var jump_multiplier = -20.0
var direction = 0
var isDucked = false


func _input(event):
	# handle jump mechanics
	if event.is_action_pressed("jump") and is_on_floor():
		jump_sfx.play()
		velocity.y = jump_power * jump_multiplier
		
	# handle duck and jump down mechanics
	if event.is_action_pressed("duck"):
		isDucked = true
	else:
		isDucked = false


func _physics_process(delta: float) -> void:
	# add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# check player direction
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()


func teleport_to_location(new_location):
	position = new_location
