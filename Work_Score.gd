extends Control
@onready var workscoreS = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	workscoreS.text = str("Work Score: %",workscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var workscore = 60

func _input(event):
	if event.is_action_pressed("test"):
		workscore -= 10
		workscoreS.text = str("Work Score: %",workscore)
		
		
		
