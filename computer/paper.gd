extends Node2D

const paper_scene = preload("res://computer/paper.tscn")


func _ready():
	pass # Replace with function body.
func _process(delta):
	pass



func spawnpaper():
	$paper.queue_free()
	$paper.get_tree().reload_current_scene()



func _input(event):
	if event.is_action_pressed("test"):
		#queue_free()
		spawnpaper()
