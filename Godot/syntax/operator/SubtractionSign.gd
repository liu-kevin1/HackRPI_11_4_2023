class_name SubtractionSign extends AbstractOperator

#var parameter : AbstractSyntax

func evaluate(environment):
	return left.evaluate(environment) - right.evaluate(environment)
	
func _to_string():
	return "SubtractionSign(" + str(left) + ", " + str(right) + ")"
