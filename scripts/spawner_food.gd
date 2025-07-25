extends Node2D

var food := Food.new()
@onready var snake := %snake as Snake

func _ready() -> void:
	spawn_food()


func _process(_delta: float) -> void:
	queue_redraw()

	# Eat
	if food.get_rect().intersects(snake.head.get_rect()):
		snake.grow()
		spawn_food()

func _draw() -> void:
	draw_rect(food.get_rect(), food.color)

func spawn_food() -> void:
	var is_reserved_position = true

	while is_reserved_position:
		var random_position = Vector2()
		random_position.x = randi_range(0, int(Game.GRID_SIZE.x - Game.CELL_SIZE.x))
		random_position.y = randi_range(0, int(Game.GRID_SIZE.y - Game.CELL_SIZE.y))
		food.position = random_position.snapped(Game.CELL_SIZE)

		# Check is position reserved
		for snake_cell in snake.snake_cells:
			var is_intersect = food.get_rect().intersects(snake_cell.get_rect())
			is_reserved_position = is_intersect
			if is_intersect:
				break
