
extends Node2D
# member variables here, example:
# var a=2
# var b="textvar"
const VITESSE_MARCHE = 100
var vitesse = Vector2()
var rotation = 0
var mouvement

func _fixed_process(delta):
	vitesse.x = 0
	vitesse.y = 0
	if (Input.is_action_pressed("move_down") && Input.is_action_pressed("move_left")):
		vitesse.x = -VITESSE_MARCHE
		vitesse.y = VITESSE_MARCHE
		rotation = 3*PI/4
	elif (Input.is_action_pressed("move_up") && Input.is_action_pressed("move_left")):
		vitesse.x = -VITESSE_MARCHE
		vitesse.y = -VITESSE_MARCHE
		rotation = PI/4
	elif (Input.is_action_pressed("move_down") && Input.is_action_pressed("move_right")):
		vitesse.x = VITESSE_MARCHE
		vitesse.y = VITESSE_MARCHE
		rotation= -3*PI/4
	elif (Input.is_action_pressed("move_up") && Input.is_action_pressed("move_right")):
		vitesse.x = VITESSE_MARCHE
		vitesse.y = -VITESSE_MARCHE
		rotation= -PI/4
	elif (Input.is_action_pressed("move_up")):
		vitesse.y = -VITESSE_MARCHE
		rotation = 0
	elif (Input.is_action_pressed("move_down")):
		vitesse.y = VITESSE_MARCHE
		rotation = PI
	elif (Input.is_action_pressed("move_left")):
		vitesse.x = -VITESSE_MARCHE
		rotation = PI/2
	elif (Input.is_action_pressed("move_right")):
		vitesse.x = VITESSE_MARCHE
		rotation = -PI/2
	set_rot(rotation)
	mouvement = vitesse * delta
	move(mouvement)


func _ready():
	set_fixed_process(true)
	pass
