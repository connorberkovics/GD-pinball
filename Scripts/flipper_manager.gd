extends Node2D
class_name FlipperManager


@export var flipper_rotation: float = 45.0
@export var flipper_rotate_speed: float = 700.0

@onready var left_flipper: RigidBody2D = $LeftFlipper
@onready var right_flipper: RigidBody2D = $RightFlipper

@onready var left_start_angle := left_flipper.rotation_degrees
@onready var left_target_angle := left_start_angle - flipper_rotation
@onready var right_start_angle := right_flipper.rotation_degrees
@onready var right_target_angle := right_start_angle + flipper_rotation


func _physics_process(delta: float) -> void:
	var left_curr_angle := left_flipper.rotation_degrees
	var right_curr_angle := right_flipper.rotation_degrees
	
	if Input.is_action_pressed("left_flipper"):
		if left_curr_angle > left_target_angle:
			left_curr_angle -= flipper_rotate_speed * delta
		elif left_curr_angle <= left_target_angle:
			left_curr_angle = left_target_angle
	else:
		if left_curr_angle < left_start_angle:
			left_curr_angle += flipper_rotate_speed * delta
		elif left_curr_angle >= left_start_angle:
			left_curr_angle = left_start_angle
	
	if Input.is_action_pressed("right_flipper"):
		if right_curr_angle < right_target_angle:
			right_curr_angle += flipper_rotate_speed * delta
		elif right_curr_angle >= right_target_angle:
			right_curr_angle = right_target_angle
	else:
		if right_curr_angle > right_start_angle:
			right_curr_angle -= flipper_rotate_speed * delta
		elif right_curr_angle <= right_start_angle:
			right_curr_angle = right_start_angle
	
	left_flipper.rotation_degrees = left_curr_angle
	right_flipper.rotation_degrees = right_curr_angle
