extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func die(dir: String) -> void:
	print(dir)
	prints("deathpos", global_position)

	if dir == "left":
		animation_player.play("death_left")
	else:
		animation_player.play("death_right")
