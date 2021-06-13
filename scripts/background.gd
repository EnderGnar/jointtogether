extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var last = 0

var last_street = 0

var speed = -50

var houses = []
var streets = []

var house_scene = preload("res://objects/house.tscn")
var street_scene = preload("res://objects/street.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	place_houses()
	place_street()
	pass # Replace with function body.

func place_houses():
	while last < 650:
		var house = house_scene.instance();
		house.position = Vector2(last, 712)
		houses.append(house)
		add_child(house)
		last += 8 * 32


func place_street():
	while last_street < 650:
		var street = street_scene.instance()
		street.position = Vector2(last_street, 800)
		streets.append(street)
		add_child(street)
		last_street += 600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	place_houses();
	place_street()

	last += speed*delta
	for house in houses:
		house.position.x += speed*delta
	
	if(houses.size() > 0 && houses[0].position.x < -256):
		var house = houses.pop_front()
		remove_child(house)
	
	last_street += speed*delta
	for street in streets:
		street.position.x += speed*delta

	if streets.size() > 0 && streets[0].position.x < -600:
		var street = streets.pop_front()
		remove_child(street)
	pass
