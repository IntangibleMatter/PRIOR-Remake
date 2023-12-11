extends CharacterBody2D


@onready var eye_sprite: Sprite2D = $EyeSprite
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var fallsprite: Sprite2D = $Fallsprite

const death := preload("res://obj/player/death.tscn")

#const eyesprite : Texture2D = preload("res://assets/graphics/player/eye.svg")
#var eyepos : Vector2
const eyepositions : Dictionary = {
	"right": 49.5,
	"left": 9.25,
	"top": 9.375,
	"bottom": 38.625
}
const eye_speed := 0.2

@onready var has_antigrav : bool = Save.data.antigrav
@onready var has_doublejump : bool = Save.data.double
var can_antigrav : bool = true
var can_doublejump : bool = true


# -1 is left, 1 is right
#var last_dir : int = -1

const SPEED := 250.0
const ACCEL := 10000.0
const JUMP_VELOCITY := -485.0
const FRICTION := 0.4

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var prevdir : float = 0

var fastfall : bool = false

const antigrav_normal_tolerance := 0.5
const antigrav_slowdown := 0.016
const antigrav_friction := 0.004
const min_antigrav_speed := 110.0
var antigrav : bool = false

func _ready() -> void:
	Save.data_changed.connect(update_data)
	animation.animation_finished.connect(blink)
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
	if Input.is_action_pressed("move_down"):
		fastfall = true
	blink()


func update_data(item: String, value: Variant) -> void:
	if item == "double":
		has_doublejump = value
	elif item == "antigrav":
		has_antigrav = value


func blink(_anim: StringName = "") -> void:
	var time := randf_range(1.0, 5.0)
	await get_tree().create_timer(time).timeout
	animation.play("blink")


func _physics_process(delta: float) -> void:
	if antigrav:
		_move_antigrav(delta)
	else:
		_move_normal(delta)


func _move_antigrav(delta) -> void:
	fallsprite.scale.y = 0
	var touching := move_and_collide(velocity * delta)
	if touching != null:
		var normal := touching.get_normal()
		prints("normal", normal)
		if abs(normal.x) < 1+antigrav_normal_tolerance and abs(normal.x) > 1-antigrav_normal_tolerance:
			velocity.x = 0
		if abs(normal.y) < 1+antigrav_normal_tolerance and abs(normal.y) > 1-antigrav_normal_tolerance:
			if abs(velocity.y) > min_antigrav_speed:
				velocity.y *= 1.1
				velocity.y = -velocity.y
			else:
				velocity.y = 0
	velocity.y = lerp(velocity.y, 0.0, antigrav_slowdown)
	velocity.x = lerp(velocity.x, 0.0, antigrav_friction)


func _move_normal(delta) -> void:
	if not is_on_floor():
		velocity.y += (gravity * delta) * (4 if fastfall else 1)
		if velocity.y > 0:
			get_tree().create_tween().tween_property(fallsprite, "scale:y", (velocity.y / (gravity * 3)), delta)
		else:
			get_tree().create_tween().tween_property(fallsprite, "scale:y", 0, delta)
	else:
		get_tree().create_tween().tween_property(fallsprite, "scale:y", 0, delta)
		can_doublejump = true
		can_antigrav = true
	if Input.is_action_pressed("move_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	elif (
		(Input.is_action_pressed("move_jump") and velocity.y > 5)
		or Input.is_action_just_pressed("move_jump"))\
		and (can_doublejump and has_doublejump):
			velocity.y = JUMP_VELOCITY
			can_doublejump = false

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
		fastfall = true
	elif event.is_action_released("move_down"):
		update_eye("up")
		fastfall = false
	if event.is_action_pressed("move_antigrav"):
		if has_antigrav:
			if can_antigrav:
				if is_on_floor():
					velocity.y = JUMP_VELOCITY / 2
				antigrav = true
				can_antigrav = false
				motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
			else:
				antigrav = false
				motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
	if event.is_action_pressed("reset"):
		respawn()


func respawn() -> void:
	var scene := get_tree().current_scene
	var d_sprite : Node2D = death.instantiate()
	print(d_sprite)
	scene.add_child(d_sprite)
	d_sprite.global_position = global_position
	prints("playerpos", global_position)
	d_sprite.die("left" if eye_sprite.offset.x < 35 else "right")
	if scene.has_method("spawn_at"):
		scene.spawn_at(Save.data.spawn)
		self.queue_free()


func update_eye(target: String, instant = false) -> void:
	if instant:
		match target:
			"left":
				eye_sprite.offset.x = eyepositions.left
			"right":
				eye_sprite.offset.x = eyepositions.right
			"down":
				eye_sprite.offset.y = eyepositions.bottom
			"up":
				eye_sprite.offset.y = eyepositions.top
		return
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
