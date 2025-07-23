class_name EscapeAction
extends Action


## When EscapeAction performs, the specified Game instance will close the game.
func perform() -> void:
	entity.get_tree().quit()
