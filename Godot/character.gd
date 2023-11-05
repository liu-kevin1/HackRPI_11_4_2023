extends Sprite2D
var i = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(i<global.results.size()-1):
		position = global.results[i]
		rotation = atan((global.results[i][1]-global.results[i+1][1])/(global.results[i][0]-global.results[i+1][0]))
		i += 1;
