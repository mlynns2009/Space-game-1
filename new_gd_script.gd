extends Area2D


func _ready():
	pass
	
	
	
func _process(delta):
		if Input.is_action_pressed("player_up") and position.y > 50:
			position.y -=10 
		if Input.is_action_pressed("player_down") and position.y < 600:
			position.y +=10 
		if Input.is_action_pressed("player_left") and position.x > 50:
			position.x -=10 
		if Input.is_action_pressed("player_right") and position.x < 1110:
			position.x +=10
