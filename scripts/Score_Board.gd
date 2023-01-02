extends Label


var score_A = 0
var score_B = 0

var last_scorer = null


# Called when the node enters the scene tree for the first time.
func _ready():
	update_score()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func update_score():
	text = "Player A Score: " + String(score_A) + "    Player B Score: " + String(score_B)

func _on_Ball_goal(name):
	if name == 'Goal_A':
		score_B += 1
		last_scorer = name
	elif name == 'Goal_B':
		score_A += 1
		last_scorer = name
	else:
		push_warning("invalid goal name!")
	update_score()


func _on_Ball_foul(last_pusher):
	print(last_pusher)
	if last_pusher == 'Player_A':
		score_B += 1
		last_scorer = name
	elif last_pusher == 'Player_B':
		score_A += 1
		last_scorer = name
	else:
		push_warning("invalid last pusher name!")
