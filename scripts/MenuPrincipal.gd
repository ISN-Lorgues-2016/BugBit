extends Node
var cetteScene
func _ready():
	get_tree()
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if get_node("Play").is_pressed:
		get_tree().change_scene("res://game.scn")
	if get_node("BoutonMusique").is_pressed():
		Globals.set("MUSIQUE",true)
	elif get_node("BoutonMusique").is_pressed() == false:
		Globals.set("MUSIQUE",false)
