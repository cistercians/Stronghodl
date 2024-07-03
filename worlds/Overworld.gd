extends TileMap

var astar_land = AStarGrid2D.new()
var astar_land_player = AStarGrid2D.new()
var astar_sea = AStarGrid2D.new()
var map_rect = Rect2i()

func astar_setup():
	print("Setting up overworld pathfinding")
	var map_size = get_used_rect().end - get_used_rect().position
	map_rect = Rect2i(Vector2i.ZERO, map_size)
	var tile_size = get_tileset().tile_size
	
	astar_land.region = map_rect
	astar_land.cell_size = tile_size
	astar_land.update()
	astar_land_player.region = map_rect
	astar_land_player.cell_size = tile_size
	astar_land_player.update()
	astar_sea.region = map_rect
	astar_sea.cell_size = tile_size
	astar_sea.update()
				
func is_walkable(position):
	var map_position = local_to_map(position)
	if map_rect.has_point(map_position) and not astar_land.is_point_solid(map_position):
		return true
	return false
	
func is_navigable(position):
	var map_position = local_to_map(position)
	if map_rect.has_point(map_position) and not astar_sea.is_point_solid(map_position):
		return true
	return false
	
func _process(delta):
	pass
