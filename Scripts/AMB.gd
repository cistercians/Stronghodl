extends Node

enum ENV {
	CAVE,
	CHATTER,
	EMPTY,
	EVIL,
	FIRE,
	FOREST,
	HUSH,
	MOUNTAINS,
	NATURE,
	RAIN,
	RITUAL,
	SEA,
	SEASTORM,
	SINISTER,
	SPIRITS,
	TORTURE,
	UNDERWATER,
	WINDY
}

var TRACKS = {
	ENV.CAVE: preload("res://Audio/amb/cave.mp3"),
	ENV.CHATTER: preload("res://Audio/amb/chatter.mp3"),
	ENV.EMPTY: preload("res://Audio/amb/empty.mp3"),
	ENV.EVIL: preload("res://Audio/amb/evil.mp3"),
	ENV.FIRE: preload("res://Audio/amb/fire.mp3"),
	ENV.FOREST: preload("res://Audio/amb/forest.mp3"),
	ENV.HUSH: preload("res://Audio/amb/hush.mp3"),
	ENV.MOUNTAINS: preload("res://Audio/amb/mountains.mp3"),
	ENV.NATURE: preload("res://Audio/amb/nature.mp3"),
	ENV.RAIN: preload("res://Audio/amb/rain.mp3"),
	ENV.RITUAL: preload("res://Audio/amb/ritual.mp3"),
	ENV.SEA: preload("res://Audio/amb/sea.mp3"),
	ENV.SEASTORM: preload("res://Audio/amb/seastorm.mp3"),
	ENV.SINISTER: preload("res://Audio/amb/sinister.mp3"),
	ENV.SPIRITS: preload("res://Audio/amb/spirits.mp3"),
	ENV.TORTURE: preload("res://Audio/amb/torture.mp3"),
	ENV.UNDERWATER: preload("res://Audio/amb/underwater.mp3"),
	ENV.WINDY: preload("res://Audio/amb/windy.mp3")
}

var current_env:int = ENV.FOREST
var is_repeating:bool = true
@onready var streamPlayer:AudioStreamPlayer = $AudioStreamPlayer

func play_ambience(env:int, repeat_amb:bool = true):
	if current_env != env or !streamPlayer.playing:
		is_repeating = false
		streamPlayer.stop()
		is_repeating = repeat_amb
		current_env = env
		
		streamPlayer.stream = TRACKS[current_env]
		streamPlayer.play()

func replay_amb():
	streamPlayer.stream = TRACKS[current_env]
	streamPlayer.play()

func _on_audio_stream_player_finished():
	if is_repeating:
		replay_amb()
