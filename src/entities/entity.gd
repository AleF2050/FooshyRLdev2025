## Base class for entities (or actors).
class_name Entity
extends Sprite2D

var grid_position: Vector2i: ## Current position of the entity located in grid coordinates.
	set(value):
		# Whetever the entity's grid_position is set/changed, this entity moves through specified coordinates converted into world coordinates.
		grid_position = value
		position = Grid.grid_to_world(grid_position)


func _init(start_position: Vector2i, entity_definition: EntityDefinition) -> void:
	centered = false
	grid_position = start_position
	texture = entity_definition.texture
	modulate = entity_definition.color


func move(move_offset: Vector2i) -> void:
	grid_position += move_offset
