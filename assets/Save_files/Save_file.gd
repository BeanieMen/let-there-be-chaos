extends Node

var Save_file = File.new()
var save_path = "user://Save_files/saved.dat"

func _ready():
	Save_file.open(save_path, Save_file.READ)
	Global.Coins = Save_file.get_var()
	Save_file.close()
