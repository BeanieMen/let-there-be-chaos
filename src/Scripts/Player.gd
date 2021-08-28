extends KinematicBody2D
var velocity = Vector2()
var Max_Speed = 200
#collision testing variable 
var player = true
var is_Enemy_bullet = false
var bullet = false
var enemy = false
#
var canshoot = true
var player_bullet = preload("res://src/Scenes/Bullet.tscn")
var isEnemyProjectile = false
var screenSize;
var health = 20
var acc = 700
var friction = 700
var input_vector = Vector2()

func _ready():
	$gun.texture = Global.gun
	$"leg-animation".frame = 0
	Global.player = self
	screenSize = get_viewport_rect().size


func get_input():
	#rotation
	if Input.is_action_just_pressed("shoot") and canshoot:
		Global.instancing_node(global_position, get_tree().root, player_bullet)
	look_at(get_global_mouse_position())
	rotation += 4.71239
	#movement
	input_vector.x = int(Input.get_action_strength("ui_right")) - int(Input.get_action_strength("ui_left"))
	input_vector.y = int(Input.get_action_strength("ui_down")) - int(Input.get_action_strength("ui_up"))
	input_vector.normalized()
	
	global_position.y = clamp(global_position.y, 10, screenSize.y)
	global_position.x = clamp(global_position.x, 10, screenSize.x)

func _physics_process(delta):
	get_input()
	if health <= 0:
		get_tree().quit()
	if input_vector != Vector2.ZERO:
		$AnimationPlayer.play("walk")
		velocity = velocity.move_toward(input_vector * Max_Speed, acc * delta)
	else:
		$AnimationPlayer.stop()
		$"leg-animation".frame = 0
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	
	move_and_slide(velocity)



func _on_CanShoot_timeout():
	canshoot = true


func _on_Hurtbox_area_entered(area):
	if area.enemy:
		var knockback
		knockback = area.rotation
		velocity = velocity.move_toward(Vector2(-300, 0).rotated(knockback + 4.71239), acc)
		area.queue_free()
		health -= area.damage
		Global.data_cubes += 1
	elif area.is_Enemy_bullet:
		health -= area.damage
