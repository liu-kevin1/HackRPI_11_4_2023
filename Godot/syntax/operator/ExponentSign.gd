class_name ExponentSign extends AbstractOperator

#var parameter : AbstractSyntax

func evaluate(environment):
	return left.evaluate(environment) ^ right.evaluate(environment)
	
func _to_string():
	return "ExponentSign(" + str(left) + ", " + str(right) + ")"
