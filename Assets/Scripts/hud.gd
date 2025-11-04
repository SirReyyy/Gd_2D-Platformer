extends Control
class_name HUD


@export var area_label : Label
@export var gem_count : Label
@export var exit_label : Label



func update_area_label(area_num):
	area_label.text = "Area 1 - " + str(area_num)


func update_gem_count(count : int):
	gem_count.text = "x " + str(count)
	

func update_exit_false():
	exit_label.text = "collect all gems"

func update_exit_true():
	exit_label.text = "capture flag"
