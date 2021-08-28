extends CanvasLayer
var Big_lazer_gun_purchased = false
var rocket_purchased = false
var sniper_gun_purchased = false


func _process(delta):
	if Global.Big_lazer_gun_is_equipped == true:
		$Buy.text = "EQUIPED"
	if Global.sniper_gun_is_equipped == true:
		$Buy2.text = "EQUIPED"
	if Global.rocket_is_equipped == true:
		$Buy3.text = "EQUIPED"
func _on_Buy_pressed():
	if Big_lazer_gun_purchased != true:
		if Global.data_cubes >= 50:
			$Buy.text = "EQUIPED"
			$Buy2.text = "EQUIP"
			$Buy3.text = "EQUIP"
			Global.rocket_is_equipped = false
			Global.sniper_gun_is_equipped = false
			Global.Big_lazer_gun_is_equipped = true
			Big_lazer_gun_purchased = true
			Global.gun = preload("res://assets/weapons/attach-to-body/2.png")
		else:
			$Buy.text = "Not enough data cubes"
			$Timer.start
	elif Global.Big_lazer_gun_is_equipped != true:
		Global.Big_lazer_gun_is_equipped = true
		$Buy.text = "EQUIPED"
		$Buy2.text = "EQUIP"
		$Buy3.text = "EQUIP"
		Global.rocket_is_equipped = false
		Global.sniper_gun_is_equipped = false
	else:
		$Buy.text = "EQUIP"
		Global.Big_lazer_gun_is_equipped = false
		

func _on_Back_pressed():
	get_tree().change_scene("res://src/Scenes/Node2D.tscn")


func _on_Timer_timeout():
	if Big_lazer_gun_purchased != true:
		$Buy.text = "BUY"
		$Buy.rect_size.x = 149
		$Buy.rect_size.y = 58
	if sniper_gun_purchased != true:
		$Buy2.text = "BUY" 
		$Buy2.rect_size.x = 149
		$Buy2.rect_size.y = 58
	if rocket_purchased != true:
		$Buy3.text = "BUY"
		$Buy3.rect_size.x = 149
		$Buy3.rect_size.y = 58


func _on_Buy2_pressed():
	if sniper_gun_purchased != true:
		if Global.data_cubes >= 100:
			sniper_gun_purchased = true
			$Buy2.text = "EQUIPED"
			$Buy.text = "EQUIP"
			$Buy3.text = "EQUIP"
			Global.rocket_is_equipped = false
			Global.sniper_gun_is_equipped = true
			Global.Big_lazer_gun_is_equipped = false
			Global.gun = preload("res://assets/weapons/attach-to-body/3.png")
		else:
			$Buy2.text = "Not enough data cubes"
			$Timer.start()
	elif Global.sniper_gun_is_equipped != true:
		Global.sniper_gun_is_equipped = true
		$Buy2.text = "EQUIPED"
		$Buy.text = "EQUIP"
		$Buy3.text = "EQUIP"
		Global.Big_lazer_gun_is_equipped = false
		Global.rocket_is_equipped = false
	else:
		$Buy2.text = "EQUIP"
		Global.sniper_gun_is_equipped = false
		
func _on_Buy3_pressed():
	if rocket_purchased != true:
		if Global.data_cubes >= 200:
			rocket_purchased = true
			$Buy3.text = "EQUIPED"
			$Buy2.text = "EQUIP"
			$Buy.text = "EQUIP"
			Global.rocket_is_equipped = true
			Global.sniper_gun_is_equipped = false
			Global.Big_lazer_gun_is_equipped = false
			Global.gun = preload("res://assets/weapons/attach-to-body/4.png")
		else:
			$Buy3.text = "Not enough data cubes"
			$Timer.start()
	elif Global.rocket_is_equipped != true:
		Global.rocket_is_equipped = true
		$Buy3.text = "EQUIPED"
		$Buy.text = "EQUIP"
		$Buy2.text = "EQUIP"
		
		Global.sniper_gun_is_equipped = false
		Global.Big_lazer_gun_is_equipped = false
	else:
		$Buy3.text = "EQUIP"
		Global.rocket_is_equipped = false


func _on_Upgrades_pressed():
	get_tree().change_scene(#wait)
