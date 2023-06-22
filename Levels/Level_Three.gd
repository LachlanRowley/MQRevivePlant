extends Node2D

@onready
var key = $Collectable

@onready
var player = $Player



func _ready():
	player.connect("died", on_player_died)
	player.connect("respawned", on_player_respawn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_player_died():
	print("A")
	$TileMap.material.shader = $Player.ghost_shader

func on_player_respawn():
	$TileMap.material.shader = null

func _on_acid_area_body_entered(body):
	player.die()
	player.position.y -= 10
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
