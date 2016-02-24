
extends StreamPlayer

var song1
var song2
var song3
var song4
var songn = 0
var currentSong = song1
var musique = false

func _ready():
	set_process(true)
	song1 = load("res://audio/Music/Veau.ogg")
	song2 = load("res://audio/Music/Pas trop caca.ogg")
	song3 = load("res://audio/Music/Church1.ogg")
	song4 = load("res://audio/Music/Un peu caca.ogg")
	self.set_stream(song1)
	randomize()

   
func _process(delta):
	musique = Globals.get("MUSIQUE")
	if((self.is_playing() != true) && (musique == true)):
		songn = randi()%4
		if (songn == 0):
			self.set_stream(song1)
		if (songn == 1):
			self.set_stream(song2)
		if (songn == 2):
			self.set_stream(song3)
		if (songn == 3):
			self.set_stream(song4)
		self.play()