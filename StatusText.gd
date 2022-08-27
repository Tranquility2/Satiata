extends RichTextLabel

func UpdateMoves():
	var text_msg: String =  Globals.format_string.format({"current": Globals.move_counter, "max": Globals.MAX_MOVES})
	if Globals.move_counter < 21:
		text_msg += ", Please select next color"
	self.text = text_msg

func UpdateWin():
	self.text = "Very Nice!"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
