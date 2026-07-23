extends RigidBody2D
class_name Flipper


@export_range(-1.0, 1.0, 2.0) var direction: float = -1.0
@export var flip_degrees: float = 50.0
@export var flip_speed: float = 800.0
@export var flip_input_action: String = ""

@onready var start_rotation := rotation_degrees
@onready var target_rotation := rotation_degrees + flip_degrees * direction


func _ready() -> void:
	# Set RB2D properties on first frame
	_set_rb2d_properties()


func _physics_process(delta: float) -> void:
	# Get current rotation angle
	var current_rotation := rotation_degrees
	
	# Rotate when input is detected
	if Input.is_action_pressed(flip_input_action):
		current_rotation = move_toward(
				current_rotation,
				target_rotation,
				flip_speed * delta
		)
	else:
		current_rotation = move_toward(
				current_rotation,
				start_rotation,
				flip_speed * delta
		)
	
	# Set rotation angle
	rotation_degrees = current_rotation


func _set_rb2d_properties() -> void:
	gravity_scale = 0.0
	freeze = true
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
