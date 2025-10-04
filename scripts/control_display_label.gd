class_name ControlDisplayLabel
extends Label

@export var action: String
## The text which the label displays, replacing %s with the appropriate control
## for the current input method
@export var base_text: String

func _ready() -> void:
	InputHelper.device_changed.connect(update_text)
	update_text()


func update_text() -> void:
	
	var input_name := InputHelper.get_label_for_input(
		InputHelper.get_keyboard_or_joypad_input_for_action(action)
	)
	prints("input", input_name, InputHelper.get_keyboard_or_joypad_input_for_action(action))
	
	text = base_text % input_name
