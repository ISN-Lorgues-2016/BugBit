extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
export var NOMBREFOURMIS = 10
export var NOMBRENOUR = 5
var i
var fourmiNode = load("res://FourmiNPC.scn")
export var fourmiNPCS = []
var fourmi
var painNode = load("res://Pain.scn")
export var nourriture = []
var pain
var joueurNode = load("res://Joueur.scn")
var joueur
func _ready():
	# Initialization here
	randomize()
	for i in range(NOMBREFOURMIS):
		fourmi = fourmiNode.instance()
		fourmi.set_pos(Vector2(randi() % 1000 - 500,randi() % 1000 - 500))
		add_child(fourmi)
		fourmiNPCS.append(fourmi)
	pass
	for i in range(NOMBRENOUR):
		pain = painNode.instance()
		pain.set_pos(Vector2(randi() % 1000 - 500,randi() % 1000 - 500))
		add_child(pain)
		nourriture.append(pain)
	pass
	joueur = joueurNode.instance()
	add_child(joueur)
	joueur.set_pos(Vector2(0,0))
	set_fixed_process(true)


func _fixed_process(delta):
	for i in range(NOMBREFOURMIS):
		for j in range(NOMBRENOUR):
			var distance = sqrt((nourriture[j].get_pos().x-fourmiNPCS[i].get_pos().x)*(nourriture[j].get_pos().x-fourmiNPCS[i].get_pos().x)+(nourriture[j].get_pos().y-fourmiNPCS[i].get_pos().y)*(nourriture[j].get_pos().y-fourmiNPCS[i].get_pos().y))
			if (distance<10):
				nourriture[j].set_pos(Vector2(randi() % 1000 - 500,randi() % 1000 - 500))
				print("OKNPC")
				print(distance)
	for j in range(NOMBRENOUR):
		var distance = sqrt((nourriture[j].get_pos().x-joueur.get_pos().x)*(nourriture[j].get_pos().x-joueur.get_pos().x)+(nourriture[j].get_pos().y-joueur.get_pos().y)*(nourriture[j].get_pos().y-joueur.get_pos().y))
		if (distance<10):
			nourriture[j].set_pos(Vector2(randi() % 1000 - 500,randi() % 1000 - 500))
			print("OKP")