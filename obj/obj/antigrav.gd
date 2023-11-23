extends Area2D

func _ready() -> void:
	if Save.data.antigrav:
		hide()
		monitoring = false



func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	Save.data.antigrav = true
	
	body.has_antigrav = Save.data.antigrav
	hide()
	set_deferred("monitoring", false)
