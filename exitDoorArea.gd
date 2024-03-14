extends Area2D

signal nextday

var inrange = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




func _on_body_entered(_body):
	inrange = true
func _on_body_exited(_body):
	inrange = false

func _input(event):
	if inrange == true:
		if global.workdone == true:
			if event.is_action_pressed("interact"):
				print("day advanced")
				global.day += 1
				global.workdone = false
				nextday.emit()


func _on_computertelepathybugfix_timeout():
	inrange = false
