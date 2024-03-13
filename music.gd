extends AudioStreamPlayer
func _on_music_start_timer_timeout():
	play()
func _process(delta):
	if global.day > 1:
		stop()

