extends Node2D

var step = 16

@onready var tileMap = get_node("TileMap")
@onready var player = get_node("Player")

var currtile
var prevTile
var prevTileCoor

var grid_size = Vector2(2,2)
var grid = []


func _ready():
	print(tileMap.get_cell_atlas_coords(0, Vector2(1,0), false))
	
	#Creates the grid in code and puts it all in grid[], print(grid) and make grid_size Vector2(2,2) if 
	#you want to see what it looks like with "4" grids or 2x2 grid
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append({
				"Tile" : tileMap.get_cell_atlas_coords(0, Vector2(y , x), false),
				"TilePosition" : Vector2(x * step, y * step),
			})
	
	print(grid)
	
	
func _input(event):
	if event is InputEventMouseMotion:
		pass
		print("Event global positon: " + str(event.global_position))
		print("global position : " + str(get_global_mouse_position()))
		
		currtile = tileMap.local_to_map(get_global_mouse_position())
		prevTileCoor = tileMap.get_cell_atlas_coords(0, currtile, false)
		
	#tileMap.set_cell(0, currtile, 0, Vector2i(0,2), 0)
	#tileMap.set_cell(0, currtile, 0, Vector2i(0,2), 0)
	
	if Input.is_action_just_pressed("LeftClick"):
		player.move(currtile*16)
			
