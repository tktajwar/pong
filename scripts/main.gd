extends Spatial

onready var ball = get_node("Ball")
onready var player_a = get_node("Player_A")
onready var player_b = get_node("Player_B")
onready var sboard = get_node("Score_Board")

const DATA_PATH = "res://data.json"

var data = []


func _ready():
	read_data()


func read_data():
	var file = File.new()
	if file.file_exists(DATA_PATH):
		print("Data file exists")
		file.open(DATA_PATH, File.READ)
		data = parse_json(file.get_as_text())
		file.close()
	else:
		print("Data file doesn't exist")
		data = []



func save_data():
	var file = File.new()
	file.open(DATA_PATH, File.WRITE)
	file.store_line(to_json(data))
	file.close()


func add_data(new_data):
	data.append(new_data)

func _on_Timer_Get_Data_timeout():
	var new_data = {
		## ball X, Z
		"B_X": ball.transform.origin.x,
		"B_Z": ball.transform.origin.z,
		## Players X, Z
		"PA_X": player_a.transform.origin.x,
		"PA_Z": player_a.transform.origin.z,
		"PB_X": player_b.transform.origin.x,
		"PB_Z": player_b.transform.origin.z,
		## Score
		"SA": sboard.get("score_A"),
		"SB": sboard.get("score_B"),
		## Ball Velocity
		"B_V_X": ball.linear_velocity.x,
		"B_V_Z": ball.linear_velocity.z,
	}
	
	print(new_data)
	add_data(new_data)


func _on_Timer_Save_Data_timeout():
	save_data()
