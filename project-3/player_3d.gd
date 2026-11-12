extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 6


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_area_3da_body_entered(body: Node3D) -> void:
	pass # Replace with function body.
	print("I have entered the Start area")


func _on_area_3da_body_exited(body: Node3D) -> void:
	pass # Replace with function body.
	print("I have left the Start")


func _on_area_3dbt_body_exited(body: Node3D) -> void:
	pass # Replace with function body.
	print("I have left the Win area")
