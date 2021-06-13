extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rocket = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	var size = max(exp((600 - rocket.position.x)/100),0.3)

	print($Sprite.transform.get_scale())

	var need = size / $Sprite.transform.get_scale().x * 1.5

	$Sprite.transform = $Sprite.transform.scaled(Vector2(need, need))

	if rocket.position.x < 600:
		get_parent().remove_child(self)

func connectTo(roc):
	rocket = roc
