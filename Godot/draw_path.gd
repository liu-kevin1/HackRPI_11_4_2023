extends Node
#pre-loads the texture file under rescources
var TEXTURE = load("res://icon.svg")
var WIDTH = TEXTURE.get_width();

var c_pos1 = Vector2()
var c_pos2 = Vector2()
var c_count = 0;


#detects all input
func _input(event):
	#detects specificully LEFT MOUSE - stores the action in event
	if event is InputEventMouseButton and event.is_pressed():
		#print("click")
		if c_count == 0:
			c_pos1 = event.position
			c_count += 1
			#print("one")
		else:
			c_pos2 = event.position
			createOBJECT(c_pos1, c_pos2)
			c_count = 0
			#print("two")


#create a copy of the preloade sprite
func createOBJECT(pos1, pos2):
	var path = Sprite2D.new()

	path.texture = TEXTURE
	
	var delta_x = pos2[0]-pos1[0]
	var delta_y = pos2[1]-pos1[1]
	
	path.position.x = pos1[0]+(delta_x)/2
	path.position.y = pos1[1]+(delta_y)/2
	
	path.scale = Vector2(sqrt((delta_x*delta_x) + (delta_y*delta_y))/WIDTH, 1)
	path.rotation = atan((delta_y)/(delta_x));
	
	#stores the new child under current location
	add_child(path);
