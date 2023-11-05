class_name DivisionSign extends AbstractOperator

#var parameter : AbstractSyntax

func evaluate(environment):
	return left.evaluate(environment) / right.evaluate(environment)
	
func _to_string():
	return "DivisionSign(" + str(left) + ", " + str(right) + ")"
