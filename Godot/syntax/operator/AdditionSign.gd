class_name AdditionSign extends AbstractOperator

#var parameter : AbstractSyntax

func evaluate(environment):
	return left.evaluate(environment) + right.evaluate(environment)
	
func _to_string():
	return "AdditionSign(" + str(left) + ", " + str(right) + ")"
