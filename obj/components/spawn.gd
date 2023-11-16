@tool
extends Sprite2D

enum FACING_DIR {RIGHT, LEFT}

@export var facing : FACING_DIR = FACING_DIR.RIGHT:
	set(value):
		facing = value
		flip_h = facing == FACING_DIR.LEFT
	

