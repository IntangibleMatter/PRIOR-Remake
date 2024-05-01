@tool
extends Area2D

@export var shape : Shape2D:
	set(value):
		shape = value
		if Engine.is_editor_hint():
			if not is_node_ready():
				await ready
			collider.shape = shape

@export var scene : String = "isolation"
@export var spawn : int = 0
enum LEVEL_SECTIONS {FACILITY, ONE, FEW, MANY}
@export var level_section : LEVEL_SECTIONS = LEVEL_SECTIONS.FACILITY

@onready var collider: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	await get_tree().process_frame
	if not is_node_ready():
		await ready
	collider.shape = shape


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return

	var folder : String
	match level_section:
		LEVEL_SECTIONS.FACILITY:
			folder = "facility"
		LEVEL_SECTIONS.ONE:
			folder = "endings/one"
		LEVEL_SECTIONS.FEW:
			folder = "endings/few"
		LEVEL_SECTIONS.MANY:
			folder = "endings/many"

	Save.data.spawn = spawn
	Save.set_data("room", "res://levels/{0}/{1}.tscn".format([folder, scene]))
	(
		func() -> void:
			get_tree().change_scene_to_file("res://levels/{0}/{1}.tscn".format([folder, scene]))
	).call_deferred()
