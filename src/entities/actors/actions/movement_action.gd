class_name MovementAction
extends Action

var offset: Vector2i


## Inits the Movement Action from specified destination coordinates and sets its offset.
func _init(dx: int, dy: int) -> void:
	offset = Vector2i(dx, dy)
