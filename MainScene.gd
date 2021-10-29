extends Node2D

func screen_metrics():
	print("                 [Screen Metrics]")
	print("            Display size: ", OS.get_screen_size())
	print("   Decorated Window size: ", OS.get_real_window_size())
	print("             Window size: ", OS.get_window_size())
	print("        Project Settings: Width=", ProjectSettings.get_setting("display/window/size/width"), " Height=", ProjectSettings.get_setting("display/window/size/height")) 
	print(OS.get_window_size().x)
	print(OS.get_window_size().y)

func resize_screen():
	OS.set_window_size(Vector2(320, 370))

func register_buttons():
	$ButtonsArea/ButtonBlue.connect("pressed", Globals.GameLogic, "play_turn", [Globals.BLUE_COLOR])
	$ButtonsArea/ButtonGreen.connect("pressed", Globals.GameLogic, "play_turn", [Globals.GREEN_COLOR])
	$ButtonsArea/ButtonRed.connect("pressed", Globals.GameLogic, "play_turn", [Globals.RED_COLOR])
	$ButtonsArea/ButtonYellow.connect("pressed", Globals.GameLogic, "play_turn", [Globals.YELLOW_COLOR])
	$ButtonNewGame.connect("pressed", Globals.GameLogic, "init_new_game")

func _ready():
	# get_tree().root.connect("size_changed", self, "screen_metrics")
	resize_screen()
	$StatusText.UpdateMoves()
	register_buttons()
	Globals.GameLogic.init_new_game()

func _init():
	Globals.MainScene = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
