extends CharacterBody2D

@export var move_speed : float = 100

@export var starting_direction : Vector2 = Vector2(0, 2)

var incomputerrange = false
var keysbeingpressed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





#########making sure not double speed when pressing multiple keys
func _input(event):
	if event.is_action_pressed("right"):
		keysbeingpressed += 1
	if event.is_action_released("right"):
		keysbeingpressed -= 1
	if event.is_action_pressed("left"):
		keysbeingpressed += 1
	if event.is_action_released("left"):
		keysbeingpressed -= 1
	if event.is_action_pressed("up"):
		keysbeingpressed += 1
	if event.is_action_released("up"):
		keysbeingpressed -= 1
	if event.is_action_pressed("down"):
		keysbeingpressed += 1
	if event.is_action_released("down"):
		keysbeingpressed -= 1
		
	if event.is_action_pressed("interact"):
		if incomputerrange == true:
			pass
			
	if event.is_action_pressed("exit"):
		get_tree().quit()



func _physics_process(_delta):

	
	################# movement
	##stop double speed
	if keysbeingpressed == 2:
		move_speed = 71
	else:
		move_speed = 100
	##movement
	#make it so that you can't go in both direcrtions at once
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	# moves character 
	velocity = input_direction * move_speed
	move_and_slide()



##########computer reange!!!

func _on_computer_area_body_exited(body):
	incomputerrange = false
func _on_computer_area_body_entered(body):
	incomputerrange = true
