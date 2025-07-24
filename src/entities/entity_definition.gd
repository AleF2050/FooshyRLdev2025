## Definition resource file for entities.
class_name EntityDefinition
extends Resource

@export_category("Visuals")  							## Visual related properties for the definition.
@export var name: String = "?"							## Name of the entity.
@export var texture: Texture2D  						## The sprite to use from an existing image sheet file.
@export_color_no_alpha var color: Color = Color.WHITE  	## Color modulate to use.
@export_range(1, 999) var hor_frames: int = 1			## Amount of horizontal frames the sprite can use. Default value is 1.
@export_range(1, 999) var ver_frames: int = 1			## Amount of vertical frames the sprite can use. Default value is 1.

@export_category("Mechanics")
@export var is_blocking_movement: bool = true			## If true, this entity can impede any oncoming movements of other entities.

@export_category("Components")
@export var fighter_definition: FighterComponentDefinition
@export var ai_type: Entity.AIType
