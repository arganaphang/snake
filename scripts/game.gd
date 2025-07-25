extends Node

const GRID_SIZE := Vector2(512, 512)
const CELL_SIZE := Vector2(16, 16)
const CELL_AMOUNT := Vector2(GRID_SIZE.x / CELL_SIZE.x, GRID_SIZE.y / CELL_SIZE.y)
const SPEED = .075