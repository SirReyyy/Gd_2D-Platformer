extends Node2D

var area_container = Node2D
var player : PlayerController
var hud : HUD

func _ready():
	area_container = get_tree().get_first_node_in_group("area_container")
	player = get_tree().get_first_node_in_group("player")
	hud = get_tree().get_first_node_in_group("HUD")

func _on_btn_play_pressed() -> void:
	GameManager.load_gameplay_scene()
