extends Sprite

var tex = [
	preload("res://assets/houses/house1.png"),
	preload("res://assets/houses/house2.png")
]



func _init():
	tex.shuffle()
	texture = tex[0]

	pass

func _ready():


	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
