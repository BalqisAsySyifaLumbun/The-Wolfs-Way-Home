extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if "gate" not in Global.get_database():	
		Global.set_database("gate")
		Global.set_database("wheel")
		Global.set_database("sun")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(viewport, event, shape_idx):
	# Check if it's a mouse button event (left click)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Global.run_dialog_opening = false
			get_tree().change_scene_to_file("res://scenes/scene_repent.tscn")
			
