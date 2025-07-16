## Definition resource file for entities.
class_name EntityDefinition
extends Resource

@export_category("Visuals")  							## Visual related properties for the definition.
@export var texture: AtlasTexture  						## The (cropped) sprite to use from an existing image sheet file.
@export_color_no_alpha var color: Color = Color.WHITE  	## Color modulate to use
