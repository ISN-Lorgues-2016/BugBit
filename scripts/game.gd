extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
export var NOMBREFOURMIS = 10
export var NOMBRENOUR = 5
var i
var fourmiNode = load("res://FourmiNPC.scn")
var fourmiNPCS = []
var fourmi
var painNode = load("res://Pain.scn")
var nourriture = []
var pain
var joueurNode = load("res://Joueur.scn")
var joueur
var menuNode = load("res://Menu_Joueur.scn")
var menu = menuNode.instance()
var barreEnergie
var energie = 0
var screen 
var refcamera = Vector2()
var refjoueur = Vector2()
var tempsMenu = 0
var fourmillere
var fourmilleres = []
var energieMax = 100
var nombreFourmis = 0
var nombreNour = 0
const MAPX = 2000
const MAPY = 2000
func _ready():
	# Initialization here
	Globals.set("MENU",false)
	randomize()
	genFourmis()
	genNour(15)
	genUI()
	joueur = joueurNode.instance()
	add_child(joueur)
	joueur.set_pos(Vector2(0,0))
	set_fixed_process(true)
	screen = get_tree().get_root().get_rect().size
	add_child(menu)


func _fixed_process(delta):
	#barrefaim.set_pos(Vector2(joueur.get_pos().x - 360, joueur.get_pos().y - 180))
	if (energie > energieMax):
		 energie = energieMax
	for i in range(nombreFourmis):
		for j in range(nombreNour):
			var distance = sqrt((nourriture[j].get_pos().x-fourmiNPCS[i].get_pos().x)*(nourriture[j].get_pos().x-fourmiNPCS[i].get_pos().x)+(nourriture[j].get_pos().y-fourmiNPCS[i].get_pos().y)*(nourriture[j].get_pos().y-fourmiNPCS[i].get_pos().y))
			if (distance<150):
				fourmiNPCS[i].objectif.x = nourriture[j].get_pos().x
				fourmiNPCS[i].objectif.y = nourriture[j].get_pos().y
				if (distance < 15):
					nourriture[j].set_pos(Vector2(randi() % MAPX - MAPX/2,randi() % MAPY - MAPY/2))
					#print("OKNPC")
					#print(distance)
					energie += 2
	for j in range(nombreNour):
		var distance = sqrt((nourriture[j].get_pos().x-joueur.get_pos().x)*(nourriture[j].get_pos().x-joueur.get_pos().x)+(nourriture[j].get_pos().y-joueur.get_pos().y)*(nourriture[j].get_pos().y-joueur.get_pos().y))
		if (distance<10):
			nourriture[j].set_pos(Vector2(randi() % MAPX - MAPX/2,randi() % MAPY - MAPY/2))
			energie += 2
			get_node("SamplePlayer").play("ANT-Wassali2")
			#print("OKP")
	gerActions()
	gerUI()

func genNour(var nNour):
	randomize()
	for i in range(nNour):
		pain = painNode.instance()
		pain.set_pos(Vector2(randi() % MAPX - MAPX/2,randi() % MAPY - MAPY/2))
		add_child(pain)
		nourriture.append(pain)
		nombreNour += 1
	pass

func genFourmis():
	randomize()
	for i in range(NOMBREFOURMIS):
		fourmi = fourmiNode.instance()
		fourmi.set_pos(Vector2(randi() % MAPX - MAPX/2,randi() % MAPY - MAPY/2))
		add_child(fourmi)
		fourmiNPCS.append(fourmi)
		nombreFourmis += 1
	pass
	
func genFourmisAt(var x, var y, var nombreF):
	randomize()
	for i in range(nombreF):
		fourmi = fourmiNode.instance()
		fourmi.set_pos(Vector2(x, y))
		add_child(fourmi)
		fourmiNPCS.append(fourmi)
		nombreFourmis += 1
	pass

func genUI():
	screen = get_tree().get_root().get_rect().size
	barreEnergie = ProgressBar.new()
	barreEnergie.set_custom_minimum_size(Vector2(100,10))
	add_child(barreEnergie)

func gerActions():
	var action = Globals.get("ACTION")
	if ((action == "ConstruireBase") && (energie >= 20 )):
		print("OKConstruire")
		genBase()
	Globals.set("ACTION", "Aucune")

func gerUI():
	refcamera = Vector2(joueur.get_node("Camera").get_camera_pos().x - OS.get_window_size().x/3,joueur.get_node("Camera").get_camera_pos().y - OS.get_window_size().y/3)
#	refjoueur = Vector2(joueur.get_node("Camera").get_camera_screen_center().x,joueur.get_node("Camera").get_camera_screen_center().y)
	refjoueur = joueur.get_pos()
	barreEnergie.set_pos(refcamera)
	barreEnergie.set_val(energie)
	if (Globals.get("MENU") == true):
		menu.set_pos(Vector2(refjoueur.x+20,refjoueur.y))
	else:
		menu.set_pos(Vector2(2000,2000))

func genBase():
	randomize()
	get_node("SamplePlayer").play("ANT-Scared2")
	fourmillere = load("res://Fourmillere.scn").instance()
	fourmillere.set_pos(refjoueur)
	add_child(fourmillere)
	fourmilleres.append(fourmillere)
	energie -= 20
	genFourmisAt(refjoueur.x, refjoueur.y, 1)
	pass