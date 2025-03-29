extends Area2D

@onready var dialog_one_ran = false
@onready var dialog_two_ran = false
@onready var dialog_three_ran = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#Dialogic.signal_event.connect(_on_dialogic_signal)
	#print("Dialogic signal connected")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func _on_dialogic_signal(argument: String):
#	print("Dialogic signal received with argument: ", argument)  # Debug log
#	if argument == "1":
#		print("Starting dialog_1")
#		Dialogic.start("dialog_1")
#	elif argument == "2":
#		print("Starting dialog_1")
#		Dialogic.start("dialog_1")
#	else:
#		print("Unknown argument passed: ", argument)

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print("Player entered Area2D")
		if "shot" in body.get_database() and dialog_three_ran == true:
			Dialogic.start("dialog_4")
		if "shot" in body.get_database() and dialog_three_ran == false:  # Check if player has the get_database method
			if dialog_one_ran == true:
				Dialogic.start("dialog_3")
				dialog_three_ran = true
			else:
				Dialogic.start("dialog_1")
				body.set_database("word")
				dialog_one_ran = true
		elif "word" in body.get_database():  # Check if player has the get_database method
			if "shot" not in body.get_database():
				Dialogic.start("dialog_2")
				dialog_two_ran = true
		else:
			Dialogic.start("dialog_1")
			body.set_database("word")
			dialog_one_ran = true
