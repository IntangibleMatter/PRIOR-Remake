@tool
extends Area2D

@export var shape : Shape2D:
	set(value):
		shape = value
		if Engine.is_editor_hint():
			collider.shape = shape

@export var scene : String = "01"
@export var spawn : int = 0

@onready var collider: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	await get_tree().process_frame
	if not collider.is_node_ready():
		await collider.ready
	collider.shape = shape


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	Save.data.spawn = spawn
	get_tree().change_scene_to_file("res://levels/facility/%s.tscn" % scene)
