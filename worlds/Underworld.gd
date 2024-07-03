extends TileMap

var astar = AStarGrid2D.new()
var map_rect = Rect2i()

# Called when the node enters the scene tree for the first time.
func astar_setup():
	print("Setting up underworld pathfinding")
	var map_size = get_used_rect().end - get_used_rect().position
	map_rect = Rect2i(Vector2i.ZERO, map_size)
	var tile_size = get_tileset().tile_size
	
	astar.region = map_rect
	astar.cell_size = tile_size
	astar.update()
				
func is_walkable(position):
	var map_position = local_to_map(position)
	if map_rect.has_point(map_position) and not astar.is_point_solid(map_position):
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
