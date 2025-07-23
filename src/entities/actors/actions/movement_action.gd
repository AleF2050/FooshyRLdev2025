class_name MovementAction
extends ActionWithDirection


## Whenever MovementAction performs, the entity will move to another position in the map according to the specified offset from this action.
func perform() -> void:
	var map_data: MapData = get_map_data()
	var destination_tile: Tile = map_data.get_tile(get_destination())
	
	# If the offset is higher or lower than 0, the entity's sprite flips horizontally depending on the offset's direction.
	if offset.x >= 1:
		entity.flip_h = false
	elif offset.x <= -1:
		entity.flip_h = true
	
	if not destination_tile or not destination_tile.is_walkable():
		return
	if get_blocking_entity_at_destination():
		return
	entity.move(offset)
