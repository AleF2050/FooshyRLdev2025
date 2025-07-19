## Main game.
class_name Game
extends Node2D

const player_definition: EntityDefinition = preload("res://assets/definitions/entities/actors/entity_definition_player.tres")  ## Starting player entity definition to use.

@onready var player: Entity  ## The Entity to use as the player.
@onready var event_handler: EventHandler = $EventHandler  ## Event handler to use.
@onready var entities: Node2D = $Entities  ## A Node2D in which every Entity will be placed in the map.
@onready var map = $Map  ## The Map node is the container for the stored MapData to use.


func _ready() -> void:
	player = Entity.new(Vector2i.ZERO, player_definition)
	var camera: Camera2D = $Camera2D
	remove_child(camera)
	player.add_child(camera)
	
	entities.add_child(player)
	map.generate(player)


func _physics_process(_delta: float) -> void:
	# This is where actions are being executed by player input.
	var action: Action = event_handler.get_action()
	if action:
		action.perform(self, player)


func get_map_data() -> MapData:
	return map.map_data
