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

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		update_eye("left")
	elif event.is_action_pressed("ui_right"):
		update_eye("right")
	print(event)
#	if event.is_action_pressed("ui_left"):
#		last_dir = -1
#	elif event.is_action_pressed("ui_right"):
#		last_dir = 1

func _process(delta: float) -> void:
	pass
#	update_eye(delta)
#	eye_sprite.position = eyepos
#	queue_redraw()


#func _draw() -> void:
#	draw_set_transform(Vector2(-35, -60))
#	draw_texture(eyesprite, to_global(eyepos))

# EYE MANAGEMENT

func update_eye(target: String) -> void:
	prints("ajhdsgajdksahjg", target)
	var tween := get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
	match target:
		"left":
			print("yooo")
			tween.tween_property(
				eye_sprite, "offset:x", eyepositions.left,
				eye_speed# * eye_sprite.position.x - (eye_sprite.position.x - eyepositions.left)
			)
		"right":
			print("asdjhsdagjh")
			tween.tween_property(
				eye_sprite, "offset:x", eyepositions.right,
				eye_speed# * eye_sprite.position.x - (eye_sprite.position.x - eyepositions.right)
			)
