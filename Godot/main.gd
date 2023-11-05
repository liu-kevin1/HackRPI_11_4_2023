extends Node

#var drawer

# Called when the node enters the scene tree for the first time.
func _ready():
	print("test")
	var equation = "2sin(x)+5"
	var start = 0
	var stop = 10
	var step = 0.5
	var results = Parser.process_equation(equation, start, stop, step)
	print_tree()
	var drawer = get_node("..")
	#var drawer = $draw_sprite2
	#print(drawer)
	#drawer.reparent(Node2D)
	#drawer.reparent(self)
	for i in range(len(results)):
		results[i][0] = results[i][0] + 100
		results[i][1] = results[i][1] + 100
	
	for i in range(len(results)-1):
		drawer.createOBJECT(results[i], results[i+1], 20)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
