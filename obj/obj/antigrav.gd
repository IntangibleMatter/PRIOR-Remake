extends Area2D

@onready var flash : ColorRect = $CanvasLayer/ColorRect
const flash_scene := preload("res://obj/components/flash.tscn")

func _ready() -> void:
	if Save.data.antigrav:
		hide()
		monitoring = false



func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	Save.set_data("antigrav", true)
	hide()
	set_deferred("monitoring", false)
	get_tree().current_scene.add_child(flash_scene.instantiate())
	#var tween := get_tree().create_tween()
	#tween.tween_property(flash, "color:a", 0.6, 0.05)
	#tween.tween_property(flash, "color:a", 0, 0.6)
