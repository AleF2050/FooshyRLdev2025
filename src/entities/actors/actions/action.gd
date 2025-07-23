## Base class for actions.
class_name Action
extends RefCounted

var entity: Entity


func _init(entity: Entity) -> void:
	self.entity = entity


## The perform function triggers whenever something such as a input event of an user or AI or when a condition is satisfied.
func perform() -> void:
	pass


func get_map_data() -> MapData:
	return entity.map_data
