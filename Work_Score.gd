extends Control
@onready var workscoreS = $Label
@onready var workscoreColor = $Label/theme_override_colors/font_color
@onready var workscore = global.workscore

var red = Color(0.8,0.1,0.1,1.0)


# Called when the node enters the scne tree for the first time.
func _ready():
	workscoreS.text = str("Work Score: %",workscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	workscore = global.workscore
	workscoreS.text = str("Work Score: %",workscore)
	if workscore < 10:
		#workscoreColor = [1.00, 0.00, 0.00, 1.00]
		workscoreS.set("theme_override_colors/font_color",red)
		#pass
		
		


#func _input(event):
	#if event.is_action_pressed("test"):
		#workscore -= 10
		#workscoreS.text = str("Work Score: %",workscore)
		
		
		
