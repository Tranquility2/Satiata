extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func UpdateMoves():
	var text_msg: String =  Globals.format_string.format({"current": Globals.move_counter, "max": Globals.MAX_MOVES})
	if Globals.move_counter < 21:
		text_msg += ", Select color"
	self.text = text_msg

func UpdateWin():
	self.text = "Very Nice!"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
