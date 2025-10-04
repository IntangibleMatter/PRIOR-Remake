extends Node

const save_path := "user://prior.sav"

signal data_changed(item: String, value: Variant)

const base_data : Dictionary = {
	"room": "res://levels/facility/isolation.tscn",
	"spawn": 0,
	"read_note": false,
	"electricity": false,
	"double": false,
	"antigrav": false,
	"world_door": false,
	"pitfall_door": false,
	"research_door": false,
	"atrium_door": false,
	"twoonethree_door": false,
	"maintenance_door": false,
	"cycle_door": false,
	"isolation_door": false,
	"isolation_hide": false,
	"containment_door": false,
	"low_door": false,
	"the_one": false, 
	"the_few": false,
	"the_many": false,
}

var data := base_data.duplicate(true)


func _ready() -> void:
	load_game()
	(func() -> void: get_tree().change_scene_to_file(data.room)).call_deferred()
	get_tree().change_scene_to_file.call_deferred(data.room)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed():
			if event.keycode == KEY_BACKSPACE:
				data = base_data.duplicate(true)
				get_tree().change_scene_to_file.call_deferred(data.room)




func set_data(item: String, value: Variant) -> void:
	data[item] = value
	emit_signal("data_changed", item, value)
	save()


func save() -> void:
	prints("started saving at:", Time.get_ticks_usec())
	var cfg := ConfigFile.new()

	for value in data:
		cfg.set_value("Prior", value, data[value])

	cfg.save(save_path)
	prints("finished saving at:", Time.get_ticks_usec())


func load_game() -> void:
	if not FileAccess.file_exists(save_path):
		save()
		return

	var cfg := ConfigFile.new()
	var err := cfg.load(save_path)

	if err != OK:
		save()
		return

	for value in cfg.get_section_keys("Prior"):
		data[value] = cfg.get_value("Prior", value)
