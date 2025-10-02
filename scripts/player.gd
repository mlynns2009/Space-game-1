extends Area2D

@onready var laser_saved = preload("res://saved/laser.tscn")


	
func _process(delta):
	if Input.is_action_pressed("player_up") and position.y > 25:
		position.y -= 10 
	if Input.is_action_pressed("player_down") and position.y < 600:
		position.y += 10 
	if Input.is_action_pressed("player_left") and position.x > 35:
		position.x -= 10 
	if Input.is_action_pressed("player_right") and position.x < 1120:
		position.x += 10
	if Input.is_action_pressed("player_shoot"):
		var laser = laser_saved.instantiate()
		laser.position = position
		get_parent().add_child(laser)
		$AudioStreamPlayer.play()
