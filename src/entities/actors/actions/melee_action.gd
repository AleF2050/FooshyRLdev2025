class_name MeleeAction
extends ActionWithDirection


## After specifying a destination offset, the entity attempts a melee attack if there's a target present in the offset, otherwise it returns nothing.
func perform(game: Game, entity: Entity) -> void:
	var destination := Vector2i(entity.grid_position + offset)
	var target: Entity = game.get_map_data().get_blocking_entity_at_location(destination)
	if not target:
		return
	print("You kick the %s, much to it's annoyance!" % target.get_entity_name())
