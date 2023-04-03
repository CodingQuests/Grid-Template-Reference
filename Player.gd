extends CharacterBody2D

var currPos = [0,0]
var step = 16

func _input(event):
	#Go 
	if Input.is_action_just_pressed("ui_right"):
		currPos[0] += step
	if Input.is_action_just_pressed("ui_left"):
		currPos[0] -= step
	if Input.is_action_just_pressed("ui_up"):
		currPos[1] -= step
	if Input.is_action_just_pressed("ui_down"):
		currPos[1] += step
	
	self.position = Vector2(currPos[0], currPos[1])
	
func move(tile):
	print(tile)
	currPos[0] = tile.x
	currPos[1] = tile.y
	
	self.position = Vector2(currPos[0], currPos[1])
