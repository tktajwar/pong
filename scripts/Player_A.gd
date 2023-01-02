extends KinematicBody


var velocity = Vector3.ZERO

export var speed = 15


# Called when the node enters the scene tree for the first time.
func _ready():
	print(global_transform.origin.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.x += 1
	if Input.is_action_pressed("move_down"):
		direction.x -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	velocity.x = direction.x * speed 
	velocity = move_and_slide(velocity)
