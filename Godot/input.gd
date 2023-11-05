extends Node


func _on_line_edit_text_submitted(new_text):
	global.run = true
	global.equation = new_text
	
