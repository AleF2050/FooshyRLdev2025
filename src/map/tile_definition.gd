## Definition resource for tiles.
class_name TileDefinition
extends Resource

@export_category("Visuals")
@export var texture: AtlasTexture  ## Texture sprite to use for the tile.
@export_color_no_alpha var color_lit: Color = Color.WHITE  ## Color to use when it's embed into light.
@export_color_no_alpha var color_dark: Color = Color.WHITE  ## Color to use when light is not present.

@export_category("Mechanics")
@export var is_walkable: bool = true  ## Can actors walk into this tile?
@export var is_transparent: bool = true  ## Can light go through this tile?
