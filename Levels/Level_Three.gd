extends Node2D

@onready
var key = $Collectable

@onready
var player = $Player


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_acid_area_body_entered(body):
	player.die()
	$RespawnTimer.start()





func _on_Collectable(body):
	$Lock.queue_free()
	$"Button/Interaction Zone".monitoring = true


func _on_button_entered(body):
	$Bridge.visible = true
	$Bridge.set_collision_layer_value(1,1)


func _on_respawn_timer_timeout():
	$PlayerSpawner.player = $Player
	$PlayerSpawner.spawnPlayer()
	player.resurrect()
