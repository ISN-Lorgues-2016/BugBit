extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var vitesseMarche = 70
var vitesse = Vector2()
var rotation = 0
var mouvement = 0
var objectif = Vector2()
var distance = 100
var temps = 0
var tempsMax = 10
const MAPX = 2000
const MAPY = 2000
func _ready():
	# Initialization here
	randomize()
	set_fixed_process(true)
	pass
	
	
func _fixed_process(delta):
	tempsMax = randi()%10+5
	if (temps > tempsMax):
		objectif.x = randi() % MAPX - get_global_pos().x - MAPX/2
		objectif.y = randi() % MAPY - get_global_pos().y - MAPY/2
		temps = 0
	temps += delta
	vitesse.x = 0
	vitesse.y = 0
#	if ((objectif.x < get_global_pos().x - 100)&&(objectif.y  > get_global_pos().y - 100)):
#		vitesse.x = -vitesseMarche
#		vitesse.y = vitesseMarche
#		rotation = 3*PI/4
#	elif ((objectif.x < get_global_pos().x - 100)&&(objectif.y < get_global_pos().y + 100)):
#		vitesse.x = -vitesseMarche
#		vitesse.y = -vitesseMarche
#		rotation = PI/4
#	elif ((objectif.x > get_global_pos().x + 100)&&(objectif.y > get_global_pos().y - 100)):
#		vitesse.x = vitesseMarche
#		vitesse.y = vitesseMarche
#		rotation= -3*PI/4
#	elif ((objectif.x > get_global_pos().x + 100)&&(objectif.y < get_global_pos().y + 100)):
#		vitesse.x = vitesseMarche
#		vitesse.y = -vitesseMarche
#		rotation= -PI/4
	if (objectif.y < get_global_pos().y - 10):
		vitesse.y = -vitesseMarche
		rotation = 0
	elif (objectif.y > get_global_pos().y + 10):
		vitesse.y = vitesseMarche
		rotation = PI
	elif (objectif.x < get_global_pos().x - 10):
		vitesse.x = -vitesseMarche
		rotation = PI/2
	elif (objectif.x > get_global_pos().x + 10):
		vitesse.x = vitesseMarche
		rotation = -PI/2
	set_rot(rotation)
	mouvement = vitesse * delta
	move(mouvement)

