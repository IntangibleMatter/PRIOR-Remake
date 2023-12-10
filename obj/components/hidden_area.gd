@tool
extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D

@export var shape : Shape2D:
	set(newshape):
		shape = newshape
		if Engine.is_editor_hint():
			collision.shape = shape
@export var texture : Texture:
	set(newtex):
		texture = newtex
		if Engine.is_editor_hint():
			sprite.texture = texture

@export var flag : String

func _ready() -> void:
	if Save.data.has(flag):
		if Save.data[flag]:
			print("lmao bye")
			queue_free()
	collision.shape = shape
	sprite.texture = texture


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	var tween := get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.3)
	await tween.finished
	queue_free()
