extends Node2D


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass

func _draw() -> void:
	# Draw Background
	draw_rect(Rect2(0, 0, Game.GRID_SIZE.x, Game.GRID_SIZE.y), Colors.WHITE)

	# Draw vertical lines
	for i in Game.CELL_AMOUNT.x:
		var from := Vector2(i * Game.CELL_SIZE.x, 0)
		var to := Vector2(from.x, Game.GRID_SIZE.y)

		draw_line(from, to, Colors.GRAY)

	# Draw horizontal lines
	for i in Game.CELL_AMOUNT.y:
		var from := Vector2(0, i * Game.CELL_SIZE.y)
		var to := Vector2(Game.GRID_SIZE.x, from.y)

		draw_line(from, to, Colors.GRAY)