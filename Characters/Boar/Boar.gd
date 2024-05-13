extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@export var moving = 0
@onready var direction = "D"

@onready var flip_dir = {
	"R":"L",
	"UR":"UL",
	"DR":"DL"
}

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
	move_and_slide()


func _on_detection_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.


func _on_detection_body_exited(body):
	pass # Replace with $Camera2Dfunction body.
