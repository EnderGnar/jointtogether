extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0
	contact_monitor = true
	contacts_reported = 1
	pass # Replace with function body.

func set_speed(s):
	speed = s

func _physics_process(delta):
	apply_central_impulse(Vector2(delta * speed* mass,0))

	if(position.x <= -300):
		get_parent().remove_child(self)



func _on_rocket_body_entered(_body):
	get_parent().get_parent().end_game()
	$Explosion.emitting = true
	$Particle.emitting = false
	$Sprite.visible = false
	pass # Replace with function body.
