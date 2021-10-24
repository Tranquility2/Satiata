extends Reference

func add_rect(pos, size):
	var new_rect = ColorRect.new()
	new_rect.set_position(pos)
	new_rect.set_size(size)
	new_rect.show()
	
	return new_rect

func randomize_rects_color():
	randomize()

	for x in range(Globals.COLUMNS):
		for y in range(Globals.ROWS):
			var current_rect : ColorRect = Globals.RECTS[x][y]
			var color_selection = randi() % Globals.RECT_COLORS.size()
			var rand_color = Globals.RECT_COLORS[color_selection]
			current_rect.color = rand_color
			current_rect.set_meta("color_selection", color_selection)

func draw_grid():
	for x in range(Globals.COLUMNS):
		Globals.RECTS.append([])
		for y in range(Globals.ROWS):
			var position = Vector2(Globals.DIMS+x*(Globals.DIMS+1), Globals.DIMS+y*(Globals.DIMS+1))
			var size = Vector2(Globals.DIMS, Globals.DIMS)
			var new_rect = add_rect(position, size)
			new_rect.connect("gui_input", Globals.MainScene.find_node("GridArea"), "_area_gui_input", [new_rect, [x,y]])
			Globals.RECTS[x].append(new_rect)
			Globals.MainScene.find_node("GridArea").add_child(new_rect)

func init_new_game():
	Globals.MainScene.find_node("ButtonsArea").show()
	Globals.MainScene.find_node("ButtonNewGame").hide()
	Globals.MainScene.find_node("GridArea").clear_area()
	Globals.RECTS = Array()
	Globals.move_counter = 0
	draw_grid()
	randomize_rects_color()
	
func rec_fill(x, y, input_color):
	var current_rect: ColorRect = Globals.RECTS[x][y]
	var current_color = current_rect.get_meta("color_selection")
	
	current_rect.color = Globals.RECT_COLORS[input_color]
	current_rect.set_meta("color_selection", input_color)
	if x > 0:
		if Globals.RECTS[x-1][y].get_meta("color_selection") == current_color:
			rec_fill(x-1, y, input_color)
	if y > 0:
		if Globals.RECTS[x][y-1].get_meta("color_selection") == current_color:
			rec_fill(x, y-1, input_color)
	if x < Globals.COLUMNS - 1:
		if Globals.RECTS[x+1][y].get_meta("color_selection") == current_color:
			rec_fill(x+1, y, input_color)
	if y < Globals.ROWS - 1:
		if Globals.RECTS[x][y+1].get_meta("color_selection") == current_color:
			rec_fill(x, y+1, input_color)

func play_turn(select_color):
	if select_color != Globals.RECTS[0][0].get_meta("color_selection"):
		Globals.move_counter += 1
		Globals.MainScene.find_node("StatusText").UpdateMoves()
		
		rec_fill(0, 0, select_color)

	if Globals.move_counter == Globals.MAX_MOVES:
		# Handle no more turns
		Globals.MainScene.find_node("ButtonsArea").hide()
		Globals.MainScene.find_node("ButtonNewGame").show()
