@tool
extends Area2D

@export var shape : Shape2D:
	set(value):
		shape = value
		if Engine.is_editor_hint():
			collider.shape = shape

@export var scene : String = "isolation"
@export var spawn : int = 0
enum LEVEL_SECTIONS {FACILITY, BELONG, NUKE, SORRY}
@export var level_section : LEVEL_SECTIONS = LEVEL_SECTIONS.FACILITY

@onready var collider: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	await get_tree().process_frame
	if not collider.is_node_ready():
		await collider.ready
	collider.shape = shape


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	var folder : String
	match level_section:
		LEVEL_SECTIONS.FACILITY:
			folder = "facility"
		LEVEL_SECTIONS.BELONG:
			folder = "endings/belong"
		LEVEL_SECTIONS.NUKE:
			folder = "endings/nuke"
		LEVEL_SECTIONS.SORRY:
			folder = "endings/sorry"
	
	Save.data.spawn = spawn
	Save.data.room = scene
	Save.data.room_section = folder
	get_tree().change_scene_to_file("res://levels/{0}/{1}.tscn".format([folder, scene]))
