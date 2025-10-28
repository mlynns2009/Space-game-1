extends Area2D
class_name laser
@export var speed = 25

func _ready():
	pass

func _process(delta):
	position.y -= speed
