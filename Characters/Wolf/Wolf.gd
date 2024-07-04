extends CharacterBody2D

@onready var overworld = get_node("../Overworld")
@onready var underworld = get_node("../Underworld")
@onready var _animated_sprite = $AnimatedSprite2D
@export var z = 1
@export var home: Vector2
@export var moving = 0
@export var speed = 1
@onready var direction = "D"
var path: Array[Vector2i]

@onready var flip_dir = {
	"R":"L",
	"UR":"UL",
	"DR":"DL"
}

func set_path(target):
	print("setting path")
	if z == 1:
		var new_path = overworld.astar_land.get_id_path(
			overworld.local_to_map(global_position),
			overworld.local_to_map(target)
		).slice(1)
		
		if !new_path.is_empty():
			path = new_path
			print("got path")

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
	if path.is_empty():
		moving = 0
		return
	var target_position = overworld.map_to_local(path.front())
	global_position = global_position.move_toward(target_position, speed)
	direction = update_direction(global_position.direction_to(target_position))
	moving = 1
	if global_position == target_position:
		path.pop_front()

func _on_detection_body_entered(body):
	pass # Replace with function body.

func _on_detection_body_exited(body):
	pass # Replace with function body.
