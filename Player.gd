extends RigidBody3D

# Movement parameters
const SPEED = 1.0
const JUMP_VELOCITY = 40.5
const SENSITIVITY = 0.003

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_grounded = false
@onready var camera = $CameraPivot/Camera3D

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		camera.rotation.y -= event.relative.y * SENSITIVITY

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta):
	# Apply gravity
	linear_velocity.y -= gravity * delta
	
	# Check ground contact using contact count
	is_grounded = get_contact_count() > 0 && linear_velocity.y <= 0.01
	
	if is_grounded:
		linear_velocity.x = JUMP_VELOCITY
	# Jump
	if Input.is_action_just_pressed("jump") and is_grounded:
		linear_velocity.y = JUMP_VELOCITY
		
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (camera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		linear_velocity.x = direction.x * SPEED
		linear_velocity.z = direction.z * SPEED
	else:
		linear_velocity.x = 0
		linear_velocity.z = 0
