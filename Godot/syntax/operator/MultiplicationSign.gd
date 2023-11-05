class_name MultiplicationSign extends AbstractOperator

#var parameter : AbstractSyntax

func evaluate(environment):
	return left.evaluate(environment) * right.evaluate(environment)
	
func _to_string():
	return "MultiplicationSign(" + str(left) + ", " + str(right) + ")"
