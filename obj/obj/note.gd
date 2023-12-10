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
			sprite.flip_h = flip

@export var texture : Texture = preload("res://assets/graphics/documents/world/01.svg"):
	set(val):
		texture = val
		if Engine.is_editor_hint():
			sprite.texture = texture
@export var note : Texture:
	set(val):
		note = val
		if Engine.is_editor_hint():
			note_display.texture = texture


func _ready() -> void:
	note_display.texture = texture
	sprite.texture = texture
	sprite.flip_h = flip
	display.hide()
