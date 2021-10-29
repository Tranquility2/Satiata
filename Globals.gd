extends Node2D

const COLUMNS = 18
const ROWS = 18
const DIMS = 15

const RECT_COLORS = [Color(1.0, 0.0, 0.0, 1.0),
					 Color(0.0, 0.0, 1.0, 1.0),
					 Color(0.0, 1.0, 0.0, 1.0),
					 Color(1.0, 1.0, 0.0, 1.0)]

const MAX_MOVES = 21

enum {RED_COLOR, 
	  BLUE_COLOR, 
	  GREEN_COLOR, 
	  YELLOW_COLOR}

var RECTS = null
var move_counter = 0
var format_string = "{current}/{max} Moves"

var GameLogic := preload("res://GameLogic.gd").new()

var MainScene = null
