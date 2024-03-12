extends Area2D
var innoterange = false
@onready var chutenote = $chutenote
var lookingatnote = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if innoterange == false:
		chutenote.visible = false
		




func _input(event):
	if event.is_action_pressed("interact"):
		if innoterange == true:
			chutenote.visible = true
			lookingatnote = true
	if event.is_action_pressed("cancel") or event.is_action_pressed("click"):
		chutenote.visible = false
		lookingatnote = false


func _on_body_entered(body):
	innoterange = true
func _on_body_exited(body):
	innoterange = false

func _on_computertelepathybugfix_timeout():
	innoterange = false
