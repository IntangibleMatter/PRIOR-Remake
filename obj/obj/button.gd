extends Area2D

@export var save_value : String

@onready var sprite: Sprite2D = $Sprite2D

const flash_scene := preload("res://obj/components/flash.tscn")

var pressed : bool = false

signal button_pressed

func _ready() -> void:
	if Save.data.has(save_value):
		if Save.data[save_value]:
			sprite.frame = 1
			pressed = true
		else:
			sprite.frame = 0
			pressed = false
	
	if pressed:
		monitoring = false
	
	print(pressed)


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if not body.is_in_group("player") or Save.data.get(save_value, true):
		return
	if body.fastfall:
		print("pressing!")
		pressed = true
		emit_signal("button_pressed")
		Save.set_data(save_value, true)
		sprite.frame = 1
		get_tree().current_scene.add_child(flash_scene.instantiate())
