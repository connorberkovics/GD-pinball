extends RigidBody2D
class_name Flipper


@export var flip_degrees: float = 45.0
@export var flip_force: float = 700.0

@onready var start_angle := rotation_degrees
@onready var target_angle := start_angle - flip_degrees


func _physics_process(delta: float) -> void:
	var rotation_value := rotation_degrees
	_handle_left_flip(flip_force * delta)
	
	if Input.is_action_pressed("left_flipper"):
		if rotation_value > target_angle:
			rotation_value -= flip_force * delta
		elif rotation_value <= target_angle:
			rotation_value = target_angle
	else:
		if rotation_value < start_angle:
			rotation_value += flip_force * delta
		elif rotation_value >= start_angle:
			rotation_value = start_angle
	
	rotation_degrees = rotation_value


func _handle_left_flip(rotate_speed: float) -> void:
	var rotation_value := rotation_degrees
	
	if Input.is_action_pressed("left_flipper"):
		if rotation_value > target_angle:
			rotation_value -= rotate_speed
		elif rotation_value <= target_angle:
			rotation_value = target_angle
