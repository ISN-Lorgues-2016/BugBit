
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass

func _fixed_process(delta):
	move( Vector2(0,1) ) #move down 1 pixel per physics frame


