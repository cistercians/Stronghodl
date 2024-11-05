extends Node2D

@onready var overworld = $Overworld
@onready var underworld = $Underworld
@onready var underwater = $Underwater
@onready var canvas_modulate = $CanvasModulate

const MAP_SIZE = Vector2(128,128)
var borders = Rect2(0,0,MAP_SIZE.x-1,MAP_SIZE.y-1)

var land = []
var trees = []
var rocks = []
var water = []
var mountains = []
var caves = []
var bushes = []
var grass = []
var dry = []

var walls = []
var ground = []
var ore = []
var under_water = []
var exits = []

func _ready():
	generate_overworld()
	generate_underworld()
	generate_underwater()
	generate_flora()
	generate_fauna()
	spawn_factions()
	print('test-yeet')
	randomize()
	BgmPlayer.play_soundtrack(BgmPlayer.THEMES.OVERWORLD_NIGHT)
	AmbPlayer.play_ambience(AmbPlayer.ENV.FOREST)
	
func generate_overworld():
	print("Generating overworld...")
	var biome_noise = FastNoiseLite.new()
	var altitude_noise = FastNoiseLite.new()
	biome_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	altitude_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	biome_noise.seed = randi()
	altitude_noise.seed = randi()
	biome_noise.set_frequency(0.007)
	altitude_noise.set_frequency(0.03)
	biome_noise.set_fractal_lacunarity(3)
	altitude_noise.set_fractal_lacunarity(3)
	biome_noise.set_fractal_gain(0.5)
	altitude_noise.set_fractal_gain(0.5)
	
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			var b = biome_noise.get_noise_2d(x,y)
			var a = altitude_noise.get_noise_2d(x,y)
			if b < -0.1:
				water.append(Vector2(x,y))
			else:
				land.append(Vector2(x,y))
				if a > 0.45:
					if randf() < 0.005:
						if caves.size() > 0:
							var lastCave = caves[caves.size()-1]
							if Vector2(x,y).distance_to(lastCave) > 10:
								caves.append(Vector2(x,y))
						else:
							caves.append(Vector2(x,y))
					else:
						mountains.append(Vector2(x,y))
				elif a > 0.3:
					rocks.append(Vector2(x,y))
				elif a > 0.1 && b < 0.3:
					dry.append(Vector2(x,y))
				else:
					if b < 0.3:
						if randf() < 0.618:
							trees.append(Vector2(x,y))
					elif b < 0.45:
						if randf() < 0.618:
							bushes.append(Vector2(x,y))
					else:
						grass.append(Vector2(x,y))
							
	if(len(water) > len(land)):
		print("Overworld map rejected: excess water")
		generate_overworld()
	elif(len(caves) == 0):
		print("Overworld map rejected: no caves")
		generate_overworld()
	overworld.set_cells_terrain_connect(0,land,0,0)
	overworld.set_cells_terrain_connect(0,rocks,0,1)
	overworld.set_cells_terrain_connect(0,water,0,2)
	overworld.set_cells_terrain_connect(0,trees,0,3)
	overworld.set_cells_terrain_connect(0,mountains,0,4)
	overworld.set_cells_terrain_connect(0,caves,0,5)
	overworld.set_cells_terrain_connect(0,bushes,0,6)
	overworld.set_cells_terrain_connect(0,dry,0,7)
	overworld.astar_setup()
		
func generate_underworld():
	print("Generating underworld")
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			if randf() > 0.618:
				ore.append(Vector2(x,y))
			else:
				walls.append(Vector2(x,y))
	for cave in caves:
		print("cave @ ", cave)
		exits.append(cave)
		var walker = Walker.new(cave, borders)
		var map = walker.walk(3300)
		walker.queue_free()
		for location in map:
			if water.has(location):
				if randf() < 0.236:
					under_water.append(location)
				else:
					ground.append(location)
			else:
				ground.append(location)
			
	underworld.set_cells_terrain_connect(0,walls,0,1)
	underworld.set_cells_terrain_connect(0,ore,0,2)
	underworld.set_cells_terrain_connect(0,ground,0,0)
	underworld.set_cells_terrain_connect(0,under_water,0,4)
	underworld.set_cells_terrain_connect(0,exits,0,3)
	underworld.astar_setup()
	
func generate_underwater():
	underwater.set_cells_terrain_connect(0,water,0,0)
	
func generate_flora():
	print("Generating flora")
	var stree_scene = preload("res://Scenery/stree.tscn")
	var mtree_scene = preload("res://Scenery/mtree.tscn")
	var ltree_scene = preload("res://Scenery/ltree.tscn")
	var dtree1_scene = preload("res://Scenery/dtree1.tscn")
	var dtree2_scene = preload("res://Scenery/dtree2.tscn")
	var dtree3_scene = preload("res://Scenery/dtree3.tscn")
	for t in trees:
		var r = randf()
		if r < 0.3:
			var tree = ltree_scene.instantiate()
			tree.position = t * 64
			add_child(tree)
		elif r < 0.7: 
			var tree = mtree_scene.instantiate()
			tree.position = t * 64
			add_child(tree)
		else:
			var tree = stree_scene.instantiate()
			tree.position = t * 64
			add_child(tree)
	for t in dry:
		if randf() < 0.236:
			var r = randf()
			if r < 0.3:
				var tree = dtree1_scene.instantiate()
				tree.position = t * 64
				add_child(tree)
			elif r < 0.7:
				var tree = dtree3_scene.instantiate()
				tree.position = t * 64
				add_child(tree)
			else:
				var tree = dtree2_scene.instantiate()
				tree.position = t * 64
				add_child(tree)
			
func generate_fauna():
	print("Generating fauna")
	var deer_scene = preload("res://Characters/Deer/Deer.tscn")
	var wolf_scene = preload("res://Characters/Wolf/Wolf.tscn")
	var boar_scene = preload("res://Characters/Boar/Boar.tscn")
	var deerRatio = land.size()/600
	var deerCount = 0
	for n in deerRatio:
		var deer = deer_scene.instantiate()
		var pos = land[randi() % land.size()] * 64
		deer.position = pos
		deer.home = pos
		add_child(deer)
		deerCount += 1
	var wolfRatio = land.size()/1600
	var wolfCount = 0
	for n in wolfRatio:
		var wolf = wolf_scene.instantiate()
		var pos = land[randi() % land.size()] * 64
		wolf.position = pos
		wolf.home = pos
		add_child(wolf)
		wolfCount += 1
	var boarRatio = land.size()/3200
	var boarCount = 0
	for n in boarRatio:
		var boar = boar_scene.instantiate()
		var pos = land[randi() % land.size()] * 64
		boar.position = pos
		boar.home = pos
		add_child(boar)
		boarCount += 1
	print('deer: ', deerCount)
	print('wolves: ', wolfCount)
	print('boarCount: ', boarCount)

func spawn_factions():
	print("Spawning factions")
	var frank_scene = preload("res://Factions/Franks/Franks.tscn")
	var franks = frank_scene.instantiate()
	add_child(franks)
