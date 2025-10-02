extends Node2D

@onready var enemy_saved = preload("res://saved/enemy.tscn")

var score = 0

func _ready():
	_update_ui()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_timer_timeout():
	var enemy = enemy_saved.instantiate()
	var random_x = randi_range(50,1100)
	enemy.position = Vector2(random_x,30)
	enemy.enemy_killed.connect(_on_enemy_killed)
	add_child(enemy)

	
func _update_ui():
	$game_ui/score_label.text = "score: " + str(score)
	

func _on_enemy_killed():
	score += 20
	_update_ui()
func _on_restart_timer_timeout():
	get_tree().reload_current_scene()


func _on_button_pressed():
	get_tree().quit()
