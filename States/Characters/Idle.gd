extends State
class_name Idle

@onready var overworld = get_node("../../../Overworld")
@onready var underworld = get_node("../../../Underworld")
@export var char: CharacterBody2D

var wander_timer = randf_range(500,2500)

func random_wander():
	var x = randi_range(-3,3) * 64
	var y = randi_range(-3,3) * 64
	var target = Vector2(char.position.x + x, char.position.y + y)
	char.set_path(target)

func Enter():
	pass

func Update(delta: float):
	if wander_timer > 0:
		wander_timer -= 1
	else:
		wander_timer += randf_range(500,2500)
		random_wander()
		
func Physics_Update(delta: float):
	pass
