extends Spatial


var score_A = 0
var score_B = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ball_goal(name):
	if name == 'Goal_A':
		score_B += 1
	elif name == 'Goal_B':
		score_A += 1
	else:
		push_warning("invalid goal name!")
