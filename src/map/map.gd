## Main class relating to map control.
class_name Map
extends Node2D

@export var fov_radius: int = 8

@onready var tiles: Node2D = $Tiles
@onready var entities: Node2D = $Entities
@onready var dungeon_generator: DungeonGenerator = $"../DungeonGenerator"
@onready var field_of_view: FieldOfView = $"../FieldOfView"

var map_data: MapData


## Generates a new map using the DungeonGenerator class.
func generate(player: Entity) -> void:
	map_data = dungeon_generator.generate_dungeon(player)
	_place_tiles()
	_place_entities()


func update_fov(player_position: Vector2i) -> void:
	field_of_view.update_fov(map_data, player_position, 8)
	
	for entity in map_data.entities:
		entity.visible = map_data.get_tile(entity.grid_position).is_in_view


func _place_tiles() -> void:
	for tile in map_data.tiles:
		tiles.add_child(tile)


func _place_entities() -> void:
	for entity in map_data.entities:
		entities.add_child(entity)
