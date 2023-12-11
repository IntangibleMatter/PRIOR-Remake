@tool
extends Area2D

@onready var collision: CollisionShape2D = $CollisionShape2D

@export var save_value : String

@export var shape: Shape2D:
	set(val):
		shape = val
		if Engine.is_editor_hint():
			collision.shape = val


var triggered : bool = false

signal trigger_entered

func _ready() -> void:
	collision.shape = shape
	if Save.data[save_value]:
		triggered = true
	if triggered:
		monitoring = false


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if not body.is_in_group("player"):
		return
	triggered = true
	monitoring = false
	emit_signal("trigger_entered")
	Save.set_data(save_value, true)

