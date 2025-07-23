class_name ActionWithDirection
extends Action

var offset: Vector2i


## Inits the Action from specified destination coordinates and sets its offset.
func _init(dx: int, dy: int) -> void:
	offset = Vector2i(dx, dy)


## Any code relating to the action's perform function goes here.
func perform(game: Game, entity: Entity) -> void:
	pass
