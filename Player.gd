extends CharacterBody2D

const MOVE_SPEED = 120
var HEALTH = 150

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	_anim_move(delta)
	_anim_turn(delta)
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	velocity = direction.normalized() * MOVE_SPEED
	move_and_slide()
	
func _anim_move(_delta):
	if (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up")):
		_animated_sprite.play("Run")
	else:
		_animated_sprite.play("Idle")
		
func _anim_turn(_delta):
	if(Input.is_action_pressed("ui_right")):
		if(_animated_sprite.is_flipped_h()):
			_animated_sprite.set_flip_h(!_animated_sprite.is_flipped_h())
	if(Input.is_action_pressed("ui_left")):
		if(!_animated_sprite.is_flipped_h()):
			_animated_sprite.set_flip_h(!_animated_sprite.is_flipped_h())
