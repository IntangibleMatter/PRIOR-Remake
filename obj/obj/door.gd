@tool
extends AnimatableBody2D

@onready var rect: ColorRect = $ColorRect
@onready var collision: CollisionPolygon2D = $CollisionPolygon2D
@onready var occluder: LightOccluder2D = $LightOccluder2D

@export var base_size : Vector2
@export var target : Vector2

@export var open_speed : float = 1.0

@export var flag : String = "electricity"

# why can't I figure this out what the fuck
func draw_polygons() -> void:
	pass
