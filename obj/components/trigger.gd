extends Area2D

@export var save_value : String

var triggered : bool = false

signal trigger_entered

func _ready() -> void:
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
	Save.set_data(save_value, true)

