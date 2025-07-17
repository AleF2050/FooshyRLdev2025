## Class utilized for grid related functions.
class_name Grid
extends Object

const TILE_SIZE := Vector2i(16, 16)


# Fairly simple here. The grid is represented as a simple numerical chart consisting of squares.
# These functions are called throughout the reference of this class without instancing it from a variable
# just like how math features in this engine works, by turning global pixel coordinates into grid coordinates.

## Returns specified grid coordinates, a Vector2i, into actual 'real world' coordinates.
static func grid_to_world(grid_pos: Vector2i) -> Vector2i:
	var world_pos: Vector2i = grid_pos * TILE_SIZE
	return world_pos


## Returns specified 'real world' coordinates into grid coordinates dividing by the established TILE_SIZE.
static func world_to_grid(world_pos: Vector2i) -> Vector2i:
	var grid_pos: Vector2i = world_pos / TILE_SIZE
	return grid_pos
