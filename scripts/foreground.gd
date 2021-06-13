extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var elapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func showMe():
	visible = true
	modulate = 0
	elapsed = 0

func _process(delta):
	elapsed += delta

	modulate = Color(1,1,1, min(1, elapsed*0.5))
	pass
