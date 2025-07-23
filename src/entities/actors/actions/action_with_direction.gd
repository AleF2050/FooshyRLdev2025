class_name ActionWithDirection
extends Action

var offset: Vector2i


## Inits the Action from specified destination coordinates and sets its offset.
func _init(entity: Entity, dx: int, dy: int) -> void:
	super._init(entity)
	offset = Vector2i(dx, dy)


func get_destination() -> Vector2i:
	return entity.grid_position + offset


func get_blocking_entity_at_destination() -> Entity:
	return get_map_data().get_blocking_entity_at_location(get_destination())

## Any code relating to the action's perform function goes here.
#func perform(game: Game, entity: Entity) -> void:
#	pass
