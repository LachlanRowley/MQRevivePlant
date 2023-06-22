extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_resurrector_body_entered(body):
	$Player.resurrect() # Replace with function body.


func _on_area_2d_body_entered(body):
	$Gun.queue_free() # Replace with function body.
	$Player.can_shoot = true

