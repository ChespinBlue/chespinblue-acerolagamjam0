extends AudioStreamPlayer

func _input(event):
	if event.is_action_pressed("click"):
		if global.usingComputer == true:
			play()
