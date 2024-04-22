extends State
class_name Idle

@export var char: CharacterBody2D
@export var move_speed:= 40

var move_direction: Vector2
var wander_time: float
var wander_cooldown: float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(3, 5)
	wander_cooldown = randf_range(5, 10)
	char.moving = 1
	
func Enter():
	randomize_wander()

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	elif wander_cooldown > 0:
		char.moving = 0
		wander_cooldown -= delta
	else:
		randomize_wander()
		
func Physics_Update(delta: float):
	char.direction = update_direction(move_direction)
	char.velocity = move_direction * move_speed
	
func update_direction(dir):
	var arr = ["R","DR","D","DL","L","UL","U","UR"]
	var val = int(rad_to_deg(dir.angle())/45)
	var direction = arr[val % 8]
	return direction
