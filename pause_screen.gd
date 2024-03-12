extends Control


@onready var day = $day


# Called when the node enters the scene tree for the first time.
func _ready():
	day.text = str("day ", global.day)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	day.text = str("day ", global.day)

func _input(event):
	if event.is_action_pressed("exit"):
		visible = true
		get_tree().paused = true
		#get_tree().quit()



func _on_exit_pressed():
	get_tree().quit()
func _on_resume_pressed():
	visible = false
	get_tree().paused = false



