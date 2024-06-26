extends Node2D

const PLAYERSCENE := preload("res://obj/player/player.tscn")
@onready var spawns: Node2D = $Spawns


func _ready() -> void:
	spawn_at(Save.data.spawn)


func spawn_at(index: int) -> void:
	var player := PLAYERSCENE.instantiate()
	if index < spawns.get_child_count():
		player.global_position = spawns.get_children()[index].global_position
		add_child(player)
		player.update_eye("right" if spawns.get_children()[index].facing == 0 else "left", true)
	else:
		player.global_position = spawns.get_children()[0].global_position
		add_child(player)
		player.update_eye("right" if spawns.get_children()[0].facing == 0 else "left", true)
