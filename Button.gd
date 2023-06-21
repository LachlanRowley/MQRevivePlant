extends Interactable

@export
var objectToInteractWith : Interactable

func interactionEvent():
	if objectToInteractWith != null:
		objectToInteractWith.interactionEvent()
