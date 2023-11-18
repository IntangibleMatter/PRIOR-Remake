extends CharacterBody2D


@onready var eye_sprite: Sprite2D = $EyeSprite

#const eyesprite : Texture2D = preload("res://assets/graphics/player/eye.svg")
#var eyepos : Vector2
const eyepositions : Dictionary = {
	"right": 49.5,
	"left": 9.25,
	"top": 9.375,
	"bottom": 50.625
}
const eye_speed := 0.2

# -1 is left, 1 is right
#var last_dir : int = -1

const SPEED := 300.0
const ACCEL := 800.0
const JUMP_VELOCITY := -485.0
const FRICTION := 0.4

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var prevdir : float = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction != prevdir:
		if direction > 0.2:
			update_eye("right")
		elif direction < -0.2:
			update_eye("left")
	prevdir = direction
	if direction:
		velocity.x += ACCEL * direction * delta
	else:
		velocity.x = lerp(velocity.x, 0.0, FRICTION)
	velocity.x = clamp(velocity.x, -SPEED, SPEED)
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_down"):
		update_eye("down")
	elif event.is_action_released("move_down"):
		update_eye("up")


func update_eye(target: String) -> void:
	var tween := get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	match target:
		"left":
			tween.tween_property(eye_sprite, "offset:x", eyepositions.left, eye_speed)
		"right":
			tween.tween_property(eye_sprite, "offset:x", eyepositions.right, eye_speed)
		"down":
			tween.tween_property(eye_sprite, "offset:y", eyepositions.bottom, eye_speed)
		"up":
			tween.tween_property(eye_sprite, "offset:y", eyepositions.top, eye_speed)
