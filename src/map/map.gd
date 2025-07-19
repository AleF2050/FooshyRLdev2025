## Main class relating to map control.
class_name Map
extends Node2D

@onready var dungeon_generator: DungeonGenerator = $"../DungeonGenerator"

var map_data: MapData


## Generates a new map using the DungeonGenerator class.
func generate(player: Entity) -> void:
	map_data = dungeon_generator.generate_dungeon(player)
	_place_tiles()


func _place_tiles() -> void:
	for tile in map_data.tiles:
		add_child(tile)
