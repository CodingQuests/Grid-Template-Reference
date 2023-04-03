extends Node2D


@onready var tileMap = get_node("TileMap")
@onready var player = get_node("Player")

var currtile
var prevTile
var prevTileCoor

func _input(event):
	if event is InputEventMouseMotion:
		pass
		#print(event.global_position)
	currtile = tileMap.local_to_map(get_global_mouse_position()*16)
	prevTileCoor = tileMap.get_cell_atlas_coords(0, currtile, false)
	
	
	#tileMap.set_cell(0, currtile, 0, Vector2i(0,2), 0)
	#tileMap.set_cell(0, currtile, 0, Vector2i(0,2), 0)
	
	if Input.is_action_just_pressed("LeftClick"):
		player.move(currtile)
			
