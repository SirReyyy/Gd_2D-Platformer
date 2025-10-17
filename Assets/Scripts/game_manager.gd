extends Node


var area_path = "res://Assets/Scenes/Areas/"
var starting_area = 1
var current_area = 1
var red_gem_collectibles = 0

var area_container = Node2D
var player : PlayerController

func _ready():
	area_container = get_tree().get_first_node_in_group("area_container")
	player = get_tree().get_first_node_in_group("player")
	load_area(starting_area)


# load next area
func next_area():
	current_area += 1
	load_area(current_area)

# load area
func load_area(area_number):
	# get new scene path
	var full_path = area_path + "area_" + str(area_number) + ".tscn"
	var scene = load(full_path) as PackedScene
	if !scene:
		return
	
	# remove previous scene
	for child in area_container.get_children():
		child.queue_free()
		await child.tree_exited
	
	# setup new scene
	var instance = scene.instantiate()
	area_container.add_child(instance)
	reset_red_gem()
	
	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	player.teleport_to_location(player_start_position.position)
	

# reload area
func reload_area():
	load_area(current_area)
	#setup_area()

# increment when picked up
func increment_red_gem():
	red_gem_collectibles += 1
	if(red_gem_collectibles >= 5):
		var exit = get_tree().get_first_node_in_group("area_exits") as AreaExit
		exit.unlocked()


# reset collectible count
func reset_red_gem():
	red_gem_collectibles = 0
