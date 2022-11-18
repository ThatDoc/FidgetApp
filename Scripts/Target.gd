extends Node2D

var step: int

func _ready():
	step = rand_range(3, 5)

func _physics_process(delta):
	global_position.y += step
