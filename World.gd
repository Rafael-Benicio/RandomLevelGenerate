extends Node2D

var borders=Rect2(1,1,38,21)

onready var tileMap=$TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker= Walker.new(Vector2(19,21),borders)
	var map= walker.walk(500)
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location,-1)
	tileMap.update_bitmask_region(borders.position , borders.end)

func _input(event):
	if event.is_action_pressed("ui_right"):
		get_tree().reload_current_scene()
