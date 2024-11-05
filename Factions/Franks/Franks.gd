extends Faction

func set_origin():
	var center = world.grass.pick_random()
	var area = get_surrounding_tiles(center,4)
	var valid = 0
	for tile in area:
		var data = overworld.get_cell_tile_data(0,tile)
		if data.terrain == 0 || data.terrain == 6:
			valid += 1
	if valid/area.size() >= 0.75:
		build('guard_tower',area)
		build(random_house(),area)
		build(random_house(),area)
	else:
		set_origin()

func _ready():
	var frank_house1 = preload("res://Factions/Franks/Buildings/House/frank_house1.tscn")
	var frank_house2 = preload("res://Factions/Franks/Buildings/House/frank_house2.tscn")
	var frank_house3 = preload("res://Factions/Franks/Buildings/House/frank_house3.tscn")
	var guard_tower = preload("res://Factions/Franks/Buildings/Guard_Tower/frank_guard_tower.tscn")
	building_list['house1'] = [frank_house1,1]
	building_list['house2'] = [frank_house2,1]
	building_list['house3'] = [frank_house3,1]
	building_list['guard_tower'] = [guard_tower,1]
	set_origin()
	print("Franks have spawned")
