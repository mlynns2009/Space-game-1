

extends Area2D

@onready var laser_saved = preload("res://saved/laser.tscn")
@onready var explosion_saved = preload("res://saved/explosion.tscn")
signal player_killed

var is_dead = false

func _ready():
	# Connect to area_entered signal
	connect("area_entered", Callable(self, "_on_area_entered"))

func _process(delta):
	if is_dead:
		return
	
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

func _on_area_entered(area):
	if is_dead:
		return
	
	if area.is_in_group("enemies"):
		# Play explosion
		var explosion = explosion_saved.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)

		is_dead = true
		emit_signal("player_killed")
		hide() # Or queue_free() if you want to remove the player immediately

		# Optional: delay scene reload
		await get_tree().create_timer(1.0).timeout
		get_tree().reload_current_scene()
