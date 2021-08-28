extends Area2D
var enemy_bullet = preload("res://src/Scenes/Enemy_Bullet.tscn")
var isTilemap = false
var velocity = Vector2(1,0)
var speed = 125
var health = 5
#collision testing vars
var player = false
var enemy = true
var is_Enemy_bullet = false
var bullet = false
#
var damage = 1
var lookOnce = true
var isPlayer = false
var pos_to_plr = Vector2()
var set_once = true

func _physics_process(delta):
	if Global.wave == 2:
		health *= 2
		damage *= 2
	if health <= 0:
		queue_free()
		Global.data_cubes += 1
	look_at(Global.player.global_position)
	rotation += 4.71239
	pos_to_plr = global_position.direction_to(Global.player.global_position)
	global_position += pos_to_plr * delta * speed
	
func _on_BulletTimer_timeout():
	Global.instancing_node(global_position ,get_node("/root/"), enemy_bullet)


func _on_Enemy_area_entered(area):
	if enemy:
		pass
	elif bullet:
		queue_free()
	elif is_Enemy_bullet:
		pass
