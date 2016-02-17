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
var barrefaim
var faim = 100
var screen 
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
	screen = get_tree().get_root().get_rect().size
	barrefaim = ProgressBar.new()
	barrefaim.set_custom_minimum_size(Vector2(100,10))
	add_child(barrefaim)
	joueur = joueurNode.instance()
	add_child(joueur)
	joueur.set_pos(Vector2(0,0))
	set_fixed_process(true)
	screen = get_tree().get_root().get_rect().size


func _fixed_process(delta):
	barrefaim.set_pos(Vector2(joueur.get_node("Camera").get_camera_screen_center().x-screen.x/2,joueur.get_node("Camera").get_camera_screen_center().y-screen.y/2))
	#barrefaim.set_pos(Vector2(joueur.get_pos().x - 360, joueur.get_pos().y - 180))
	if (faim > 100): faim = 100
	faim -= delta*0.2
	barrefaim.set_val(faim)
	for i in range(NOMBREFOURMIS):
		for j in range(NOMBRENOUR):
			var distance = sqrt((nourriture[j].get_pos().x-fourmiNPCS[i].get_pos().x)*(nourriture[j].get_pos().x-fourmiNPCS[i].get_pos().x)+(nourriture[j].get_pos().y-fourmiNPCS[i].get_pos().y)*(nourriture[j].get_pos().y-fourmiNPCS[i].get_pos().y))
			if (distance<10):
				nourriture[j].set_pos(Vector2(randi() % 1000 - 500,randi() % 1000 - 500))
				#print("OKNPC")
				#print(distance)
	for j in range(NOMBRENOUR):
		var distance = sqrt((nourriture[j].get_pos().x-joueur.get_pos().x)*(nourriture[j].get_pos().x-joueur.get_pos().x)+(nourriture[j].get_pos().y-joueur.get_pos().y)*(nourriture[j].get_pos().y-joueur.get_pos().y))
		if (distance<10):
			nourriture[j].set_pos(Vector2(randi() % 1000 - 500,randi() % 1000 - 500))
			faim += 10
			get_node("SamplePlayer").play("ANT-Wassali2")
			#print("OKP")