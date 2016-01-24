
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var i
var AntScene
var AntNode
var AntNPC = []
func _ready():
	# Initialization here
	
	AntScene = load("res://FourmiNPC.scn")
	AntNode = AntScene.instance()
	randomize()
	for i in range(10):
		AntNPC[i] = add_child(AntNode)
		AntNPC[i].x = randi() % 10
		AntNPC[i].y = randi() % 10
	pass
