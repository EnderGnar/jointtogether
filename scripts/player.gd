extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var acc_strength = 10000

var links = []

var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100,100)
	links = generate_rope(10)
	
	gravity_scale = 0
	friction = 1
	
	pass # Replace with function body.


func get_move():
	var delta = Vector2(0,0)

	if dead: return delta

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
	var rope = []
	if length == 0: pass
	
	var curr = ropepart.instance()
	var offset = 7
	curr.position.y = offset
	get_parent().add_child(curr)
	
	var joint = PinJoint2D.new()
	get_parent().add_child(joint)
	
	joint.node_a = self.get_path()
	joint.node_b = curr.get_path()
	
	rope.append(joint)
	rope.append(curr.get_node("Pin"))
	
	for i in range(1, length):
		var next = ropepart.instance()
		next.position.y = offset+15*i
		rope.append(next.get_node("Pin"))
		
		get_parent().add_child(next)
		
		curr.connectTo(next)
		curr = next
	
	var tresor = preload("res://objects/tresor.tscn").instance()
	
	tresor.position.y = 15*(length-1) + 30
	
	get_parent().add_child(tresor)
	
	curr.connectTo(tresor)

	return rope
	
	
func _process(_dt):
	applied_force = Vector2()
	var delta = get_move()
	add_central_force(delta * acc_strength)
	
	var boundForce = 10000.0
	var border = 20
	var width = 600
	var height = 800
	
	if position.x < border && linear_velocity.x < 10:
		applied_force.x = max((border-position.x) * boundForce, applied_force.x)
	elif position.x > width-border && linear_velocity.x > 10:
		applied_force.x = min(((width-border)-position.x) * boundForce, applied_force.x)
	
	if position.y < border && linear_velocity.y < 10:
		applied_force.y = max((border-position.y) * boundForce, applied_force.y)
	elif position.y > height-border && linear_velocity.y > 10:
		applied_force.y = min(((height-border)-position.y) * boundForce, applied_force.y)


func death():
	var nil = NodePath("")
	dead = true
	for link in links:
		link.node_a = nil
		link.node_b = nil
		if link.get_parent() is RigidBody2D:
			var length = 200*randf()
			var a = randf()* PI*2
			
			var randvec = Vector2(length * cos(a), length * sin(a))
			link.get_parent().apply_central_impulse(randvec)
	
	

