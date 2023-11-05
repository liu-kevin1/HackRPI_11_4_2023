class_name AbstractOperator extends AbstractSyntax

var left
var right

func parse(tokens):
	self.right = tokens.pop_front()
	self.left = tokens.pop_front()
	#print("left", left, "right", right)
	return self

func evaluate(environment):
	return 
	
func _to_string():
	return "AbstractOperator"
