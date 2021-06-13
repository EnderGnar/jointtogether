extends Node2D

var player = null
var ended= false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var player_scene = preload("res://objects/player.tscn")
	player = player_scene.instance()
	
	$game.add_child(player)

	create_rocket(400)
	create_diamond(600)

	pass # Replace with function body.

func add_score(_val):
	player.death()

func end_game():
	if ended: 
		return
	player.death()
	$foreground.showMe()
	ended = true


func create_rocket(y):
	var roc = preload("res://objects/rocket.tscn").instance()
	roc.position = Vector2(700, y)
	roc.set_speed(-100)
	$game.add_child(roc)

	var warn = preload("res://objects/warning.tscn").instance()
	warn.position = Vector2(550,y)
	warn.connectTo(roc)
	$game.add_child(warn)

func create_diamond(y):
	var dia = preload("res://objects/diamond.tscn").instance()
	dia.position = Vector2(y,200)
	dia.set_speed(-50)
	$game.add_child(dia)