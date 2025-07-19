## Base class for entities (or actors).
class_name Entity
extends Sprite2D

var _anim_timer: Timer

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
	hframes = entity_definition.hor_frames
	vframes = entity_definition.ver_frames


func _ready() -> void:
	# Init and start animation frame timer.
	_anim_timer = Timer.new()
	add_child(_anim_timer)
	_anim_timer.autostart = true
	_anim_timer.wait_time = 0.5
	_anim_timer.timeout.connect(_on_anim_timer_timeout)
	_anim_timer.start()


#func _physics_process(delta: float) -> void:

func _on_anim_timer_timeout() -> void:
	# If the _anim_timer timeouts, animate entity texture by moving forward one frame.
	if frame <= hframes-2:
		frame += 1
	else:
		frame = 0


func move(move_offset: Vector2i) -> void:
	grid_position += move_offset
