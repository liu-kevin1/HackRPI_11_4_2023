extends Node2D
@onready var main = $".."

var test_points = [
  [0, 0],
  [1, 1],
  [2, 4],
  [3, 9]
]


# Creates a line node at the midpoint of all the points in the 'points' 2D array
func create_lines(points):
	if(points.size() == 1):
		return
	
	#var line = Node2D.new()
	#add_child.call_deferred()
	
	var x = (points[0][0] + points[1][0]) / 2
	var y = (points[0][1] + points[1][1]) / 2
	var _slope = ((points[1][1] - points[0][1]) / (points[1][0] - points[0][0]))
	
	#line.set_position(Vector2(x, y))
	main._draw.draw_line(Vector2(points[0][0], points[0][1]), Vector2(points[1][0], points[1][1]), Color(0.498039, 1, 0, 1), 1, false)
	
	#points.pop_front()
	#create_lines(points)

func _ready():
	create_lines(test_points)
