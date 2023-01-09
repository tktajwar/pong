extends RigidBody

signal goal
signal foul

# initial speed of the ball
export var speed = 30

# at what force the ball gets pushed
export var force = 50

# the last thing that pushed the ball (used for foul)
var last_pusher = null


func reset_ball():
	## wait a moment then reset the ball position and start ball rolling timer
	
	var t = Timer.new()
	t.set_wait_time(0.5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	
	self.transform.origin = Vector3(0,1,0)
	self.linear_velocity = Vector3.ZERO
	$Timer_Start_Rolling.start()

func _on_Timer_Start_Rolling_timeout():
	var direction = Vector3()
	
	var dir_op = rand_range(0,1) > 0.5
	direction.z = speed
	if dir_op:
		direction.z = -direction.z
		
	direction.x = rand_range(-15,15)
	add_central_force(direction*force)


func _on_Ball_body_entered(body):
	if body is KinematicBody:
		last_pusher = body.name
		linear_velocity.z = speed if linear_velocity.z > 0 else -speed
	
	elif body is StaticBody:
		if body.is_in_group("Goal"):
			last_pusher = body.name
			emit_signal("goal", body.name)


func _on_Area_area_exited(area):
	
	if(area.name == 'GameArea'):
		# foul
		reset_ball()
		if(last_pusher != null):
			emit_signal("foul", last_pusher)
