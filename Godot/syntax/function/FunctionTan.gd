class_name FunctionTan extends AbstractFunction

#func parse(tokens, index):
#	var start = tokens.find("(")
#	var stop = tokens.find(")")
#	return index

func evaluate(environment):
	return tan(parameter.evaluate(environment))
	
func _to_string():
	return "FunctionTan(" + str(parameter) + ")" 
