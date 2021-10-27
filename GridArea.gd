extends ColorRect

func clear_area():
	var child_array = self.get_children()
	for c in child_array:
		c.queue_free()

func cycle_color(rect: ColorRect):
	var current_color = rect.get_meta("color_selection")
	
	var new_color_selection = 0 
	
	if current_color != null:
		new_color_selection = current_color + 1
		if new_color_selection >= len(Globals.RECT_COLORS):
			new_color_selection = 0

	rect.color = Globals.RECT_COLORS[new_color_selection]
	rect.set_meta("color_selection", new_color_selection)

#func _ready():
#	pass

func _area_gui_input(event, rect, loc):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if OS.is_debug_build():
				print("Left button was clicked at ", event.position, " on " , str(loc), " id: ", str(rect))
				cycle_color(rect)

func color_swap_effect():
	var timer = Timer.new()
	timer.set_wait_time(0.1)
	timer.set_one_shot(false)
	timer.connect("timeout", Globals.GameLogic, "randomize_rects_color")
	self.add_child(timer)
	timer.start()
	
	return timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
