extends Control

var incomputerrange = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _input(event):
	if event.is_action_pressed("interact"):
		if incomputerrange == true:
			if visible == true:
				visible = false
			else:
				visible = true
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			visible = false
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)




func _on_computer_area_body_exited(body):
	incomputerrange = false
func _on_computer_area_body_entered(body):
	incomputerrange = true
