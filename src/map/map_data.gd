## A class which map relative data is stored, including Tile types, the width and height of the map and its array of Tiles.
class_name MapData
extends RefCounted

const tile_types = {
	"floor": preload("res://assets/definitions/tiles/tile_definition_floor.tres"),
	"wall": preload("res://assets/definitions/tiles/tile_definition_wall.tres"),
}

var width: int
var height: int
var tiles: Array[Tile]


func _init(map_width: int, map_height: int) -> void:
	width = map_width
	height = map_height
	_setup_tiles()


func _setup_tiles() -> void:
	tiles = []
	for y in height:
		for x in width:
			var tile_position := Vector2i(x, y)
			var tile := Tile.new(tile_position, tile_types.wall)
			tiles.append(tile)


## Returns a bool stating if the specified tile from a coordinate fit inside the map's width and height.
func is_in_bounds(coordinate: Vector2i) -> bool:
	return (
		0 <= coordinate.x
		and coordinate.x < width
		and 0 <= coordinate.y
		and coordinate.y < height
	)


## Returns a tile instance according to a specified position from the grid.
func get_tile(grid_position: Vector2i) -> Tile:
	var tile_index: int = grid_to_index(grid_position)
	if tile_index == -1:
		return null
	return tiles[tile_index]


## Returns an int stating a specified index taken from a grid position. Returns -1 if the specified index is out of bounds.
func grid_to_index(grid_position: Vector2i) -> int:
	if not is_in_bounds(grid_position):
		return -1
	return grid_position.y * width + grid_position.x
