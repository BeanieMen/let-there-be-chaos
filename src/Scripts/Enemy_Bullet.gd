extends Node2D
var speed = 200
#collision testing var
var player = false
var is_Enemy_bullet = true
var enemy = false
var bullet = false
#
var damage = 1
var LookOnce = true
var velocity = Vector2(1, 0)
var screenSize = get_viewport_rect().size

func _physics_process(delta): 
	if Global.wave == 2:
		damage *= 2
	if global_position.x < -32:
		queue_free()
	if global_position.x > 1080+32:
		queue_free()
	if global_position.y > 600+32:
		queue_free()
	if global_position.y < -32:
		queue_free()

		
	if LookOnce:
		look_at(Global.player.global_position)
		LookOnce = false
	global_position += velocity.rotated(rotation) * speed * delta






func _on_Enemy_bullet_body_entered(body):
	if body.player:
		body.health -= 1
