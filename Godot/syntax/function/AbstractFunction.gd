class_name AbstractFunction extends AbstractSyntax

var parameter

func parse(tokens):
	#var right_paren = tokens.pop_front()
	#if not right_paren is RightParen:
	#	return false
	
	#var stop = tokens.find(right_paren.pair)
	##var to_parse = []
	#for i in range(stop):
	#	to_parse.push_back(tokens.pop_front())
	#tokens.pop_front()
	#parameter = Parser.parse(to_parse)
	parameter = tokens.pop_front()
	#print("function parse")
	return self

func evaluate(environment):
	return
	
func _to_string():
	return "AbstractFunction"
