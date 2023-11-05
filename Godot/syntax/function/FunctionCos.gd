class_name FunctionCos extends AbstractFunction

#func parse(tokens, index):
#	var start = tokens.find("(")
#	var stop = tokens.find(")")
#	return index

func evaluate(environment):
	return cos(parameter.evaluate(environment))
	
func _to_string():
	return "FunctionCos(" + str(parameter) + ")" 
