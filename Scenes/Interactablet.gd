extends Node2D
class_name Interactable

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_interaction_zone_body_entered(body):
	interactionEvent()
	
func interactionEvent():
	print("DO THING")
	
