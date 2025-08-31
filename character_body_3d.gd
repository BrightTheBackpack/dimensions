extends CharacterBody3D


const SPEED = 10.0
@export var JUMP_VELOCITY = 13.0
@export var GRAVITY = -15.0
@export var GRAVITY_DOWN = -75.0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		print_debug(velocity)
		if(velocity.y > 0.9*JUMP_VELOCITY):
			
			velocity += Vector3(0.0, GRAVITY, 0.0) * delta
			
		elif(velocity.y >0):
			velocity += Vector3(0.0, GRAVITY_DOWN/1.3 , 0.0) * delta
		else:
			velocity += Vector3(0.0, GRAVITY_DOWN, 0.0) * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "ui_end", "ui_end")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
