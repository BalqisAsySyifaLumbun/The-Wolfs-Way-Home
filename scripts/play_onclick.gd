extends Area2D

# Function to handle the input (mouse click)
func _input_event(viewport, event, shape_idx):
	# Check if it's a mouse button event (left click)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			get_tree().change_scene_to_file("res://scenes/scene_1.tscn")
