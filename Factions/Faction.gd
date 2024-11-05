class_name Faction extends Node

@onready var world = get_node("../../World")
@onready var overworld = get_node("../Overworld")
@onready var underworld = get_node("../Underworld")

var building_list = {}

var faction_name: String
var home: Vector2

func get_surrounding_tiles(TILE,X):
	var surrounding_tiles = []
	for a in range(-X,X):
		for b in range(-X,X):
			var current_tile = Vector2(TILE.x+a,TILE.y+b)
			if not surrounding_tiles.has(current_tile) and not current_tile == TILE and (current_tile.x > 0 and current_tile.y > 0):
				surrounding_tiles.append(current_tile)
	surrounding_tiles.append(TILE)
	return surrounding_tiles
				
func random_house():
	var num = ['1','2','3']
	return 'house' + num.pick_random()

func build(building,area):
	var b = building_list[building]
	var tile = area.pick_random()
	var tiles = get_surrounding_tiles(tile,b[1])
	var valid = 0
	for i in tiles:
		var data = overworld.get_cell_tile_data(0,i)
		if data.terrain == 0 || data.terrain == 6:
			valid += 1
	if valid/tiles.size() >= 0.75:
		var build = b[0].instantiate()
		build.position = tile * 64
		add_child(build)
	else:
		build(building,area)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
