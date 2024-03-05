extends Control
@onready var workscoreS = $Label
@onready var workscoreColor = $Label/theme_override_colors/font_color
# Called when the node enters the scne tree for the first time.
func _ready():
	workscoreS.text = str("Work Score: %",workscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if workscore < 0:
		#workscoreColor = [1.00, 0.00, 0.00, 1.00]
		pass
		
		
var workscore = 50

func _input(event):
	if event.is_action_pressed("test"):
		workscore -= 10
		workscoreS.text = str("Work Score: %",workscore)
		
		
		
