extends Area2D
var speed = 200
#collision testing var
var player = false
var bullet = true
var is_Enemy_bullet = false
var enemy = false
#
var damage = 0
var base_damage = 1
var LookOnce = true
var velocity = Vector2(1, 0)
var screenSize = get_viewport_rect().size

func _physics_process(delta):
	
	if Global.gun == preload("res://assets/weapons/attach-to-body/2.png"):
		$CollisionShape2D.scale.x = 1
		$CollisionShape2D.scale.y = 1
		$Bullet.scale.y = 1
		$Bullet.scale.y = 1
		damage = 1
	if Global.gun == preload("res://assets/weapons/attach-to-body/2.png"):
		$CollisionShape2D.scale.x = 2
		$CollisionShape2D.scale.y = 2
		$Bullet.scale.y = 2
		$Bullet.scale.x = 2
		damage = 2
	if Global.gun == preload("res://assets/weapons/attach-to-body/3.png"):
		$CollisionShape2D.scale.x = 1
		$CollisionShape2D.scale.y = 1
		$Bullet.scale.y = 1
		$Bullet.scale.y = 1
		damage = 4
	if Global.gun == preload("res://assets/weapons/attach-to-body/4.png"):
		$CollisionShape2D.scale.x = 2
		$CollisionShape2D.scale.y = 2
		$Bullet.texture = preload("res://assets/weapons/shoot/4.png")
		damage = 5
		
		
	if global_position.x < -32:
		queue_free()

	if global_position.y < -32:
		queue_free()

	if global_position.x > 1080+32:
		queue_free()

	if global_position.y > 600+32:
		queue_free()

		
	if LookOnce:
		look_at(get_global_mouse_position())
		LookOnce = false
	global_position += velocity.rotated(rotation) * speed * delta
	

func _on_Bullet_area_entered(area):
	if area.bullet == true:
		pass
	if area.enemy:
		area.health -= damage + base_damage
		print(area.health)
