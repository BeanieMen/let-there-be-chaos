extends Node
var data_cubes = 0
var wave = 1
var Big_lazer_gun_is_equipped = false
var sniper_gun_is_equipped = false
var rocket_is_equipped = false
var player
var gun = preload("res://assets/weapons/attach-to-body/1.png")
var enemies_can_spawn = true


func _process(delta):
	if Big_lazer_gun_is_equipped == false and sniper_gun_is_equipped == false and rocket_is_equipped == false:
		gun = preload("res://assets/weapons/attach-to-body/1.png")

func instancing_node(location, parent, node):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
