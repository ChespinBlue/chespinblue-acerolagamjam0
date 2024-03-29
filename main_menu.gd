extends Control

var lookingatcontrols = false
signal startmusic
signal menuprint

#### controls
func _input(event):
	if event.is_action_pressed("click"):
		$controls2.visible = false
		lookingatcontrols = false
	if event.is_action_pressed("cancel"):
		$controls2.visible = false
		lookingatcontrols = false
func _on_controls_button_down():
	$controls2.visible = true
	lookingatcontrols = true

### start
func _on_start_pressed():
	if lookingatcontrols == false:
		get_tree().paused = false
		visible = false
		$titlemusic.stop()
		startmusic.emit()
		menuprint.emit()

### quit
func _on_quitgame_button_up():
	get_tree().quit()


func _on_titlemusic_finished():
	$titlemusic.play()

func _ready():
	get_tree().paused = true
