extends Area2D



func _ready():
	pass 
	
	
	
func _process(delta):
	if Input.is_action_pressed("player_right") and position.x < 1110:
		position.x +=10
	if Input.is_action_pressed("player_left") and position.x > 45:
		position.x -=10
	
