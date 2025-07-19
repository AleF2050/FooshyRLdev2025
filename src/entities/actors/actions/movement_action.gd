class_name MovementAction
extends Action

var offset: Vector2i


## Inits the Movement Action from specified destination coordinates and sets its offset.
func _init(dx: int, dy: int) -> void:
	offset = Vector2i(dx, dy)


## Whenever MovementAction performs, the entity will move to another position in the map according to the specified offset from this action.
func perform(game: Game, entity: Entity) -> void:
	var destination: Vector2i = entity.grid_position + offset
	
	var map_data: MapData = game.get_map_data()
	var destination_tile: Tile = map_data.get_tile(destination)
	if not destination_tile or not destination_tile.is_walkable():
		return
	entity.move(offset)
