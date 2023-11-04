extends Node
#pre-loads the texture file under rescources
var TEXTURE = load("res://icon.svg")

#detects all input
func _input(event):
	#detects specificully LEFT MOUSE - stores the action in event
	if event is InputEventMouseButton:
		print("click")
		createOBJECT(event.position)
		
		

#create a copy of the preloade sprite
func createOBJECT(mouse_pos):
	var newOBJECT = Sprite2D.new()
	newOBJECT.texture  = TEXTURE
	newOBJECT.position = mouse_pos
	#stores the new child under current location
	add_child(newOBJECT);
