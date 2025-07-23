class_name MovementAction
extends ActionWithDirection


## Whenever MovementAction performs, the entity will move to another position in the map according to the specified offset from this action.
func perform(game: Game, entity: Entity) -> void:
	var destination: Vector2i = entity.grid_position + offset
	
	var map_data: MapData = game.get_map_data()
	var destination_tile: Tile = map_data.get_tile(destination)
	
	# If the offset is higher or lower than 0, the entity's sprite flips horizontally depending on the offset's direction.
	if offset.x >= 1:
		entity.flip_h = false
	elif offset.x <= -1:
		entity.flip_h = true
	
	if not destination_tile or not destination_tile.is_walkable():
		return
	if game.get_map_data().get_blocking_entity_at_location(destination):
		return
	entity.move(offset)
