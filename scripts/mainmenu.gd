extends Control


var state = 0

var start = 0;
var goal = 0;

var elapsed = 0;
var speed = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	elapsed += delta

	if(elapsed >= speed):
		$Main.position = Vector2(goal,0)
		$Impressum.position = Vector2(goal+600,0)
	
	else:
		var x = goal*(elapsed/speed)+ start*((speed-elapsed)/speed)
		$Main.position = Vector2(x+0,0)
		$Impressum.position = Vector2(x+600,0)
	pass

func set_goal(to):
	start = goal
	goal = to
	elapsed = 0