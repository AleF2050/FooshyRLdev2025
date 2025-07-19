class_name EscapeAction
extends Action


## When EscapeAction performs, the specified Game instance will close the game.
func perform(game: Game, entity: Entity) -> void:
	game.get_tree().quit()
