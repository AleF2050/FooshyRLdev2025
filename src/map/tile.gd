## Base class for tiles.
class_name Tile
extends Sprite2D

var _definition: TileDefinition


func _init(grid_position: Vector2i, tile_definition: TileDefinition) -> void:
	centered = false
	position = Grid.grid_to_world(grid_position)
	set_tile_type(tile_definition)


## Sets a tile definition.
func set_tile_type(tile_definition: TileDefinition) -> void:
	_definition = tile_definition
	texture = _definition.texture
	modulate = _definition.color_dark


## If true, Entities can be able to move through this tile.
func is_walkable() -> bool:
	return _definition.is_walkable


## If true, the field of view can see through this tile.
func is_transparent() -> bool:
	return _definition.is_transparent
