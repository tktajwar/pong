extends KinematicBody

onready var ball = get_parent().get_node("Ball")

export var speed = 15

var velocity = Vector3.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = baddie(ball)

	velocity.x = x * speed

	velocity = move_and_slide(velocity)


func baddie(target):
	## follows target
	
	var diff = target.global_transform.origin.x - global_transform.origin.x
	
	if diff>1:
		if global_transform.origin.x<5:
			return(1)
	elif diff<-1:
		if global_transform.origin.x>-5:
			return(-1)
	return(0)
