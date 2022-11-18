extends Node2D

class_name world

onready var L = $Bg/RailL
onready var R = $Bg/RailR

var target = preload("res://Scenes/Target.tscn")

var score: int setget set_score
var high_score: int setget set_high_score

func _ready():
	OS.set_window_position(
		OS.window_position - OS.get_screen_size() * 0.5 + OS.window_size * 0.5
		+ Vector2(0, OS.get_screen_size().y - OS.window_size.y))

func set_score(value):
	score = value
	
func set_high_score(value):
	high_score = value

func spawn_target():
	var i = target.instance()
	if randi() % 2:
		i.position = L.rect_position + Vector2(L.rect_size.x * 0.5, 0)
	else:
		i.position = R.rect_position + Vector2(R.rect_size.x * 0.5, 0)
	$Targets.add_child(i)

func _input(_event):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().quit()

func _on_Timer_timeout():
	spawn_target()
