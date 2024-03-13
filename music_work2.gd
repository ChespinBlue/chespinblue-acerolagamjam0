extends AudioStreamPlayer

signal music2start
##second song
signal music22start
var day2started = false

func _process(delta):
	if global.day == 2:
		if day2started == false:
			music2start.emit()
			day2started = true


func _on_music_2_timer_timeout():
	play()
	print("eee")


func _on_finished():
	music22start.emit()
