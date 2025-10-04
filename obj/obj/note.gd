@tool
extends Area2D

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var display: CanvasLayer = $CanvasLayer
@onready var note_display: TextureRect = $CanvasLayer/TextureRect

@export var flip : bool = false:
	set(val):
		flip = val
		if Engine.is_editor_hint():
			if not is_node_ready():
				await ready
			sprite.flip_h = flip

@export var texture : Texture = preload("res://assets/graphics/documents/world/01.svg"):
	set(val):
		texture = val
		if not is_node_ready():
			await ready
		if Engine.is_editor_hint():
			sprite.texture = texture
@export var note : Texture:
	set(val):
		note = val
		if not is_node_ready():
			await ready
		if Engine.is_editor_hint():
			note_display.texture = texture

@export var note_overrides: Array[Texture]

func _ready() -> void:
	note_display.texture = note
	sprite.texture = texture
	sprite.flip_h = flip
	display.hide()


func display_toggle(vis: bool) -> void:
	display.visible = vis
