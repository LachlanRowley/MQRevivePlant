extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0


var is_dead := false
var can_shoot := false


signal died
signal respawned

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@export
var aliveSprite : Resource
@export
var deadSprite : Resource

@onready
var ghost_shader = preload("res://Scenes/ghost_shader.gdshader")

func _physics_process(delta):
	if !is_dead:
		##Apply gravity
		if not is_on_floor():
			velocity.y += gravity * delta
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

	if is_dead:
		var vert_direction = Input.get_axis("ui_up","ui_down")
		velocity.y = vert_direction * SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _input(event):
	if event.is_action_pressed("Shoot"):
		if is_dead == false and can_shoot == true:
			shoot()

func killed():
	die()

func die():
	is_dead = true
	set_collision_layer_value(1,0)
	set_collision_mask_value(1,0)
	$PlayerSprite.play("Player_Ghost")
	emit_signal("died")

	set_collision_layer_value(5,0)

	
func resurrect():
	is_dead = false
	set_collision_layer_value(1,1)
	set_collision_mask_value(1,1)

	$PlayerSprite.play("Player_Alive")
	emit_signal("respawned")

	set_collision_layer_value(5,1)


func shoot():

	if($ShootRange.is_colliding()):
		if $ShootRange.get_collider().is_class("CharacterBody2D"):
			$ShootRange.get_collider().queue_free()
		
	else:
		pass
	
		
