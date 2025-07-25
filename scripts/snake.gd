class_name Snake extends Node2D

var head := SnakeCell.new()
var snake_cells := [] as Array[SnakeCell]
var current_direction := Vector2.RIGHT;
var next_direction := Vector2.RIGHT;
var tween_move: Tween

func _ready() -> void:
	head.size = Game.CELL_SIZE
	head.color = Colors.BLUE_DARK
	snake_cells.push_front(head)

	tween_move = create_tween().set_loops()
	tween_move.tween_callback(move).set_delay(Game.SPEED)


func _process(_delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	for snake_cell in snake_cells:
		draw_rect(snake_cell.get_rect(), snake_cell.color)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_down") and current_direction != Vector2.UP:
		print("Down Pressed")
		next_direction = Vector2.DOWN
	if event.is_action_pressed("move_up") and current_direction != Vector2.DOWN:
		print("Up Pressed")
		next_direction = Vector2.UP
	if event.is_action_pressed("move_left") and current_direction != Vector2.RIGHT:
		print("Left Pressed")
		next_direction = Vector2.LEFT
	if event.is_action_pressed("move_right") and current_direction != Vector2.LEFT:
		print("Right Pressed")
		next_direction = Vector2.RIGHT
	
	# Test
	# if event.is_action_pressed("grow"):
	# 	grow()

func move() -> void:
	current_direction = next_direction
	var next_position = head.current_position + (current_direction * Game.CELL_SIZE)
	next_position.x = Utils.repeat(next_position.x, Game.GRID_SIZE.x)
	next_position.y = Utils.repeat(next_position.y, Game.GRID_SIZE.y)
	head.current_position = next_position

	# Move snake cells
	for i in range(1, snake_cells.size()):
		snake_cells[i].current_position = snake_cells[i - 1].previous_position

func grow() -> void:
	var snake_cell := SnakeCell.new()
	var last_snake_cell := snake_cells.back() as SnakeCell

	snake_cell.current_position = last_snake_cell.current_position
	snake_cell.color = Colors.BLUE
	snake_cell.size = Game.CELL_SIZE
	snake_cells.push_back(snake_cell)