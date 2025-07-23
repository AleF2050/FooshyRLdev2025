class_name BumpAction
extends ActionWithDirection


## The entity transfers its position to a specified offset determined by the init's offset and attempts to deal a melee attack on another entity if there's one.
func perform() -> void:
	var destination := Vector2i(entity.grid_position + offset)
	
	if get_map_data().get_blocking_entity_at_location(destination):
		MeleeAction.new(entity, offset.x, offset.y).perform()
	else:
		MovementAction.new(entity, offset.x, offset.y).perform()
