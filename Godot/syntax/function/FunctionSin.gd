class_name FunctionSin extends AbstractFunction

#func parse(tokens, index):
#	var start = tokens.find("(")
#	var stop = tokens.find(")")
#	return index

func evaluate(environment):
	return sin(parameter.evaluate(environment))
	
func _to_string():
	return "FunctionSin(" + str(parameter) + ")" 
