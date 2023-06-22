extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var direction := -1

enum state {IDLE, ACTIVE}
var cur_state = state.IDLE

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if($Vision.is_colliding()):
		###SPOTTED PLAYER
		direction = $Vision.scale.x
		cur_state = state.ACTIVE
		if $ShootTimer.is_stopped():
			shoot()
	
	if cur_state == state.IDLE:
		pass
		
	if cur_state == state.ACTIVE:
		###Can't go left
		if $Right.is_colliding() and !$Left.is_colliding(): 
			direction = 1
		if !$Right.is_colliding() and $Left.is_colliding():
			direction = -1
			
		$Vision.scale.x = direction
		$Sprite2D.scale.x = direction
		
#		velocity.x = direction * SPEED

	move_and_slide()


func shoot():
	$ShootTimer.start()


func _on_shoot_timer_timeout():
	if $Vision.is_colliding:
		if $Vision.get_collider() != null:
			$Vision.get_collider().killed()

