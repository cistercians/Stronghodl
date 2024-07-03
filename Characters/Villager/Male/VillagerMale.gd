extends CharacterBody2D

@onready var overworld = get_node("../Overworld")
@onready var underworld = get_node("../Underworld")
@onready var _animated_sprite = $AnimatedSprite2D
@export var z = 1
@export var moving = 0
@export var speed = 1
@onready var direction = "D"
var path: Array[Vector2i]

@onready var flip_dir = {
	"R":"L",
	"UR":"UL",
	"DR":"DL"
}

func update_direction(dir):
	var arr = ["R","DR","D","DL","L","UL","U","UR"]
	var val = dir.angle() / (PI/4)
	var direction = arr[wrapi(int(val), 0,8)]
	return direction

func _process(_delta):
	if moving == 0:
		if direction == "R" || direction == "UR" || direction == "DR":
			_animated_sprite.flip_h = true
			_animated_sprite.play("Stand_" + flip_dir[direction])
		else:
			_animated_sprite.flip_h = false
			_animated_sprite.play("Stand_" + direction)
	elif moving == 1:
		if direction == "R" || direction == "UR" || direction == "DR":
			_animated_sprite.flip_h = true
			_animated_sprite.play("Walk_" + flip_dir[direction])
		else:
			_animated_sprite.flip_h = false
			_animated_sprite.play("Walk_" + direction)
	elif moving == 2:
		if direction == "R" || direction == "UR" || direction == "DR":
			_animated_sprite.flip_h = true
			_animated_sprite.play("Run_" + flip_dir[direction])
		else:
			_animated_sprite.flip_h = false
			_animated_sprite.play("Run_" + direction)

func _physics_process(delta):
	pass
