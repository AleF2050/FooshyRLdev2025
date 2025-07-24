## Main game.
class_name Game
extends Node2D

const player_definition: EntityDefinition = preload("res://assets/definitions/entities/actors/entity_definition_player.tres")  ## Starting player entity definition to use.

@onready var player: Entity  ## The Entity to use as the player.
@onready var input_handler: InputHandler = $InputHandler  ## Event handler to use.
@onready var map = $Map  ## The Map node is the container for the stored MapData to use.
@onready var camera: Camera2D = $Camera2D


func _ready() -> void:
	player = Entity.new(null, Vector2i.ZERO, player_definition)
	remove_child(camera)
	player.add_child(camera)
	map.generate(player)
	map.update_fov(player.grid_position)


func _physics_process(_delta: float) -> void:
	# This is where actions are being executed by player input.
	var action: Action = input_handler.get_action(player)
	if action:
		var previous_player_position: Vector2i = player.grid_position
		action.perform()
		_handle_enemy_turns()
		map.update_fov(player.grid_position)


func get_map_data() -> MapData:
	return map.map_data


func _handle_enemy_turns() -> void:
	for entity in get_map_data().get_actors():
		if entity.is_alive() and entity != player:
			entity.ai_component.perform()
