## Base class for entities (or actors).
class_name Entity
extends Sprite2D

enum AIType {NONE, HOSTILE}

var _definition: EntityDefinition
var fighter_component: FighterComponent
var ai_component: BaseAIComponent
var map_data: MapData
var _anim_timer: Timer

var grid_position: Vector2i: ## Current position of the entity located in grid coordinates.
	set(value):
		# Whetever the entity's grid_position is set/changed, this entity moves through specified coordinates converted into world coordinates.
		grid_position = value
		position = Grid.grid_to_world(grid_position)


func _init(map_data: MapData, start_position: Vector2i, entity_definition: EntityDefinition) -> void:
	centered = false
	grid_position = start_position
	self.map_data = map_data
	set_entity_type(entity_definition)


func _ready() -> void:
	# Init and start animation frame timer.
	_anim_timer = Timer.new()
	add_child(_anim_timer)
	_anim_timer.autostart = true
	_anim_timer.wait_time = 0.5
	_anim_timer.timeout.connect(_on_anim_timer_timeout)
	_anim_timer.start()


func set_entity_type(entity_definition: EntityDefinition) -> void:
	_definition = entity_definition
	texture = entity_definition.texture
	modulate = entity_definition.color
	hframes = entity_definition.hor_frames
	vframes = entity_definition.ver_frames
	
	match entity_definition.ai_type:
		AIType.HOSTILE:
			ai_component = HostileEnemyAIComponent.new()
			add_child(ai_component)
	
	if entity_definition.fighter_definition:
		fighter_component = FighterComponent.new(entity_definition.fighter_definition)
		add_child(fighter_component)


func _on_anim_timer_timeout() -> void:
	# If the _anim_timer timeouts, animate entity texture by moving forward one frame.
	if frame <= hframes-2:
		frame += 1
	else:
		frame = 0


## Move the entity to a new grid offset position.
func move(move_offset: Vector2i) -> void:
	map_data.unregister_blocking_entity(self)
	grid_position += move_offset
	map_data.register_blocking_entity(self)


## Returns the entity's ability to block other entity's movements.
func is_blocking_movement() -> bool:
	return _definition.is_blocking_movement


## Returns the entity's name.
func get_entity_name() -> String:
	return _definition.name


func is_alive() -> bool:
	return ai_component != null
