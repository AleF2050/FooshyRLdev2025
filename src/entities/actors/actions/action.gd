## Base class for actions.
class_name Action
extends RefCounted


## The perform function triggers whenever something such as a input event of an user or AI or when a condition is satisfied.
func perform(game: Game, entity: Entity) -> void:
	pass
