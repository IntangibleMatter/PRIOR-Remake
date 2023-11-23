extends Node

signal data_changed(item: String, value: Variant)

var data : Dictionary = {
	"room": "isolation",
	"spawn": 0,
	"electricity": false,
	"double": true,
	"antigrav": false,
	"world_door": false,
	"pitfall_door": false,
	"research_door": false,
}


func set_data(item: String, value: Variant) -> void:
	data[item] = value
	emit_signal("data_changed", item, value)
