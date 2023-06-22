extends Interactable

@export
var objectToInteractWith : Interactable

func interactionEvent():
	if objectToInteractWith != null:
		if objectToInteractWith.has_method("interactionEvent"):
			objectToInteractWith.interactionEvent()

	if $"Interaction Zone".has_overlapping_bodies()
