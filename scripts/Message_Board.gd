extends Label

onready var t = $Message_Timer


func _ready():
	update_message("Get Ready!b")

func update_message(msg):
	text = msg

	## start up timer and wait
	t.start()
	yield(t, "timeout")

	text = ""
