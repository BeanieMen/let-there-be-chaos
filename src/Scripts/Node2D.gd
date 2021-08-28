extends Node2D
var wave_enemies_spwaned = 0
var enemy = preload("res://src/Scenes/Enemy.tscn")
var wave_enemies = 50
var is_not_on_timer = true

func _on_SpawnTimer_timeout():
	randomize()
	$SpawnPath/SpawnLocation.offset = randi()
	if wave_enemies_spwaned <= wave_enemies and Global.enemies_can_spawn:
		Global.instancing_node($SpawnPath/SpawnLocation.global_position, self, enemy)
		wave_enemies_spwaned += 1
	if wave_enemies_spwaned == wave_enemies and Global.wave == 3:
		#Gonna make the win scene later for now it exits
		get_tree().quit()


func _process(delta):
	$Label.text = "Data Cubes: " + str(Global.data_cubes)
	if wave_enemies_spwaned == wave_enemies and is_not_on_timer:
		wave_enemies = wave_enemies * 2
		wave_enemies_spwaned = 0
		Global.enemies_can_spawn = false
		$Wave.text = "Wave: " + str(Global.wave)
		$Wave.visible = true
		Global.wave += 1
		$WaveTimer.start()
		is_not_on_timer = false


func _on_Shop_pressed():
	get_tree().change_scene("res://src/Scenes/Shop.tscn")


func _on_WaveTimer_timeout():
	Global.enemies_can_spawn = true
	is_not_on_timer = true
	$Wave.visible = true
