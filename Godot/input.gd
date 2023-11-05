extends Node
@onready var idle_guinea = $Idle_Guinea


func _on_line_edit_text_submitted(new_text):
	idle_guinea.queue_free()
	global.run = true
	global.equation = new_text
