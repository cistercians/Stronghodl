extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	_animated_sprite.play("Stand_D")

func _on_detection_body_entered(body):
	pass # Replace with function body.


func _on_detection_body_exited(body):
	pass # Replace with function body.
