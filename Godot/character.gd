extends AnimatedSprite2D

var i = 0
var t = 0
var g = 2
var i_v = -14



# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector2(-4, 4)
	play("run")
	position.y = -100
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!global.run):
		return
		
	if(i<global.results.size()-1):
		position = global.results[i]
		position.y -= 30
		rotation = atan((global.results[i][1]-global.results[i+1][1])/(global.results[i][0]-global.results[i+1][0]))
		i += 1;
	elif(global.win):
		print("you win")
		#var win_text = Label.new()
		#win_text.text = "You Win!"
		#add_child(win_text)
	elif(!global.win):
		print("you loose")
		if(position.y <= 550):
			position.x += 2
			position.y += i_v
			i_v += g
			rotation_degrees += 9
		elif(position.y > 550 and t < 120):
			rotation_degrees = 0
			scale = Vector2(4, 4)
			play("explosion")
			t += 1
		else:
			position.y += 1000
			play("run")

