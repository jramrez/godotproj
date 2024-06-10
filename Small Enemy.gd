extends CharacterBody2D

const SPEED = 100
var HEALTH = 10
var player_chase = false
var player = null
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if player_chase:
		velocity = (player.get_global_position() - position).normalized() * SPEED * delta
		_animated_sprite.play("Run")
		if velocity.x < 0:
			if(!_animated_sprite.is_flipped_h()):
				_animated_sprite.set_flip_h(!_animated_sprite.is_flipped_h())
		elif velocity.x > 0:
			if(_animated_sprite.is_flipped_h()):
				_animated_sprite.set_flip_h(!_animated_sprite.is_flipped_h())
	else:
		velocity = Vector2(0,0)
		_animated_sprite.play("Idle")
	move_and_collide(velocity)

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false
	










