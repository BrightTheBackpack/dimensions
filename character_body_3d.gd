extends CharacterBody3D


const SPEED = 10.0
@export var JUMP_VELOCITY = 13.0
@export var GRAVITY = -15.0
@export var GRAVITY_DOWN = -75.0
var THREE_D = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and !THREE_D:
		print_debug(velocity)
		if(velocity.y > 0.9*JUMP_VELOCITY):
			
			velocity += Vector3(0.0, GRAVITY, 0.0) * delta
			
		elif(velocity.y >0):
			velocity += Vector3(0.0, GRAVITY_DOWN/1.3 , 0.0) * delta
		else:
			velocity += Vector3(0.0, GRAVITY_DOWN, 0.0) * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if THREE_D:
			velocity.z = JUMP_VELOCITY
		else:
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed('switch'):
		THREE_D = true
		
	var input_dir := Input.get_vector("a", "d", "s", "w")
	var direction := (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if THREE_D:
		direction = (transform.basis * Vector3(input_dir.x, input_dir.y ,0 ))
	if direction:
		velocity.x = direction.x * SPEED
		if THREE_D:
			velocity.y = direction.y * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if THREE_D:
			velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
