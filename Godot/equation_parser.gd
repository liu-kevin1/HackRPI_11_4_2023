class_name Parser extends Node

static var functions := [
	"sin",
	"cos",
	"tan"
]
static var single_characters := [
	"(",
	")",
	"+",
	"-",
	"*",
	"/",
	"^"
]

static func make_token(string):
	var token : AbstractSyntax
	
	if string in functions:
		if string == "sin":
			token = FunctionSin.new()
	elif string in single_characters:
		if string == "+":
			token = AdditionSign.new()
		elif string == "-":
			token = SubtractionSign.new()
		elif string == "*":
			token = MultiplicationSign.new()
		elif string == "/":
			token = DivisionSign.new()
		elif string == "^":
			token = ExponentSign.new()
		elif string == "(":
			token = LeftParen.new()
		elif string == ")":
			token = RightParen.new()
	elif string.is_valid_float():
		token = NumberLiteral.new(string)
	else:
		token = IdentifierLiteral.new(string)
	
	return token

"""

1. Create a Stack called opstack for keeping operators.

2. Create an empty String for output.

3. Use the Tokenizer to convert the input to tokens.

4. While there are tokens remaining in the input:
o If the token is an operand, append it to the end of the output.
o If the token is a left parenthesis, push it on the opstack.
o If the token is a right parenthesis, pop the opstack until the corresponding left
parenthesis is removed. Append each operator to the output.
o If the token is an operator, push it onto the opstack. However, first pop any
operators already on the opstack that have higher or equal precedence and
append them to the output. (Stop popping once you reach a non-operator
token or an operator with a lower precedence.)

5. When the input expression has been completely processed, check the opstack. Any
operators still on the stack can be popped and appended to the end of the output list.
"""

static func infix_to_postfix(tokens):
	var opstack = []
	
	var output = []
	
	while len(tokens) > 0:
		var token = tokens.pop_front()
		#print("---------------------------")
		#print("token", token)
		#print("tokens", tokens)
		#print("opstack", opstack)
		#print("output", output)
		
		if token is AbstractLiteral: #or token is AbstractFunction:
			output.push_back(token)
		elif token is AbstractFunction:
			opstack.push_front(token)
		else:
			if token is LeftParen:
				opstack.push_front(token)
				output.push_back(token)
			elif token is RightParen:
				while len(opstack) > 0 and not opstack[0] is LeftParen:
					output.push_back(opstack.pop_front())
				if len(opstack) == 0:
					#print("0 length opstack")
					print("0 length opstack what do we do")
					return
				token.pair = opstack.pop_front()
				token.pair.pair = token
				output.push_back(token)
			else:
				while len(opstack) > 0 and (opstack[0] is AbstractFunction or opstack[0] is MultiplicationSign or opstack[0] is DivisionSign or opstack[0] is ExponentSign):
					output.push_back(opstack.pop_front())
				opstack.push_front(token)
	
	while len(opstack) > 0:
		output.push_back(opstack.pop_front())
	
	return output

static func tokenize(equation):
	var tokens := []
	var current := ""
	equation = equation.replace(" ", "")
	var paren_stack = []
	
	for c in equation:
		if c in single_characters:
			if len(current) > 0:
				tokens.append(make_token(current))
				
			tokens.append(make_token(c))
			current = ""
			
		elif len(c) > 0:
			if current.is_valid_float() != c.is_valid_float():
				if len(current) > 0:
					tokens.append(make_token(current))
					tokens.append(MultiplicationSign.new())
				current = ""
			current += c
			if current in functions:
				tokens.append(make_token(current))
				current = ""
	
	if len(current) > 0:
		tokens.append(make_token(current))
	
	return tokens

static func parse(tokens):
	var current = Array(tokens)
	var stack = []
	
	while len(current) > 0:
		#print("------------")
		#print("current - ", current)
		#print("stack - ", stack)
		#print(len(current))
		var token = current.pop_front()
		#print("token - ", token)
		if token.parse != null:
			#print("parse for ", token)
			var result = token.parse(stack)
			#var add = result
			#var skip = 0
			#if not result is AbstractSyntax:
			#	add = result[0]
			#	skip = result[1]
			if result != null:
				stack.push_front(result)
			#for i in range(skip):
			#	current.pop_front()
		else:
			stack.push_front(token)
			
	return stack

static func evaluate(token, environment):
	return token.evaluate(environment)

static func process_equation(equation, start, stop, step):
	var results = []
	var scale = 1/step
	for i in range(start*scale, stop*scale, step*scale):
		var tokens = tokenize(equation)
		#print("Tokens")
		#print(tokens)
		var infix = infix_to_postfix(tokens)
		#print("Infix")
		#print(infix)
		var stack = parse(infix)
		#print("Stack")
		#print(stack)
		var env = {
			"Variables": {
				"x": i/scale
			}
		}
		var result = evaluate(stack.pop_front(), env)
		print("Result")
		print(result)
		results.push_back(Vector2(i/scale, result))
	return results

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready and starting")
	var test_equation := "sin(4x)-3"
	var start := 0
	var stop := 4
	var step := 1
	
	print(process_equation(test_equation, start, stop, step))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
