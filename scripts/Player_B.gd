extends KinematicBody

onready var ball = get_parent().get_node("Ball")

export var speed = 15

export var baddie_mdiff = 3

var velocity = Vector3.ZERO
var diff = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = baddie()

	velocity.x = x * speed

	velocity = move_and_slide(velocity)


func baddie():
	## follows target
	if diff>baddie_mdiff:
		if global_transform.origin.x<5:
			return(1)
	elif diff<-baddie_mdiff:
		if global_transform.origin.x>-5:
			return(-1)
	return(0)


func _on_Check_Ball_timeout():
	diff = ball.global_transform.origin.x - global_transform.origin.x
	print(diff)
