extends Sprite3D
#
#@export var speed: float = 20.0
#func _process(delta):
	#var input = 0.0
	#var inputy= 0.0
	#if Input.is_action_pressed("move_left"):
		#input -= 1.0
	#if Input.is_action_pressed("move_right"):
		#input += 1.0
	#if Input.is_action_just_pressed("jump"):
		#inputy += 10.0
	#else:
		#inputy += -0.5
#
	#position.x += input * speed * delta
	#position.y += inputy * speed * delta
	#if position.y < 2:
		#position.y = 2   
