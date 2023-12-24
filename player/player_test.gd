extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO   #store input vector
var swing : bool = false  #flag variable for swing

@onready var animation_tree = $AnimationTree  #reference to animation tree to use as variable

func _physics_process(_delta):   #if the player is not swinging then its moving, else no motion
	if not swing:
		velocity = direction * 75
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	
func _process(_delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up","ui_down") #getting input vector 
	
	if direction != Vector2.ZERO and not swing:
		set_walking(true)
		update_blend_position()
	else:  #setting back to idle state
		set_walking(false)
	
	if Input.is_action_just_pressed("swing"): #if input is pressed (space), swing is set to true
		set_swing(true)
	
func set_swing(value = false):
	swing = value
	animation_tree["parameters/conditions/swing"] = value
	print(swing)
	
	
func set_walking(value):  #setting walking to true, and idle to not true
	animation_tree["parameters/conditions/is_walking"] = value
	animation_tree["parameters/conditions/idle"] = not value
	
func update_blend_position(): #properties from animationTree
	animation_tree["parameters/Attack/blend_position"] = direction
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Walk/blend_position"] = direction
	
	
	
	
