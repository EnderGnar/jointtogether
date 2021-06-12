extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move_speed = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100,100)
	var _end = generate_rope(20)
	
	pass # Replace with function body.


func get_move():
	var delta = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		delta.y += -1
	if Input.is_action_pressed("ui_down"):
		delta.y += 1
	if Input.is_action_pressed("ui_left"):
		delta.x += -1
	if Input.is_action_pressed("ui_right"):
		delta.x += 1
	
	if delta.length() == 0: return delta
	
	delta = delta.normalized()
	return delta
	
	
func generate_rope(length):
	var ropepart = preload("res://objects/ropepart.tscn")
	if length == 0: pass
	
	var curr = ropepart.instance()
	var offset = 7
	curr.position.y = offset
	get_parent().add_child(curr)
	
	var joint = PinJoint2D.new()
	get_parent().add_child(joint)
	
	joint.node_a = self.get_path()
	joint.node_b = curr.get_path()
	
	
	for i in range(1, length):
		var next = ropepart.instance()
		next.position.y = offset+15*i
		
		get_parent().add_child(next)
		
		curr.get_node("Pin").node_b = next.get_path()
		curr = next
	return curr
	
	
func _process(dt):
	var delta = get_move()
	move_and_slide(delta * move_speed)
	

