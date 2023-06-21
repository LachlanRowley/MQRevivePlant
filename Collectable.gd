extends Interactable

@export
var collect_name : String


func interactionEvent():
	Inventory.HELD_ITEMS.append(collect_name)
	print(Inventory.HELD_ITEMS)
	queue_free()
