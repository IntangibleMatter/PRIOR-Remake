extends Node

@export var save_value : String
@export var property: StringName
@export var value : bool #String
#@export var typeofvalue : Variant.Type

func _ready() -> void:
	set_value()


func set_value() -> void:
	if not property in self:
		return
	if Save.data.has(save_value):
		if Save.data[save_value]:
			set(property, value)
#			set(property, convert_to_type(value, typeofvalue))

#
#func convert_to_type(val: String, type: Variant.Type) -> Variant:
#	match type:
#		TYPE_BOOL:
#			return val.to_lower().strip_edges() == "true"
#		TYPE_FLOAT:
#			return float(val)
#		TYPE_INT:
#			return int(val)
#		TYPE_STRING:
#			return val
#	return val
