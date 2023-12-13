extends Node2D

@onready var tilemap = $Overworld

const MAP_SIZE = Vector2(256,256)

func _ready():
	generate_world()
	
func generate_world():
	var noise = FastNoiseLite.new()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	noise.seed = randi()
	noise.set_frequency(0.01)
	noise.set_fractal_lacunarity(2)
	noise.set_fractal_gain(0.5)
	
	var land = []
	var trees = []
	var rocks = []
	var water = []
	
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			var a = noise.get_noise_2d(x,y)
			if a < -0.1:
				water.append(Vector2(x,y))
			elif a < 0.4:
				land.append(Vector2(x,y))
				if a < 0.2:
					var rand = randf()
					if rand < 0.618:
						trees.append(Vector2(x,y))
			else:
				rocks.append(Vector2(x,y))
				
	tilemap.set_cells_terrain_connect(0,land,0,0)
	tilemap.set_cells_terrain_connect(0,rocks,0,1)
	tilemap.set_cells_terrain_connect(0,water,0,2)
	tilemap.set_cells_terrain_connect(0,trees,0,3)
