
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
const VITESSE_MARCHE = 100
var vitesse = Vector2()
var rotation = 0
var rotationY = 0
var rotationX = 0
var bougeX = 0
var bougeY = 0

func _fixed_process(delta):
	vitesse.x = 0
	vitesse.y = 0
	bougeX = 0
	bougeY = 0
	if (Input.is_action_pressed("move_down")):
		vitesse.y = VITESSE_MARCHE
		rotationY = PI
		bougeY = 1
	if (Input.is_action_pressed("move_up")):
		vitesse.y = -VITESSE_MARCHE
		rotationY = 0
		bougeY = 1
	if (Input.is_action_pressed("move_left")):
		vitesse.x = -VITESSE_MARCHE
		rotationX = PI/2
		bougeX = 1
	if (Input.is_action_pressed("move_right")):
		vitesse.x = VITESSE_MARCHE
		rotationX= PI+PI/2
		bougeX = 1
	if ((bougeX) && (!bougeY)):
		rotation = rotationX
	if ((!bougeX) && (bougeY)):
		rotation = rotationY
	if ((bougeX) && (bougeY)):
		if ((rotationY == 0)&&(rotationX >= PI)):
			rotationY -= 2*PI
		rotation = (rotationX + rotationY)/2
	set_rot(rotation)
	var mouvement = vitesse * delta
	move(mouvement)


func _ready():
	set_fixed_process(true)
	pass
