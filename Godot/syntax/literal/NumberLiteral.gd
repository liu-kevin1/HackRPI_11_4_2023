class_name NumberLiteral extends AbstractLiteral

var value : float

func _init(string):
	value = float(string)
	
func evaluate(environment):
	return value
	
func _to_string():
	return "NumberLiteral(" + str(value) + ")"
