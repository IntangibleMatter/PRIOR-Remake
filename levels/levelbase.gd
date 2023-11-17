extends Node2D

const PLAYERSCENE := preload("res://obj/player/player.tscn")

func _ready() -> void:
	spawn_at(0)


func spawn_at(index: int) -> void:
	var player := PLAYERSCENE.instantiate()
	if index < $Spawns.get_child_count():
		player.global_position = $Spawns.get_children()[index].global_position
		add_child(player)
