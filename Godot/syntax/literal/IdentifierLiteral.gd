class_name IdentifierLiteral extends AbstractLiteral

var value : String

func _init(string):
	value = string

func evaluate(environment):
	return environment.Variables[value]
	
func _to_string():
	return "IdentifierLiteral(" + str(value) + ")"
