
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var attente = 0
func _ready():
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	attente += delta
	if (get_node("Valider").is_pressed() && (attente > 0.5)):
		attente = 0
		Globals.set("ACTION","ConstruireBase")
	if get_node("Menu_Principal").is_pressed():
		get_tree().change_scene("res://MenuPrincipal.scn")
