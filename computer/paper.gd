extends Node2D

var paperscript = load("res://computer/paper.gd")

var paper_scene = preload("res://computer/paper.tscn")
@onready var parent_node = get_node("TileMap")



signal soundstartt

func _process(delta):
	var paper_scene = preload("res://computer/paper.tscn")


func _ready():
	$TileMap/paper.queue_free()
	pass

 


func spawnpaper():
	var new_paper = paper_scene.instantiate()
	soundstartt.emit()
	#$paper.queue_free()
	#var new_paper = paper_scene.instantiate()
	parent_node.add_child(new_paper)
	new_paper.position.x = 74
	new_paper.position.y = 90
	new_paper.name = "new_paper"
	



func _input(event):
	if event.is_action_pressed("test"):
		#queue_free()
		spawnpaper()
		pass
	if event.is_action_pressed("cancel"):
		#$TileMap/new_paper.queue_free()
		pass
