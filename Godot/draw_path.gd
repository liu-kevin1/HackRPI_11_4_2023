class_name Drawer extends Node
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
			createOBJECT(c_pos1, c_pos2, 1)
			c_count = 0
			#print("two")


#create a copy of the preloade sprite
func createOBJECT(pos1, pos2, scale):
	var path = Sprite2D.new()

	path.texture = TEXTURE
	
	var delta_x = (pos2[0]-pos1[0]) * scale
	var delta_y = (pos2[1]-pos1[1]) * scale
	
	path.position.x = (pos1[0]+(delta_x)/2) * scale
	path.position.y = (pos1[1]+(delta_y)/2) * scale
	
	path.scale = Vector2(sqrt((delta_x*delta_x)*scale + (delta_y*delta_y))/WIDTH*scale, 1)
	path.rotation = atan((delta_y)/(delta_x));
	print("positions: ", pos1, pos2)
	print("path pos: " + str(path.position))
	print("scale: " + str(path.scale))
	print("rotation: " + str(path.rotation))
	
	#stores the new child under current location
	add_child(path);
