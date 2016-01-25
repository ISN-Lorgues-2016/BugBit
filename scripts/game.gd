extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var i
var antNode = load("res://FourmiNPC.scn")
var antNPCS = []
var ant
func _ready():
	# Initialization here
	randomize()
	for i in range(10):
		ant = antNode.instance()
		ant.set_pos(Vector2(randi() % 1000 - 500,randi() % 1000 - 500))
		add_child(ant)
		antNPCS.append(ant)
	pass
