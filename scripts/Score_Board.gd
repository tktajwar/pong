extends Label

onready var mboard = get_parent().get_node("Message_Board")

var score_A = 0
var score_B = 0


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
		update_score()
		mboard.update_message("Player B scored!")
	elif name == 'Goal_B':
		score_A += 1
		update_score()
		mboard.update_message("Player A scored!")
	else:
		push_warning("invalid goal name!")


func _on_Ball_foul(last_pusher):
	if last_pusher == 'Player_A':
		score_B += 1
		update_score()
		mboard.update_message("Player A fouled!")
	elif last_pusher == 'Player_B':
		score_A += 1
		update_score()
		mboard.update_message("Player B fouled!")
	else:
		push_warning("invalid last pusher name!")
