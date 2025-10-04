@tool
extends AnimatableBody2D

@onready var collision: CollisionPolygon2D = $CollisionPolygon2D
@onready var occluder: LightOccluder2D = $LightOccluder2D

@export var width : float = 64.0:
	set(val):
		width = val
		if Engine.is_editor_hint():
			refresh_rect()
@export var length : float = 256.0:
	set(val):
		length = val
		if Engine.is_editor_hint():
			refresh_rect()


@export var open_speed : float = 1.5
@export var open_delay : float = 0.0

@export var flag : String = "electricity"

# basically just a special case for Low.
@export var close : bool = false

var drawn_rect : Rect2

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	if Save.data.get(flag, false) and not close:
		drawn_rect = Rect2(-width/2, 0, width, 0)
	else:
		drawn_rect = Rect2(-width/2, 0, width, length)

	occluder.occluder = OccluderPolygon2D.new()
	if not collision.is_node_ready():
		await collision.ready
	refresh_rect()


func refresh_rect() -> void:
	if Engine.is_editor_hint():
		drawn_rect = Rect2(-width/2, 0, width, length)
		return
	if not Save.data[flag] and not close:
			drawn_rect = Rect2(-width/2, 0, width, length)
	else:
		drawn_rect = Rect2(-width/2, 0, width, 0)
	await get_tree().process_frame
	refresh_polygons()


func refresh_polygons(_t: float = 0) -> void:
	var points := rect_to_points(drawn_rect)
	collision.polygon = points
	occluder.occluder.polygon = points

func rect_to_points(rect) -> PackedVector2Array:
	var points : PackedVector2Array = [
		rect.position,
		rect.position + Vector2(rect.size.x, 0),
		rect.position + rect.size,
		rect.position + Vector2(0, rect.size.y)
	]
	return points



func open() -> void:
	if Engine.is_editor_hint():
		return
	await get_tree().create_timer(open_delay).timeout
	var tween := get_tree().create_tween().set_parallel(true).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "drawn_rect:size:y", (length if close else 0.0), open_speed)
	tween.tween_method(refresh_polygons, 0, 1, open_speed)
	if not Save.data.get(flag, false):
		Save.data[flag] = true


func _process(_delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	draw_rect(drawn_rect, Color.BLACK)
