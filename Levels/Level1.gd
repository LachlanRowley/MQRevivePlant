extends Node2D

@onready var player = $Player
@onready var wall = $wall
@onready var raycast1 = $Player/RayCast2D
@onready var raycast2 = $Player/RayCast2D2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
		player.die()



func _on_tp_area_body_entered(body):
	player.queue_free()
	$teleporter/AudioStreamPlayer2D.play("res://teleport.mp3")


func _input(event):
		if event.is_action_pressed("lever"):
			if (raycast1.is_colliding()||raycast2.is_colliding()):
				wall.queue_free()



