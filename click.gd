extends AudioStreamPlayer

#func _input(event):
	#if event.is_action_pressed("click"):
		#play()


func _on_exit_pressed():
	play()


func _on_resume_pressed():
	play()
