extends Node


var database_global = ["Terms Found: "]
var is_counting = false  
var chapter_1_finish = false
var snack_given = false
var milk_given = false
var mister_mole = false
var stop_move = false
var run_dialog_opening = false
var incorrect_password = 0
var pickup = 0
var met_jackalope = false
	
# You can add a method to get the database if needed
func get_database() -> Array:
	return database_global

func set_database(word: String) -> void:
	if word not in database_global:
		database_global.append(word)
		print("Added to database global:", word)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
