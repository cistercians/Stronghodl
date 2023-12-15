extends CanvasModulate
@export var gradient:GradientTexture1D
@export var INGAME_SPEED = 5.0
@export var INITIAL_HOUR = 0
var time:float = 0.0
var past_hour = -1
var past_minute:float = -1.0
const MINUTES_PER_DAY = 1440
const MINUTES_PER_HOUR = 60
const INGAME_TO_REAL_MINUTE_DURATION = (2 * PI) / MINUTES_PER_DAY
signal time_tick(day:int, hour:int, minute:int)

func _ready():
	time = INGAME_TO_REAL_MINUTE_DURATION * INITIAL_HOUR * MINUTES_PER_HOUR

func _process(delta:float):
	time += delta * INGAME_TO_REAL_MINUTE_DURATION * INGAME_SPEED
	var value = (sin(time - PI / 2.0) + 1.0) / 2.0
	self.color = gradient.gradient.sample(value)
	
	_recalculate_time()

func _recalculate_time():
	var total_minutes = int(time / INGAME_TO_REAL_MINUTE_DURATION)
	var day = int(total_minutes / MINUTES_PER_DAY)
	var current_day_minutes = total_minutes % MINUTES_PER_DAY
	var hour = int(current_day_minutes / MINUTES_PER_HOUR)
	var minute = int(current_day_minutes % MINUTES_PER_HOUR)
	if past_minute != minute:
		past_minute = minute
		time_tick.emit(day,hour,minute)
		if past_hour != hour:
			past_hour = hour
			print("time: ", hour, ":", minute)
			if hour == 5:
				randomize()
				BgmPlayer.play_soundtrack(BgmPlayer.THEMES.OVERWORLD_MORNING)
				AmbPlayer.play_ambience(AmbPlayer.ENV.NATURE)
			elif hour == 11:
				randomize()
				BgmPlayer.play_soundtrack(BgmPlayer.THEMES.OVERWORLD_DAY)
			elif hour == 19:
				randomize()
				BgmPlayer.play_soundtrack(BgmPlayer.THEMES.OVERWORLD_NIGHT)
				AmbPlayer.play_ambience(AmbPlayer.ENV.FOREST)
