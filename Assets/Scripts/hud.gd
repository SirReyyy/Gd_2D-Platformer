extends Control
class_name HUD

@export var hud : HUD
@export var area_label : Label
@export var gem_count : Label
@export var exit_label : Label
@export var gem_sprite : TextureRect

var area_number : int


func update_area_label(area_num):
	# area number
	area_number = area_num
	
	if area_num <= 10:
		area_label.text = "World 1 - " + str(area_num)
		gem_sprite.texture = load("res://Imports/kenney_new-platformer-pack-1.0/Sprites/Tiles/Double/gem_red.png")
	elif area_num > 10 && area_num <= 20:
		area_label.text = "World 2 - " + str(area_num)[-1]
		gem_sprite.texture = load("res://Imports/kenney_new-platformer-pack-1.0/Sprites/Tiles/Double/gem_yellow.png")
	elif area_num > 20 && area_num <= 30:
		area_label.text = "World 3 - " + str(area_num)[-1]
		gem_sprite.texture = load("res://Imports/kenney_new-platformer-pack-1.0/Sprites/Tiles/Double/gem_blue.png")
	elif area_num > 30 && area_num <= 40:
		area_label.text = "World 4 - " + str(area_num)[-1]
		gem_sprite.texture = load("res://Imports/kenney_new-platformer-pack-1.0/Sprites/Tiles/Double/gem_green.png")
	elif area_num > 40 && area_num <= 50:
		area_label.text = "World 5 - " + str(area_num)[-1]
		gem_sprite.texture = load("res://Imports/kenney_new-platformer-pack-1.0/Sprites/Tiles/Double/coin_gold.png")
	else:
		hud.visible = false


func update_gem_count(count : int):
	gem_count.text = "x " + str(count)
	

func update_exit_false():
	if area_number > 40:
		exit_label.text = "collect all coins"
	else:
		exit_label.text = "collect all gems"

func update_exit_true():
	if area_number > 40:
		exit_label.text = "find the exit"
	else:
		exit_label.text = "capture flag"
