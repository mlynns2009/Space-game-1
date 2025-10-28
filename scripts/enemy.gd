extends Area2D
class_name enemy

@export var speed = 3
@onready var explosion_saved = preload("res://saved/explosion.tscn")

signal enemy_killed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed

func _on_area_entered(area):
	if area is laser:
		var explosion = explosion_saved.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
		area.queue_free()
		enemy_killed.emit()







	
