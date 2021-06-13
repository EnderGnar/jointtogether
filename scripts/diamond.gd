extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_speed(s):
	speed = s

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += speed*delta

	if(position.x < -250):
		get_parent().remove_child(self)
	pass


func _on_diamond_body_entered(_body):
	get_parent().get_parent().add_score(1)
	pass # Replace with function body.
