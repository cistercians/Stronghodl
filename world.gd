extends Node2D

@onready var overworld = $Overworld
@onready var underworld = $Underworld
@onready var canvas_layer = $CanvasLayer
@onready var canvas_modulate = $CanvasModulate

const MAP_SIZE = Vector2(512,512)
var borders = Rect2(1,1,MAP_SIZE.x-1,MAP_SIZE.y-1)

var land = []
var trees = []
var rocks = []
var water = []
var mountains = []
var caves = []
var bushes = []

var walls = []
var ground = []
var ore = []

func _ready():
	generate_overworld()
	generate_underworld()
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
	biome_noise.set_frequency(0.01)
	altitude_noise.set_frequency(0.01)
	biome_noise.set_fractal_lacunarity(2)
	altitude_noise.set_fractal_lacunarity(2)
	biome_noise.set_fractal_gain(0.5)
	altitude_noise.set_fractal_gain(0.5)
	
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			var b = biome_noise.get_noise_2d(x,y)
			var a = altitude_noise.get_noise_2d(x,y)
			if b < -0.1:
				water.append(Vector2(x,y))
			else:
				if a > 0.45:
					if randf() < 0.003:
						caves.append(Vector2(x,y))
					else:
						mountains.append(Vector2(x,y))
				elif a > 0.35:
					rocks.append(Vector2(x,y))
				else:
					land.append(Vector2(x,y))
					if b < 0.3:
						if randf() < 0.618:
							trees.append(Vector2(x,y))
					elif b < 0.45:
						if randf() < 0.618:
							bushes.append(Vector2(x,y))
							
	overworld.set_cells_terrain_connect(0,land,0,0)
	overworld.set_cells_terrain_connect(0,rocks,0,1)
	overworld.set_cells_terrain_connect(0,water,0,2)
	overworld.set_cells_terrain_connect(0,trees,0,3)
	overworld.set_cells_terrain_connect(0,mountains,0,4)
	overworld.set_cells_terrain_connect(0,caves,0,5)
	overworld.set_cells_terrain_connect(0,bushes,0,6)
	
	print("Generated overworld")
		
func generate_underworld():
	print("Generating underworld...")
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			if randf() > 0.618:
				ore.append(Vector2(x,y))
			else:
				walls.append(Vector2(x,y))
	for cave in caves:
		print(cave)
		var walker = Walker.new(cave, borders)
		var map = walker.walk(3300)
		walker.queue_free()
		for location in map:
			ground.append(location)
			
	underworld.set_cells_terrain_connect(0,walls,0,1)
	underworld.set_cells_terrain_connect(0,ore,0,2)
	underworld.set_cells_terrain_connect(0,ground,0,0)
	print("Generated underworld")
