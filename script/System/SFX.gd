extends Node

var is_playing = false
var is_fadein = false
var is_fadeout = false
var is_free = false
var is_loop = false
var is_expire = false

var res_sfx = ""
onready var sfxplay = $SFXPlayer

func _ready():
	add_to_group("sfx")
	sfxplay.stream = res_sfx
	sfxplay.volume_db = 0
	play_sfx(0)
#	print(sfxplay.stream.get_length())
	
	

func play_sfx(delay):
	if delay > 0:
		yield(get_tree().create_timer(delay),"timeout")
	is_playing = true
	sfxplay.play()

func _on_SFXPlayer_finished():
	if is_expire:
#		print(str(self)+" sfx has finish!")
		self.queue_free()

