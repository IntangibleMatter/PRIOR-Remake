extends Node2D

func _ready() -> void:
	if not Save.data.electricity:
		self.queue_free()
