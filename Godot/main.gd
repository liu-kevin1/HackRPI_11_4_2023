extends Node

#var drawer
var ran = false;

# Called when the node enters the scene tree for the first time.
func calculate():
	#print("test")
	var equation = global.equation
	var start = 0
	var stop = 500
	var step = 1
	var results = Parser.process_equation(equation, start, stop, step)
	#print_tree()
	
	#var drawer = $draw_sprite2
	#print(drawer)
	#drawer.reparent(Node2D)
	#drawer.reparent(self)
	for i in range(len(results)):
		results[i][0] = results[i][0] #+ 100
		results[i][1] = results[i][1] - 300
	
	global.results = results;
	print(global.results[0])
	
	for i in range(len(results)-1):
		createOBJECT(results[i], results[i+1], 1)
	pass # Replace with function body.


func createOBJECT(pos1, pos2, scale):
	var TEXTURE = load("res://icon.svg")
	var WIDTH = TEXTURE.get_width();
	var path = Sprite2D.new()

	path.texture = TEXTURE
	
	var delta_x = (pos2[0]-pos1[0]) * scale
	var delta_y = (pos2[1]-pos1[1]) * scale
	
	path.position.x = (pos1[0]+(delta_x)/2) * scale
	path.position.y = (pos1[1]+(delta_y)/2) * scale
	
	path.scale = Vector2(sqrt((delta_x*delta_x)*scale + (delta_y*delta_y))/WIDTH*scale, 0.1)
	path.rotation = atan((delta_y)/(delta_x));
	#print("positions: ", pos1, pos2)
	#print("path pos: " + str(path.position))
	#print("scale: " + str(path.scale))
	#print("rotation: " + str(path.rotation))
	
	#stores the new child under current location
	add_child(path);
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(global.run and !ran):
		calculate()
		ran = true
