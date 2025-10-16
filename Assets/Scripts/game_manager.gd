extends Node


var area_path = "res://Assets/Scenes/Areas/"
var current_area = 1
var current_path = "" #
var red_gem_collectibles = 0


func _ready():
	current_path = area_path + "area_" + str(current_area) + ".tscn"
	#var value_area = str(get_tree().current_scene).trim_prefix("Area_0")
	#current_area = int(value_area)
	#current_path = area_path + "area_" + value_area + ".tscn"
	#print(current_path)
	reset_red_gem()


# load next area
func next_area():
	current_area += 1
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	current_path = full_path #
	
	get_tree().change_scene_to_file(full_path)
	setup_area()


# reload area
func reload_area():
	get_tree().change_scene_to_file(current_path)
	setup_area()


# setup area
func setup_area():
	reset_red_gem()


# increment when picked up
func increment_red_gem():
	red_gem_collectibles += 1
	if(red_gem_collectibles >= 5):
		var exit = get_tree().get_first_node_in_group("area_exits") as AreaExit
		exit.unlocked()


# reset collectible count
func reset_red_gem():
	red_gem_collectibles = 0
