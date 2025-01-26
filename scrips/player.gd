extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 8

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 20

# Mouse sensitivity settings
const MOUSE_SENSITIVITY = 0.0025

# Reference to the Camera3D node
@onready var camera = $SpringArm3D/Camera3D
var rotation_x = -10  # Rotation along the X-axis for looking up and down

func _ready():
	# Hide the mouse and capture it
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	
	if event is InputEventMouseMotion:
		# Adjust vertical rotation (camera only)
		rotation_x -= event.relative.y * MOUSE_SENSITIVITY
		#rotation_x = clamp(rotation_x, -90, 90)  # Limit vertical rotation

		# Adjust horizontal rotation (entire character body)
		rotation.y -= event.relative.x * MOUSE_SENSITIVITY

		# Apply vertical rotation to the camera
		camera.rotation_degrees.x = rotation_x

func start_dialog(nps):
	Dialogic.start("test")
	velocity.x == 0
	velocity.z == 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$AP.play("jump")
		velocity.y = JUMP_VELOCITY
		

	var input_dir = Input.get_vector("a", "d", "w", "s")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		$AP.play("walk")
		if Input.is_action_pressed("run"):
			direction = 10
			#velocity.x += 10
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		$AP.stop()
		


	move_and_slide()
	

