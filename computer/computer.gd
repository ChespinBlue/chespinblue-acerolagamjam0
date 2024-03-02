extends Control

@onready var screenWait = $screen_wait

var incomputerrange = false
var usingComputer = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if usingComputer == true:
		visible = true





func _input(event):
	if event.is_action_pressed("interact"):
		if incomputerrange == true:
			if usingComputer == false:
				usingComputer = true
				visible = true
				position.y = 210
	if event.is_action_pressed("cancel"):
		if incomputerrange == true:
			usingComputer = false
			
			screenWait.start()
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)




func _on_computer_area_body_exited(body):
	incomputerrange = false
func _on_computer_area_body_entered(body):
	incomputerrange = true


func _on_screen_transiton_timeout():
	if usingComputer == true:
		if position.y > 0:
			position.y -= 21
	elif usingComputer == false:
		if position.y > -200:
			position.y -= 21


func _on_screen_wait_timeout():
	visible = false


func _on_computertelepathybugfix_timeout():
	incomputerrange = false
