extends Node
@onready var idle_guinea = $Idle_Guinea


func _on_line_edit_text_submitted(new_text):
	if(global.is_first):
		idle_guinea.queue_free()
		global.is_first = false
	
	global.run = true
	global.just_ran = false
	
	global.equation = new_text
